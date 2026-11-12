package com.hougo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Servlet xu ly Dang nhap, Chon ca lam viec va Dang xuat cho he thong noi bo Nha hang Lau HOUGO.
 */
@WebServlet(urlPatterns = {"/login", "/logout"})
public class AuthServlet extends HttpServlet {

    private static final class StaffAccount {
        final String username;
        final String fullName;
        final String role;
        final String shortCode;
        final String targetPath;
        final boolean active;

        StaffAccount(String username, String fullName, String role, String shortCode, String targetPath, boolean active) {
            this.username = username;
            this.fullName = fullName;
            this.role = role;
            this.shortCode = shortCode;
            this.targetPath = targetPath;
            this.active = active;
        }
    }

    private static final Map<String, StaffAccount> STAFF_DIRECTORY = new HashMap<>();
    private static final Set<String> VALID_SHIFTS = Set.of("Ca Sáng", "Ca Chiều", "Ca Tối");

    static {
        STAFF_DIRECTORY.put("admin.hai", new StaffAccount("admin.hai", "Nguyễn Hoàng Hải", "Quản trị viên", "QT", "/admin", true));
        STAFF_DIRECTORY.put("pos.linh", new StaffAccount("pos.linh", "Phạm Thùy Linh", "Thu ngân POS", "TN", "/pos", true));
        STAFF_DIRECTORY.put("kds.nam", new StaffAccount("kds.nam", "Lê Hoàng Nam", "Điều phối Bếp", "BP", "/kitchen", true));
        STAFF_DIRECTORY.put("srv.minh", new StaffAccount("srv.minh", "Nguyễn Văn Minh", "Phục vụ", "PV", "/pos", true));
        STAFF_DIRECTORY.put("srv.lan", new StaffAccount("srv.lan", "Trần Thị Lan", "Phục vụ", "PV", "/pos", true));
        STAFF_DIRECTORY.put("kds.khanh", new StaffAccount("kds.khanh", "Vũ Quốc Khánh", "Điều phối Bếp", "BP", "/kitchen", false));
    }

    private String resolveShiftShort(String shift) {
        if ("Ca Sáng".equals(shift)) return "Sáng";
        if ("Ca Chiều".equals(shift)) return "Chiều";
        return "Tối";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/logout".equals(path) || "logout".equals(req.getParameter("action"))) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect(req.getContextPath() + "/login?loggedOut=1");
            return;
        }

        if ("1".equals(req.getParameter("loggedOut"))) {
            req.setAttribute("loggedOut", Boolean.TRUE);
        }
        req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rawUser = req.getParameter("username");
        String rawPass = req.getParameter("password");
        String rawShift = req.getParameter("shift");
        String quickRoleUser = req.getParameter("quickDemoUser");

        String username = (quickRoleUser != null && !quickRoleUser.isBlank())
            ? quickRoleUser.trim().toLowerCase()
            : (rawUser == null ? "" : rawUser.trim().toLowerCase());
        String shift = (rawShift != null && VALID_SHIFTS.contains(rawShift)) ? rawShift : "Ca Tối";

        if (username.isEmpty()) {
            req.setAttribute("errorMsg", "Vui lòng nhập tên tài khoản nhân sự trước khi đăng nhập.");
            req.setAttribute("selectedShift", shift);
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            return;
        }

        if ((quickRoleUser == null || quickRoleUser.isBlank()) && (rawPass == null || rawPass.isBlank())) {
            req.setAttribute("errorMsg", "Vui lòng nhập mật khẩu (gợi ý demo: 123456) hoặc dùng nút Đăng nhập nhanh.");
            req.setAttribute("enteredUser", username);
            req.setAttribute("selectedShift", shift);
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            return;
        }

        StaffAccount account = STAFF_DIRECTORY.get(username);
        if (account == null) {
            req.setAttribute("errorMsg", "Không tìm thấy tài khoản \"" + username + "\". Hãy thử admin.hai, pos.linh hoặc kds.nam.");
            req.setAttribute("enteredUser", username);
            req.setAttribute("selectedShift", shift);
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            return;
        }

        if (!account.active) {
            req.setAttribute("errorMsg", "Tài khoản \"" + account.username + "\" hiện đang bị khóa. Vui lòng liên hệ Quản trị viên.");
            req.setAttribute("enteredUser", username);
            req.setAttribute("selectedShift", shift);
            req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(true);
        session.setAttribute("authUsername", account.username);
        session.setAttribute("authFullName", account.fullName);
        session.setAttribute("authRole", account.role);
        session.setAttribute("authShortCode", account.shortCode);
        session.setAttribute("authShift", shift);
        session.setAttribute("authShiftShort", resolveShiftShort(shift));

        resp.sendRedirect(req.getContextPath() + account.targetPath);
    }
}

