package com.hougo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/pos", "/pos/so-do-ban"})
public class PosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Sau này sẽ load List<BanAn> từ BanService rồi gắn vào req.setAttribute("danhSachBan", list) tại đây
        req.getRequestDispatcher("/WEB-INF/views/pos/so-do-ban.jsp").forward(req, resp);
    }
}