package com.hougo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * Servlet dieu huong giao dien Quan tri vien (Admin Portal) cho Nha hang Lau HOUGO.
 */
@WebServlet(urlPatterns = {"/admin", "/admin/dashboard"})
public class AdminServlet extends HttpServlet {

    private static final Set<String> VALID_TABS = Set.of(
        "reports",
        "bookings",
        "menu",
        "tables",
        "accounts"
    );

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tabParam = req.getParameter("tab");
        String activeTab = (tabParam != null && VALID_TABS.contains(tabParam)) ? tabParam : "reports";
        req.setAttribute("activeTab", activeTab);
        req.getRequestDispatcher("/WEB-INF/views/admin/admin-portal.jsp").forward(req, resp);
    }
}

