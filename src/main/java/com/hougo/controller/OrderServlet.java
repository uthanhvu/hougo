package com.hougo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/pos/order"})
public class OrderServlet extends HttpServlet {

    private static final class TableSeed {
        final int id;
        final String name;
        final String floorLabel;
        final int guestsCount;
        final String staff;
        final String durationText;
        final String presetKey;

        TableSeed(int id, String name, String floorLabel, int guestsCount, String staff, String durationText, String presetKey) {
            this.id = id;
            this.name = name;
            this.floorLabel = floorLabel;
            this.guestsCount = guestsCount;
            this.staff = staff;
            this.durationText = durationText;
            this.presetKey = presetKey;
        }
    }

    private static final Map<Integer, TableSeed> TABLE_SEEDS = new HashMap<>();
    private static final List<String> ALLOWED_STAFF = List.of(
        "Nguyễn Văn Minh",
        "Trần Thị Lan",
        "Lê Hoàng Nam",
        "Phạm Thùy Linh"
    );

    static {
        TABLE_SEEDS.put(1, new TableSeed(1, "BÀN 01", "Tầng 1", 4, "Nguyễn Văn Minh", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(2, new TableSeed(2, "BÀN 02", "Tầng 1", 4, "Nguyễn Văn Minh", "38 phút trước", "table2"));
        TABLE_SEEDS.put(3, new TableSeed(3, "BÀN 03", "Tầng 1", 4, "Trần Thị Lan", "45 phút trước", "table3"));
        TABLE_SEEDS.put(4, new TableSeed(4, "BÀN 04", "Tầng 1", 6, "Lê Hoàng Nam", "Mới nhận bàn", "fresh"));
        TABLE_SEEDS.put(5, new TableSeed(5, "BÀN 05", "Tầng 1", 2, "Trần Thị Lan", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(6, new TableSeed(6, "BÀN 06", "Tầng 1", 5, "Lê Hoàng Nam", "24 phút trước", "table6"));
        TABLE_SEEDS.put(7, new TableSeed(7, "BÀN 07", "Tầng 1", 4, "Nguyễn Văn Minh", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(8, new TableSeed(8, "BÀN 08", "Tầng 1", 6, "Trần Thị Lan", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(9, new TableSeed(9, "BÀN 09", "Tầng 2", 7, "Phạm Thùy Linh", "68 phút trước", "table9"));
        TABLE_SEEDS.put(10, new TableSeed(10, "BÀN 10", "Tầng 2", 6, "Phạm Thùy Linh", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(11, new TableSeed(11, "BÀN 11", "Tầng 2", 8, "Nguyễn Văn Minh", "41 phút trước", "table11"));
        TABLE_SEEDS.put(12, new TableSeed(12, "BÀN 12", "Tầng 2", 10, "Phạm Thùy Linh", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(13, new TableSeed(13, "BÀN 13", "Tầng 2", 4, "Trần Thị Lan", "15 phút trước", "table13"));
        TABLE_SEEDS.put(14, new TableSeed(14, "BÀN 14", "Tầng 2", 4, "Lê Hoàng Nam", "Mới vào bàn", "fresh"));
        TABLE_SEEDS.put(15, new TableSeed(15, "BÀN 15", "Tầng 2", 10, "Phạm Thùy Linh", "Mới nhận bàn", "fresh"));
        TABLE_SEEDS.put(16, new TableSeed(16, "BÀN 16", "Tầng 2", 8, "Nguyễn Văn Minh", "Mới vào bàn", "fresh"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tableId = 3;
        String rawTableId = req.getParameter("tableId");
        if (rawTableId != null && !rawTableId.trim().isEmpty()) {
            try {
                int parsed = Integer.parseInt(rawTableId.trim());
                if (TABLE_SEEDS.containsKey(parsed)) {
                    tableId = parsed;
                }
            } catch (NumberFormatException ignored) {
                tableId = 3;
            }
        }

        TableSeed seed = TABLE_SEEDS.getOrDefault(tableId, TABLE_SEEDS.get(3));

        int guestsCount = seed.guestsCount;
        String rawGuests = req.getParameter("guests");
        if (rawGuests != null && !rawGuests.trim().isEmpty()) {
            try {
                int parsedGuests = Integer.parseInt(rawGuests.trim());
                if (parsedGuests >= 1 && parsedGuests <= 20) {
                    guestsCount = parsedGuests;
                }
            } catch (NumberFormatException ignored) {
                guestsCount = seed.guestsCount;
            }
        }

        String staffName = seed.staff;
        String rawStaff = req.getParameter("staff");
        if (rawStaff != null && ALLOWED_STAFF.contains(rawStaff.trim())) {
            staffName = rawStaff.trim();
        }

        String paddedId = String.format("%03d", seed.id);
        String orderCode = "#ORD-20261112-" + paddedId;
        String orderShortCode = "ORD" + paddedId;

        req.setAttribute("tableId", seed.id);
        req.setAttribute("tableName", seed.name);
        req.setAttribute("tableFloorLabel", seed.floorLabel);
        req.setAttribute("tableGuestsCount", guestsCount);
        req.setAttribute("tableStaff", staffName);
        req.setAttribute("tableDurationText", seed.durationText);
        req.setAttribute("orderCode", orderCode);
        req.setAttribute("orderShortCode", orderShortCode);
        req.setAttribute("tablePresetKey", seed.presetKey);

        req.getRequestDispatcher("/WEB-INF/views/pos/order.jsp").forward(req, resp);
    }
}

