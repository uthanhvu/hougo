package com.hougo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/dat-ban"})
public class DatBanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hoTen = req.getParameter("hoTen");
        String soDienThoai = req.getParameter("soDienThoai");
        String soKhach = req.getParameter("soKhach");
        String ngayGio = req.getParameter("ngayGio");
        String chiNhanh = req.getParameter("chiNhanh");
        String ghiChu = req.getParameter("ghiChu");
        String combo = req.getParameter("selectedCombo");

        // Log kiểm tra dữ liệu nhận từ form
        System.out.println("=== THÔNG TIN ĐẶT BÀN MỚI ===");
        System.out.println("Khách hàng: " + hoTen + " - SĐT: " + soDienThoai);
        System.out.println("Số khách: " + soKhach + " | Thời gian: " + ngayGio + " | Chi nhánh: " + chiNhanh);
        System.out.println("Gói chọn: " + combo + " | Ghi chú: " + ghiChu);

        // Chuyển hướng về trang chủ kèm thông báo thành công
        resp.sendRedirect(req.getContextPath() + "/?datBanThanhCong=true");
    }
}