<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HOUGO POS — Order Gọi Món &amp; Hóa Đơn Chi Tiết</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&amp;family=JetBrains+Mono:wght@500;700;800&amp;family=Playfair+Display:wght@600;700&amp;display=swap">
  <style>
    :root {
      --bg-canvas: #0B1120;
      --bg-surface: #111827;
      --bg-footer: #0F172A;
      --bg-elevated: #1E293B;
      --crimson: #B91C1C;
      --crimson-deep: #991B1B;
      --orange-cta: #EA580C;
      --gold: #F59E0B;
      --gold-bright: #FBBF24;
      --gold-soft: #FDE68A;
      --emerald: #10B981;
      --red-live: #EF4444;
      --text-primary: #F8FAFC;
      --text-secondary: #CBD5E1;
      --text-muted: #94A3B8;
    }

    * {
      box-sizing: border-box;
    }

    html,
    body {
      margin: 0;
      padding: 0;
      height: 100%;
      background-color: var(--bg-canvas);
      color: var(--text-primary);
      font-family: 'Be Vietnam Pro', system-ui, -apple-system, sans-serif;
      color-scheme: dark;
    }

    button,
    input,
    select,
    textarea {
      font-family: inherit;
    }

    button,
    a.pos-back-btn {
      transition: transform 0.14s ease, filter 0.14s ease, background-color 0.14s ease, border-color 0.14s ease, box-shadow 0.14s ease;
    }

    button:hover:not(:disabled),
    a.pos-back-btn:hover {
      filter: brightness(1.08);
    }

    button:active:not(:disabled),
    a.pos-back-btn:active {
      transform: scale(0.985);
    }

    button:focus-visible,
    a:focus-visible,
    input:focus-visible,
    select:focus-visible {
      outline: 2px solid var(--gold);
      outline-offset: 2px;
    }

    input::placeholder {
      color: var(--text-muted);
    }

    @keyframes orderPulse {
      0%, 100% {
        opacity: 1;
        transform: scale(1);
      }
      50% {
        opacity: 0.45;
        transform: scale(1.25);
      }
    }

    .order-live-dot {
      width: 7px;
      height: 7px;
      border-radius: 999px;
      display: inline-block;
      background-color: var(--red-live);
      animation: orderPulse 1.8s ease-in-out infinite;
    }

    .order-live-dot.is-paid {
      background-color: var(--emerald);
      animation: none;
    }

    .pos-scroll::-webkit-scrollbar {
      width: 5px;
      height: 5px;
    }

    .pos-scroll::-webkit-scrollbar-track {
      background: transparent;
    }

    .pos-scroll::-webkit-scrollbar-thumb {
      background: rgba(148, 163, 184, 0.28);
      border-radius: 999px;
    }

    .tab-scroll {
      flex-shrink: 0;
      background-color: var(--bg-surface);
      border: 1px solid rgba(148, 163, 184, 0.16);
      border-radius: 12px;
      padding: 6px;
      display: flex;
      flex-wrap: nowrap;
      align-items: center;
      gap: 6px;
      white-space: nowrap;
      overflow-x: auto;
      overflow-y: hidden;
      -webkit-overflow-scrolling: touch;
      scrollbar-width: none;
    }

    .tab-scroll::-webkit-scrollbar {
      display: none;
    }

    .pos-cat-tab {
      flex: 0 0 auto;
      min-height: 40px;
      padding: 0 13px;
      border-radius: 9px;
      font-size: 12.5px;
      font-weight: 700;
      cursor: pointer;
      white-space: nowrap;
      border: 1px solid transparent;
      background-color: transparent;
      color: var(--text-muted);
    }

    .pos-cat-tab.is-active {
      border-color: rgba(245, 158, 11, 0.72);
      background-color: var(--crimson);
      color: var(--gold-soft);
    }

    .pos-shell {
      height: 100vh;
      min-height: 100%;
      width: 100%;
      background-color: var(--bg-canvas);
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }

    .pos-banner {
      flex-shrink: 0;
      margin: 10px 20px 0;
      padding: 9px 16px;
      border-radius: 10px;
      background-color: rgba(185, 28, 28, 0.25);
      border: 1px solid rgba(245, 158, 11, 0.52);
      display: none;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .pos-banner.is-visible {
      display: flex;
    }

    .pos-split {
      flex: 1;
      min-height: 0;
      width: 100%;
      padding: 14px 20px;
      display: flex;
      align-items: stretch;
      gap: 18px;
    }

    .pos-catalog-col {
      flex: 1.85 1 0;
      min-width: 0;
      height: 100%;
      min-height: 0;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .pos-catalog-header {
      flex-shrink: 0;
      background-color: var(--bg-surface);
      border: 1px solid rgba(245, 158, 11, 0.25);
      border-radius: 14px;
      padding: 10px 14px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .pos-back-btn {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      background-color: var(--bg-elevated);
      border: 1px solid rgba(148, 163, 184, 0.28);
      color: #E2E8F0;
      font-size: 13px;
      font-weight: 700;
      text-decoration: none;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 7px;
      white-space: nowrap;
    }

    .pos-table-badge {
      padding: 4px 10px;
      border-radius: 999px;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-size: 11.5px;
      font-weight: 700;
      white-space: nowrap;
      background-color: rgba(239, 68, 68, 0.24);
      color: #FECACA;
      border: 1px solid rgba(239, 68, 68, 0.55);
    }

    .pos-table-badge.is-paid {
      background-color: rgba(16, 185, 129, 0.2);
      color: #A7F3D0;
      border-color: rgba(16, 185, 129, 0.5);
    }

    .pos-bestseller-btn {
      min-height: 44px;
      padding: 0 12px;
      border-radius: 10px;
      font-size: 12px;
      font-weight: 700;
      white-space: nowrap;
      cursor: pointer;
      border: 1px solid rgba(148, 163, 184, 0.26);
      background-color: var(--bg-footer);
      color: var(--text-secondary);
    }

    .pos-bestseller-btn.is-active {
      border: 1.5px solid var(--gold);
      background-color: var(--crimson-deep);
      color: var(--gold-soft);
    }

    .pos-86-btn {
      min-height: 44px;
      padding: 0 11px;
      border-radius: 10px;
      font-size: 12px;
      font-weight: 700;
      white-space: nowrap;
      cursor: pointer;
      border: 1px solid rgba(239, 68, 68, 0.48);
      background-color: rgba(153, 27, 27, 0.25);
      color: #FECACA;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .pos-void-btn {
      min-height: 36px;
      padding: 0 10px;
      border-radius: 8px;
      background-color: rgba(245, 158, 11, 0.14);
      border: 1px solid rgba(245, 158, 11, 0.45);
      color: #FDE68A;
      font-size: 11px;
      font-weight: 700;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 4px;
      white-space: nowrap;
      flex-shrink: 0;
    }

    .pos-void-reason-pill {
      min-height: 40px;
      padding: 0 12px;
      border-radius: 9px;
      font-size: 12px;
      font-weight: 700;
      cursor: pointer;
      border: 1px solid #334155;
      background-color: #0F172A;
      color: #CBD5E1;
      text-align: left;
    }

    .pos-void-reason-pill.is-active {
      border-color: #F59E0B;
      background-color: rgba(185, 28, 28, 0.35);
      color: #FDE68A;
    }

    .pos-dish-grid {
      flex: 1;
      min-height: 0;
      overflow-y: auto;
      padding-right: 4px;
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(min(210px, 100%), 1fr));
      gap: 12px;
      align-content: start;
    }

    .dish-card {
      padding: 10px;
      border-radius: 13px;
      background-color: var(--bg-surface);
      display: flex;
      flex-direction: column;
      gap: 8px;
      border: 1px solid rgba(148, 163, 184, 0.2);
      box-shadow: 0 6px 16px rgba(2, 6, 23, 0.35);
      transition: transform 0.16s ease, border-color 0.16s ease, box-shadow 0.16s ease;
    }

    .dish-card:hover {
      transform: translateY(-2px);
      border-color: rgba(245, 158, 11, 0.55);
    }

    .dish-card.in-cart {
      border: 1.5px solid var(--gold);
      box-shadow: 0 8px 20px rgba(245, 158, 11, 0.16);
    }

    .dish-card.is-out-of-stock {
      border-color: rgba(239, 68, 68, 0.42);
      background-color: rgba(17, 24, 39, 0.72);
    }

    .dish-card.is-out-of-stock:hover {
      transform: none;
      border-color: rgba(239, 68, 68, 0.55);
    }

    /* Right Invoice Column */
    .pos-bill-col {
      flex: 0 0 460px;
      width: 460px;
      max-width: 100%;
      height: 100%;
      min-height: 0;
      background-color: var(--bg-surface);
      border: 1px solid rgba(245, 158, 11, 0.32);
      border-radius: 16px;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      box-shadow: 0 18px 40px rgba(2, 6, 23, 0.55);
    }

    .pos-bill-header {
      flex-shrink: 0;
      padding: 14px 16px 12px;
      border-bottom: 1px solid rgba(148, 163, 184, 0.18);
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      background-color: var(--bg-surface);
    }

    .pos-order-list {
      flex: 1;
      min-height: 0;
      overflow-y: auto;
      max-height: calc(100vh - 340px);
      padding: 12px 16px;
      display: flex;
      flex-direction: column;
      gap: 8px;
    }

    .pos-order-row {
      padding: 10px 11px;
      border-radius: 11px;
      display: flex;
      flex-direction: column;
      gap: 7px;
      background-color: var(--bg-footer);
      border: 1px solid rgba(148, 163, 184, 0.16);
    }

    .pos-order-row.is-new {
      background-color: rgba(245, 158, 11, 0.08);
      border: 1px solid rgba(245, 158, 11, 0.42);
    }

    .pos-bill-footer {
      position: sticky;
      bottom: 0;
      flex-shrink: 0;
      background-color: var(--bg-footer);
      border-top: 1px solid rgba(245, 158, 11, 0.28);
      padding: 14px 16px 16px;
      border-radius: 0 0 15px 15px;
      display: flex;
      flex-direction: column;
      gap: 11px;
      z-index: 5;
    }

    .pos-btn-print {
      min-height: 44px;
      padding: 0 12px;
      border-radius: 10px;
      background-color: transparent;
      border: 1.5px solid #334155;
      color: #E2E8F0;
      font-size: 13px;
      font-weight: 700;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 7px;
      white-space: nowrap;
    }

    .pos-btn-kitchen {
      min-height: 44px;
      padding: 0 12px;
      border-radius: 10px;
      font-size: 13px;
      font-weight: 800;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      white-space: nowrap;
      border: 1.5px solid #FB923C;
      background-color: var(--orange-cta);
      color: #FFFFFF;
      box-shadow: 0 6px 16px rgba(234, 88, 12, 0.35);
    }

    .pos-btn-kitchen.is-sent {
      border: 1px solid rgba(16, 185, 129, 0.45);
      background-color: rgba(16, 185, 129, 0.16);
      color: #6EE7B7;
      box-shadow: none;
    }

    .pos-btn-checkout {
      height: 48px;
      min-height: 48px;
      width: 100%;
      padding: 0 20px;
      border-radius: 11px;
      background-color: var(--crimson);
      border: 1.5px solid rgba(251, 191, 36, 0.72);
      color: #FFFFFF;
      font-size: 15px;
      font-weight: 800;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      box-shadow: 0 10px 24px rgba(185, 28, 28, 0.45);
    }

    /* Payment Modal */
    .pos-modal-backdrop {
      position: fixed;
      inset: 0;
      background-color: rgba(2, 6, 23, 0.84);
      backdrop-filter: blur(6px);
      display: none;
      align-items: center;
      justify-content: center;
      padding: 20px;
      z-index: 60;
    }

    .pos-modal-backdrop.is-open {
      display: flex;
    }

    .pos-pay-tab {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      font-size: 13.5px;
      font-weight: 700;
      cursor: pointer;
      border: 1px solid rgba(148, 163, 184, 0.25);
      background-color: var(--bg-footer);
      color: var(--text-secondary);
    }

    .pos-pay-tab.is-active {
      border: 1.5px solid var(--gold-bright);
      background-color: var(--crimson-deep);
      color: var(--gold-soft);
    }

    @media (max-width: 1160px) {
      .pos-split {
        padding: 12px 14px;
        gap: 12px;
      }
      .pos-bill-col {
        flex: 0 0 380px;
        width: 380px;
      }
    }

    @media (max-width: 920px) {
      .pos-shell {
        height: auto;
        overflow: visible;
      }
      .pos-split {
        flex-direction: column;
      }
      .pos-catalog-col,
      .pos-bill-col {
        width: 100%;
        flex: none;
        height: auto;
      }
      .pos-order-list {
        max-height: 360px;
      }
    }
  </style>
</head>
<body>
<div class="pos-shell">

  <!-- Feedback Toast Banner -->
  <div id="order-banner" class="pos-banner" role="status" aria-live="polite">
    <div style="display: flex; align-items: center; gap: 9px; font-size: 13px; font-weight: 500; color: #F8FAFC;">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <circle cx="12" cy="12" r="10"></circle>
        <path d="M12 16V12"></path>
        <path d="M12 8H12.01"></path>
      </svg>
      <span id="order-banner-msg"></span>
    </div>
    <div style="display: flex; align-items: center; gap: 8px; flex-shrink: 0;">
      <a id="order-banner-link" href="${pageContext.request.contextPath}/kitchen" style="display: none; min-height: 36px; padding: 0 13px; border-radius: 8px; background-color: #991B1B; border: 1px solid rgba(251, 191, 36, 0.65); color: #FDE68A; font-size: 12px; font-weight: 700; align-items: center; gap: 6px; white-space: nowrap;">Mở Bếp (KDT) &rarr;</a>
      <button type="button" id="order-banner-dismiss" style="min-height: 36px; padding: 0 12px; border-radius: 8px; background-color: #0F172A; border: 1px solid rgba(255, 255, 255, 0.2); color: #CBD5E1; font-size: 12px; font-weight: 600; cursor: pointer;">Đóng</button>
    </div>
  </div>

  <!-- Main 2-Column POS Split Layout (65% Left Catalog | 35% Right Order & Billing) -->
  <div class="pos-split">

    <!-- LEFT COLUMN (65%): Header + Category Tabs + Dish Grid -->
    <main class="pos-catalog-col">

      <!-- Top Header Bar -->
      <header class="pos-catalog-header">
        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
          <a href="${pageContext.request.contextPath}/pos" class="pos-back-btn">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M19 12H5"></path>
              <path d="M12 19L5 12L12 5"></path>
            </svg>
            <span>Quay lại Sơ đồ bàn</span>
          </a>

          <div style="display: flex; align-items: center; gap: 10px; flex-wrap: wrap;">
            <span style="font-size: 18px; font-weight: 800; color: #F8FAFC; white-space: nowrap;">
              <span id="hdr-table-name">${tableName}</span>
              <span style="font-size: 13px; font-weight: 600; color: #94A3B8;">(<span id="hdr-table-floor">${tableFloorLabel}</span>)</span>
            </span>
            <span id="hdr-table-badge" class="pos-table-badge">
              <span id="hdr-table-dot" class="order-live-dot"></span>
              <span id="hdr-table-status">Đang phục vụ</span>
            </span>
            <span id="hdr-table-meta" style="padding: 5px 10px; border-radius: 8px; background-color: #0F172A; border: 1px solid rgba(148, 163, 184, 0.2); font-size: 12px; font-weight: 600; color: #CBD5E1; white-space: nowrap;">${tableGuestsCount} Khách | NV: ${tableStaff}</span>
          </div>
        </div>

        <!-- Quick Search + Best Seller + 86-List Sync Toggle -->
        <div style="display: flex; align-items: center; gap: 8px; flex: 1 1 320px; max-width: 450px;">
          <div style="position: relative; width: 100%; display: flex; align-items: center;">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#94A3B8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" style="position: absolute; left: 12px; pointer-events: none;">
              <circle cx="11" cy="11" r="8"></circle>
              <path d="M21 21L16.65 16.65"></path>
            </svg>
            <input id="dish-search-input" type="search" aria-label="Tìm món ăn nhanh" placeholder="Tìm nhanh tên món (Bò, Mala, Tôm...)" style="min-height: 44px; width: 100%; padding: 0 12px 0 36px; border-radius: 10px; border: 1px solid rgba(148, 163, 184, 0.26); background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
          </div>
          <button type="button" id="bestseller-filter-btn" class="pos-bestseller-btn" aria-label="Lọc nhanh Best Seller">Best Seller</button>
          <button type="button" id="btn-sync-86" class="pos-86-btn" aria-label="Quản lý món tạm hết (86-List)">
            <span>Khóa 86 (<span id="order-86-count">1</span>)</span>
          </button>
        </div>
      </header>

      <!-- Touch Horizontal Scroll Category Tabs -->
      <nav id="category-tabs-bar" aria-label="Danh mục thực đơn" class="tab-scroll"></nav>

      <!-- Dish Grid -->
      <div id="pos-dish-grid" class="pos-dish-grid pos-scroll"></div>
    </main>

    <!-- RIGHT COLUMN (35%): Fixed Order Header + Independent Scrollable List + Sticky Billing & Action Footer -->
    <aside class="pos-bill-col">

      <!-- Order Header (Fixed at top) -->
      <div class="pos-bill-header">
        <div style="display: flex; flex-direction: column; gap: 2px;">
          <span style="font-size: 11px; font-weight: 700; letter-spacing: 0.14em; color: #F59E0B;">PHIẾU ORDER TẠI BÀN</span>
          <span id="bill-order-code" style="font-family: 'JetBrains Mono', monospace; font-size: 15.5px; font-weight: 800; color: #F8FAFC;">${orderCode}</span>
        </div>
        <div style="display: flex; align-items: center; gap: 10px;">
          <div style="text-align: right; display: flex; flex-direction: column; gap: 2px;">
            <span style="font-size: 11.5px; color: #94A3B8;">Vào bàn: <strong id="bill-duration-text" style="color: #E2E8F0;">${tableDurationText}</strong></span>
            <span id="bill-count-summary" style="font-size: 11.5px; color: #6EE7B7; font-weight: 600;">0 phần · 0 chờ bếp</span>
          </div>
          <a href="${pageContext.request.contextPath}/pos" style="min-height: 38px; padding: 0 10px; border-radius: 8px; background-color: rgba(239, 68, 68, 0.12); border: 1px solid rgba(239, 68, 68, 0.35); color: #FECACA; font-size: 11.5px; font-weight: 700; text-decoration: none; display: inline-flex; align-items: center; white-space: nowrap;">Đổi bàn</a>
        </div>
      </div>

      <!-- Scrollable Ordered Items List -->
      <div id="pos-order-list" class="pos-order-list pos-scroll"></div>

      <!-- Sticky Footer: Billing Breakdown + Secondary Actions + Primary Pay CTA -->
      <footer class="pos-bill-footer">

        <!-- Billing Calculation Table -->
        <div style="display: flex; flex-direction: column; gap: 7px;">
          <div style="display: flex; align-items: center; justify-content: space-between; font-size: 13px;">
            <span style="color: #94A3B8;">Tạm tính</span>
            <span id="summary-subtotal" style="font-family: 'JetBrains Mono', monospace; font-weight: 700; color: #E2E8F0;">0đ</span>
          </div>

          <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; font-size: 13px;">
            <label for="order-discount-select" style="color: #94A3B8; white-space: nowrap;">Chiết khấu / Voucher</label>
            <div style="display: flex; align-items: center; gap: 8px;">
              <select id="order-discount-select" style="min-height: 32px; padding: 2px 8px; border-radius: 7px; border: 1px solid rgba(148, 163, 184, 0.28); background-color: #1E293B; color: #FDE68A; font-size: 12px; font-weight: 600;">
                <option value="none">Không áp dụng (0đ)</option>
                <option value="member5">Thành viên Bạc (-5%)</option>
                <option value="vip10">VIP Gold (-10%)</option>
                <option value="voucher100">Voucher (-100.000đ)</option>
              </select>
              <span id="summary-discount" style="font-family: 'JetBrains Mono', monospace; font-weight: 700; color: #6EE7B7;">-0đ</span>
            </div>
          </div>

          <div style="display: flex; align-items: center; justify-content: space-between; font-size: 13px;">
            <span style="color: #94A3B8;">Thuế VAT 8%</span>
            <span id="summary-vat" style="font-family: 'JetBrains Mono', monospace; font-weight: 700; color: #E2E8F0;">+0đ</span>
          </div>

          <div style="height: 1px; background-color: rgba(245, 158, 11, 0.25); margin: 2px 0;"></div>

          <div style="display: flex; align-items: baseline; justify-content: space-between; gap: 10px;">
            <span style="font-size: 14.5px; font-weight: 700; color: #F8FAFC; letter-spacing: 0.02em;">TỔNG CỘNG</span>
            <span id="summary-grand-total" style="font-family: 'JetBrains Mono', monospace; font-size: 27px; font-weight: 800; color: #FBBF24; letter-spacing: -0.02em;">0đ</span>
          </div>
        </div>

        <!-- Secondary Action Buttons Row -->
        <div style="display: grid; grid-template-columns: 1fr 1.35fr; gap: 8px;">
          <button type="button" id="btn-print-temp" class="pos-btn-print">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M6 9V2H18V9"></path>
              <path d="M6 18H4A2 2 0 0 1 2 16V11A2 2 0 0 1 4 9H20A2 2 0 0 1 22 11V16A2 2 0 0 1 20 18H18"></path>
              <rect x="6" y="14" width="12" height="8"></rect>
            </svg>
            <span>In tạm tính</span>
          </button>

          <button type="button" id="btn-send-kitchen" class="pos-btn-kitchen">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M12 2C12 2 17 6.5 17 11.5A5 5 0 1 1 7 11.5C7 9.5 8 7.5 9.5 6C9.5 6 10 8 11.5 8C11.5 6 12 2 12 2Z"></path>
            </svg>
            <span id="btn-send-kitchen-label">Đã gửi đủ bếp</span>
          </button>
        </div>

        <!-- Primary Full-Width Checkout CTA -->
        <button type="button" id="btn-open-checkout" class="pos-btn-checkout">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <rect x="2" y="5" width="20" height="14" rx="2"></rect>
            <path d="M2 10H22"></path>
          </svg>
          <span>THANH TOÁN &amp; TRẢ BÀN</span>
        </button>
      </footer>
    </aside>
  </div>

  <!-- PAYMENT MODAL (2.5): Cash vs VietQR -->
  <div id="pos-pay-modal" class="pos-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="pay-modal-title">
    <div style="width: 100%; max-width: 560px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.48); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 18px;">

      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <div style="display: flex; flex-direction: column; gap: 3px;">
          <span style="font-size: 11.5px; font-weight: 700; letter-spacing: 0.16em; color: #F59E0B;">THANH TOÁN &amp; TRẢ BÀN (2.5)</span>
          <h2 id="pay-modal-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 24px; font-weight: 700; color: #FAF7F2;">${tableName} &mdash; ${orderCode}</h2>
        </div>
        <button type="button" id="pay-modal-close-x" aria-label="Đóng cửa sổ thanh toán" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.25); color: #E2E8F0; cursor: pointer; display: inline-flex; align-items: center; justify-content: center;">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M18 6L6 18"></path>
            <path d="M6 6L18 18"></path>
          </svg>
        </button>
      </div>

      <!-- Amount Due Hero -->
      <div style="padding: 14px 18px; border-radius: 12px; background: linear-gradient(135deg, rgba(153, 27, 27, 0.45), rgba(15, 23, 42, 0.96)); border: 1px solid rgba(251, 191, 36, 0.35); display: flex; align-items: center; justify-content: space-between;">
        <span style="font-size: 13.5px; font-weight: 600; color: #CBD5E1;">Số tiền cần thu (Gồm VAT 8%)</span>
        <span id="modal-grand-total" style="font-family: 'JetBrains Mono', monospace; font-size: 28px; font-weight: 800; color: #FBBF24;">0đ</span>
      </div>

      <!-- Method Switcher -->
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <button type="button" id="tab-method-cash" class="pos-pay-tab is-active">Tiền mặt tại quầy</button>
        <button type="button" id="tab-method-qr" class="pos-pay-tab">Chuyển khoản VietQR</button>
      </div>

      <!-- Cash View -->
      <div id="view-method-cash" style="padding: 16px; border-radius: 12px; background-color: #0F172A; border: 1px solid rgba(148, 163, 184, 0.2); display: flex; flex-direction: column; gap: 12px;">
        <label for="cash-received-input" style="font-size: 13px; font-weight: 600; color: #E2E8F0;">Khách đưa (VND)</label>
        <input id="cash-received-input" type="number" value="1600000" min="0" step="1000" style="min-height: 46px; width: 100%; padding: 0 14px; border-radius: 10px; border: 1px solid rgba(148, 163, 184, 0.28); background-color: #1E293B; color: #FBBF24; font-family: 'JetBrains Mono', monospace; font-size: 18px; font-weight: 800;">
        <div style="display: flex; flex-wrap: wrap; gap: 8px;">
          <button type="button" id="btn-cash-exact" style="min-height: 40px; padding: 0 12px; border-radius: 8px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.26); color: #E2E8F0; font-size: 12.5px; font-weight: 600; cursor: pointer;">Đưa đủ</button>
          <button type="button" id="btn-cash-1500" style="min-height: 40px; padding: 0 12px; border-radius: 8px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.26); color: #E2E8F0; font-size: 12.5px; font-weight: 600; cursor: pointer;">1.500.000đ</button>
          <button type="button" id="btn-cash-2000" style="min-height: 40px; padding: 0 12px; border-radius: 8px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.26); color: #E2E8F0; font-size: 12.5px; font-weight: 600; cursor: pointer;">2.000.000đ</button>
        </div>
        <div style="display: flex; align-items: center; justify-content: space-between; padding-top: 8px; border-top: 1px dashed rgba(148, 163, 184, 0.2);">
          <span style="font-size: 13.5px; color: #94A3B8;">Tiền thối lại khách</span>
          <span id="modal-change-amount" style="font-family: 'JetBrains Mono', monospace; font-size: 20px; font-weight: 800; color: #6EE7B7;">0đ</span>
        </div>
      </div>

      <!-- VietQR View -->
      <div id="view-method-qr" style="padding: 16px; border-radius: 12px; background-color: #0F172A; border: 1px solid rgba(16, 185, 129, 0.35); display: none; align-items: center; gap: 18px;">
        <div style="padding: 10px; border-radius: 12px; background-color: #FFFFFF; flex-shrink: 0;">
          <svg width="124" height="124" viewBox="0 0 124 124" fill="none" role="img" aria-label="Mã thanh toán VietQR HOUGO HOTPOT">
            <rect width="124" height="124" fill="#FFFFFF"></rect>
            <rect x="8" y="8" width="32" height="32" stroke="#111827" stroke-width="6"></rect>
            <rect x="17" y="17" width="14" height="14" fill="#991B1B"></rect>
            <rect x="84" y="8" width="32" height="32" stroke="#111827" stroke-width="6"></rect>
            <rect x="93" y="17" width="14" height="14" fill="#991B1B"></rect>
            <rect x="8" y="84" width="32" height="32" stroke="#111827" stroke-width="6"></rect>
            <rect x="17" y="93" width="14" height="14" fill="#991B1B"></rect>
            <rect x="48" y="10" width="8" height="8" fill="#111827"></rect>
            <rect x="64" y="10" width="12" height="8" fill="#111827"></rect>
            <rect x="48" y="26" width="12" height="12" fill="#111827"></rect>
            <rect x="68" y="28" width="8" height="8" fill="#111827"></rect>
            <rect x="10" y="48" width="12" height="8" fill="#111827"></rect>
            <rect x="30" y="52" width="10" height="10" fill="#111827"></rect>
            <rect x="52" y="52" width="20" height="20" rx="4" fill="#B91C1C"></rect>
            <rect x="82" y="48" width="12" height="12" fill="#111827"></rect>
            <rect x="102" y="52" width="14" height="8" fill="#111827"></rect>
            <rect x="10" y="66" width="16" height="8" fill="#111827"></rect>
            <rect x="48" y="82" width="14" height="10" fill="#111827"></rect>
            <rect x="70" y="78" width="12" height="14" fill="#111827"></rect>
            <rect x="92" y="84" width="22" height="10" fill="#111827"></rect>
            <rect x="50" y="102" width="10" height="14" fill="#111827"></rect>
            <rect x="70" y="104" width="18" height="10" fill="#111827"></rect>
            <rect x="98" y="100" width="16" height="16" fill="#111827"></rect>
          </svg>
        </div>
        <div style="display: flex; flex-direction: column; gap: 6px; font-size: 13px;">
          <span style="font-weight: 800; color: #6EE7B7; font-size: 14px;">Quét mã VietQR tự động khớp đơn</span>
          <span style="color: #CBD5E1;">Ngân hàng: <strong style="color: #F8FAFC;">MB Bank · HOUGO HOTPOT</strong></span>
          <span style="color: #CBD5E1;">Số tài khoản: <strong style="color: #FBBF24; font-family: 'JetBrains Mono', monospace;">8888 9999 2026</strong></span>
          <span style="color: #94A3B8;">Nội dung: <strong id="qr-transfer-memo" style="color: #E2E8F0;">TT ${tableName} ${orderShortCode}</strong></span>
        </div>
      </div>

      <div style="display: flex; align-items: center; justify-content: flex-end; gap: 10px; padding-top: 4px;">
        <button type="button" id="pay-modal-close-btn" style="min-height: 46px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.28); color: #E2E8F0; font-size: 14px; font-weight: 600; cursor: pointer;">Đóng</button>
        <button type="button" id="pay-modal-confirm-btn" style="min-height: 46px; padding: 0 24px; border-radius: 10px; background-color: #059669; border: 1px solid #34D399; color: #FFFFFF; font-size: 14.5px; font-weight: 800; cursor: pointer; box-shadow: 0 10px 24px rgba(16, 185, 129, 0.3);">Xác nhận Đã Thu Tiền &amp; Trả Bàn</button>
      </div>
    </div>
  </div>

  <!-- Void / Cancel Sent Kitchen Item Modal (Anti-Fraud Control) -->
  <div id="pos-void-modal" class="pos-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="void-modal-title">
    <div style="width: 100%; max-width: 500px; background-color: #111827; border: 1px solid rgba(245, 158, 11, 0.55); border-radius: 18px; padding: 24px; box-shadow: 0 26px 60px rgba(0, 0, 0, 0.72); display: flex; flex-direction: column; gap: 15px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <div>
          <span style="font-size: 11px; font-weight: 800; letter-spacing: 0.14em; color: #F59E0B;">KIỂM SOÁT HỦY / TRẢ MÓN ĐÃ BÁO BẾP</span>
          <h2 id="void-modal-title" style="margin: 4px 0 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Xác Nhận Hủy / Trả Món</h2>
        </div>
        <button type="button" id="void-modal-close-x" aria-label="Đóng hộp thoại hủy món" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer;">&times;</button>
      </div>

      <div style="padding: 12px 14px; border-radius: 12px; background-color: #0F172A; border: 1px solid rgba(239, 68, 68, 0.35); display: flex; align-items: center; justify-content: space-between; gap: 10px;">
        <div style="display: flex; flex-direction: column; gap: 2px;">
          <span id="void-dish-name" style="font-size: 14.5px; font-weight: 800; color: #F8FAFC;"></span>
          <span style="font-size: 12px; color: #94A3B8;">Đã gửi xuống Bếp: <strong id="void-dish-sent-qty" style="font-family: 'JetBrains Mono', monospace; color: #6EE7B7;"></strong> phần</span>
        </div>
        <div style="display: inline-flex; align-items: center; gap: 6px; background-color: #1E293B; border: 1px solid #475569; border-radius: 9px; padding: 3px;">
          <button type="button" id="void-qty-dec" style="min-width: 36px; min-height: 36px; border-radius: 6px; border: none; background-color: #0F172A; color: #F8FAFC; font-size: 16px; font-weight: 800; cursor: pointer;">-</button>
          <span id="void-qty-val" style="min-width: 28px; text-align: center; font-family: 'JetBrains Mono', monospace; font-size: 14px; font-weight: 800; color: #FBBF24;">1</span>
          <button type="button" id="void-qty-inc" style="min-width: 36px; min-height: 36px; border-radius: 6px; border: none; background-color: #991B1B; color: #FDE68A; font-size: 16px; font-weight: 800; cursor: pointer;">+</button>
        </div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 7px;">
        <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">Lý do hủy / trả món bắt buộc (Lưu nhật ký ca):</span>
        <div id="void-reasons-list" style="display: grid; grid-template-columns: 1fr 1fr; gap: 8px;"></div>
      </div>

      <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
        <span>Ghi chú xác nhận (Quản lý / Đầu bếp):</span>
        <input type="text" id="void-note-input" placeholder="Ví dụ: Khách chưa dùng, bếp trưởng đã xác nhận thu hồi..." style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
      </label>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 6px; border-top: 1px solid #334155;">
        <button type="button" id="void-modal-cancel-btn" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 13px; font-weight: 700; cursor: pointer;">Giữ lại món</button>
        <button type="button" id="void-modal-confirm-btn" style="min-height: 44px; padding: 0 20px; border-radius: 10px; background-color: #B91C1C; border: 1px solid #FBBF24; color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">Xác nhận Hủy / Trả món</button>
      </div>
    </div>
  </div>

  <!-- 86-List Sync Modal on Order Screen -->
  <div id="pos-86-modal" class="pos-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="pos-86-title">
    <div style="width: 100%; max-width: 540px; max-height: 86vh; background-color: #111827; border: 1px solid rgba(239, 68, 68, 0.5); border-radius: 18px; padding: 22px; box-shadow: 0 26px 60px rgba(0, 0, 0, 0.72); display: flex; flex-direction: column; gap: 14px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <div>
          <span style="font-size: 11px; font-weight: 800; letter-spacing: 0.14em; color: #FCA5A5;">ĐỒNG BỘ BẾP &amp; ADMIN THỰC ĐƠN</span>
          <h2 id="pos-86-title" style="margin: 4px 0 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Danh Sách Khóa Món (86-List)</h2>
        </div>
        <button type="button" id="pos-86-close-x" aria-label="Đóng hộp thoại 86-List" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer;">&times;</button>
      </div>

      <span style="font-size: 12.5px; color: #94A3B8;">Bật trạng thái <strong style="color: #FCA5A5;">Tạm hết</strong> để mô phỏng khóa gọi món ngay trên POS Order (đồng bộ cùng Admin Thực đơn &amp; Bếp KDT).</span>

      <div id="pos-86-list" class="pos-scroll" style="flex: 1; min-height: 0; max-height: 52vh; overflow-y: auto; display: flex; flex-direction: column; gap: 8px; padding-right: 4px;"></div>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 6px; border-top: 1px solid #334155;">
        <button type="button" id="pos-86-done-btn" style="min-height: 44px; padding: 0 20px; border-radius: 10px; background-color: #1E293B; border: 1px solid #475569; color: #F8FAFC; font-size: 13px; font-weight: 700; cursor: pointer;">Hoàn tất</button>
      </div>
    </div>
  </div>

</div>

<script>
(function () {
  var BOOT = {
    ctxPath: '${pageContext.request.contextPath}',
    posUrl: '${pageContext.request.contextPath}/pos',
    imgBase: '${pageContext.request.contextPath}/assets/images/hotpot/',
    tableId: ${tableId != null ? tableId : 3},
    tableName: '${not empty tableName ? tableName : "BÀN 03"}',
    tablePresetKey: '${not empty tablePresetKey ? tablePresetKey : "table3"}'
  };

  function formatVnd(n) {
    return Math.round(n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.') + 'đ';
  }

  function escapeHtml(str) {
    return String(str || '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  var CATEGORIES = [
    { id: 'all', label: 'Tất cả' },
    { id: 'broth', label: 'Nước lẩu Signature' },
    { id: 'combo', label: 'Gói Buffet / Combo' },
    { id: 'meat', label: 'Bò & Thịt nhúng' },
    { id: 'seafood', label: 'Hải sản tươi' },
    { id: 'veggie', label: 'Rau nấm & Đậu mì' },
    { id: 'drink', label: 'Đồ uống & Tráng miệng' }
  ];

  var DISHES = [
    { id: 'mala', name: 'Nước Lẩu Tứ Xuyên Mala', cat: 'broth', categoryLabel: 'Nước lẩu Signature', price: 149000, tag: 'Cay 3/3', tagType: 'hot', bestSeller: true, img: BOOT.imgBase + 'dish-mala.jpg' },
    { id: 'tomyum', name: 'Nước Lẩu Tomyum Hải Sản', cat: 'broth', categoryLabel: 'Nước lẩu Signature', price: 159000, tag: 'Cay 2/3', tagType: 'hot', bestSeller: true, img: BOOT.imgBase + 'dish-tomyum.jpg' },
    { id: 'mushroom', name: 'Nước Lẩu Nấm Dưỡng Sinh', cat: 'broth', categoryLabel: 'Nước lẩu Signature', price: 139000, tag: 'Không cay', tagType: 'mild', bestSeller: false, img: BOOT.imgBase + 'dish-mushroom.jpg' },
    { id: 'tomato', name: 'Nước Lẩu Cà Chua Collagen', cat: 'broth', categoryLabel: 'Nước lẩu Signature', price: 145000, tag: 'Best Seller', tagType: 'gold', bestSeller: true, img: BOOT.imgBase + 'dish-tomato.jpg' },
    { id: 'combo269', name: 'Combo Buffet Hougo 269K', cat: 'combo', categoryLabel: 'Gói Buffet / Combo', price: 269000, tag: 'Best Seller', tagType: 'gold', bestSeller: true, img: BOOT.imgBase + 'hero-hotpot.jpg' },
    { id: 'combo329', name: 'Combo Buffet Thượng Hạng 329K', cat: 'combo', categoryLabel: 'Gói Buffet / Combo', price: 329000, tag: 'VIP Choice', tagType: 'gold', bestSeller: false, img: BOOT.imgBase + 'hero-hotpot.jpg' },
    { id: 'wagyu', name: 'Bò Wagyu Nhật A5 (150g)', cat: 'meat', categoryLabel: 'Bò & Thịt nhúng', price: 289000, tag: 'Thượng hạng', tagType: 'gold', bestSeller: true, img: BOOT.imgBase + 'dish-wagyu.jpg' },
    { id: 'beefplate', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', cat: 'meat', categoryLabel: 'Bò & Thịt nhúng', price: 129000, tag: 'Best Seller', tagType: 'gold', bestSeller: true, img: BOOT.imgBase + 'dish-wagyu.jpg' },
    { id: 'seafoodmix', name: 'Đĩa Hải Sản Tươi Tổng Hợp', cat: 'seafood', categoryLabel: 'Hải sản tươi', price: 259000, tag: 'Tươi sống', tagType: 'fresh', bestSeller: true, img: BOOT.imgBase + 'dish-seafood.jpg' },
    { id: 'shrimpsquid', name: 'Tôm Sú & Mực Hoa Tươi', cat: 'seafood', categoryLabel: 'Hải sản tươi', price: 179000, tag: 'Tươi sống', tagType: 'fresh', bestSeller: false, img: BOOT.imgBase + 'dish-seafood.jpg' },
    { id: 'veggiemix', name: 'Tháp Rau Nấm & Váng Đậu', cat: 'veggie', categoryLabel: 'Rau nấm & Đậu mì', price: 95000, tag: 'Thanh mát', tagType: 'mild', bestSeller: false, img: BOOT.imgBase + 'dish-veggie.jpg' },
    { id: 'drinkjug', name: 'Trà Bí Đao Hạt Chia (Bình)', cat: 'drink', categoryLabel: 'Đồ uống & Tráng miệng', price: 75000, tag: 'Giải nhiệt', tagType: 'fresh', bestSeller: false, img: BOOT.imgBase + 'dish-drink.jpg' }
  ];

  var NOTE_PRESETS = ['Bình thường', 'Ít cay', 'Không ớt', 'Thái mỏng', 'Ít đá'];

  var TABLE_PRESET_ORDERS = {
    table2: [
      { dishId: 'tomyum', name: 'Nước Lẩu Tomyum Hải Sản', price: 159000, qty: 1, status: 'sent', note: 'Ít cay' },
      { dishId: 'mushroom', name: 'Nước Lẩu Nấm Dưỡng Sinh', price: 139000, qty: 1, status: 'sent', note: 'Bình thường' },
      { dishId: 'beefplate', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', price: 129000, qty: 3, status: 'sent', note: 'Thái mỏng' },
      { dishId: 'seafoodmix', name: 'Đĩa Hải Sản Tươi Tổng Hợp', price: 259000, qty: 1, status: 'new', note: 'Bình thường' }
    ],
    table3: [
      { dishId: 'mala', name: 'Nước Lẩu Tứ Xuyên Mala', price: 149000, qty: 1, status: 'sent', note: 'Ít cay' },
      { dishId: 'combo269', name: 'Combo Buffet Hougo 269K', price: 269000, qty: 4, status: 'sent', note: 'Bình thường' },
      { dishId: 'drinkjug', name: 'Trà Bí Đao Hạt Chia (Bình)', price: 75000, qty: 1, status: 'sent', note: 'Ít đá' },
      { dishId: 'beefplate', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', price: 129000, qty: 1, status: 'new', note: 'Thái mỏng' }
    ],
    table6: [
      { dishId: 'combo269', name: 'Combo Buffet Hougo 269K', price: 269000, qty: 5, status: 'sent', note: 'Không ớt' },
      { dishId: 'tomato', name: 'Nước Lẩu Cà Chua Collagen', price: 145000, qty: 1, status: 'sent', note: 'Bình thường' }
    ],
    table9: [
      { dishId: 'combo329', name: 'Combo Buffet Thượng Hạng 329K', price: 329000, qty: 7, status: 'sent', note: 'Bình thường' },
      { dishId: 'wagyu', name: 'Bò Wagyu Nhật A5 (150g)', price: 289000, qty: 2, status: 'sent', note: 'Thái mỏng' },
      { dishId: 'drinkjug', name: 'Trà Bí Đao Hạt Chia (Bình)', price: 75000, qty: 2, status: 'new', note: 'Ít đá' }
    ],
    table11: [
      { dishId: 'combo329', name: 'Combo Buffet Thượng Hạng 329K', price: 329000, qty: 8, status: 'sent', note: 'Bình thường' },
      { dishId: 'seafoodmix', name: 'Đĩa Hải Sản Tươi Tổng Hợp', price: 259000, qty: 2, status: 'sent', note: 'Bình thường' }
    ],
    table13: [
      { dishId: 'tomato', name: 'Nước Lẩu Cà Chua Collagen', price: 145000, qty: 1, status: 'sent', note: 'Bình thường' },
      { dishId: 'wagyu', name: 'Bò Wagyu Nhật A5 (150g)', price: 289000, qty: 1, status: 'sent', note: 'Thái mỏng' },
      { dishId: 'veggiemix', name: 'Tháp Rau Nấm & Váng Đậu', price: 95000, qty: 2, status: 'new', note: 'Bình thường' }
    ],
    fresh: []
  };

  var STORAGE_86_KEY = 'hougo_86_dishes_v1';
  var DEFAULT_OUT_OF_STOCK = ['Đĩa Hải Sản Tươi Tổng Hợp'];
  var VOID_REASONS = [
    'Khách đổi món / đổi ý',
    'Bếp báo hết / chậm món',
    'Nhập nhầm order',
    'Món chưa đạt chất lượng'
  ];
  var lineSeq = 1;

  function nextLineId() {
    return 'line-' + (lineSeq++);
  }

  function loadOutOfStockNames() {
    try {
      var raw = window.localStorage.getItem(STORAGE_86_KEY);
      if (!raw) return DEFAULT_OUT_OF_STOCK.slice();
      var parsed = JSON.parse(raw);
      return Array.isArray(parsed) ? parsed : DEFAULT_OUT_OF_STOCK.slice();
    } catch (e) {
      return DEFAULT_OUT_OF_STOCK.slice();
    }
  }

  function saveOutOfStockNames(names) {
    try {
      var existing = [];
      var raw = window.localStorage.getItem(STORAGE_86_KEY);
      if (raw) {
        var parsed = JSON.parse(raw);
        if (Array.isArray(parsed)) existing = parsed;
      }
      var menuNames = DISHES.map(function (d) { return d.name; });
      var otherKitchen86 = existing.filter(function (nm) { return menuNames.indexOf(nm) === -1; });
      var menuOnly86 = names.filter(function (nm) { return menuNames.indexOf(nm) !== -1; });
      window.localStorage.setItem(STORAGE_86_KEY, JSON.stringify(otherKitchen86.concat(menuOnly86)));
    } catch (e) {}
  }

  function cloneSeedItems(key) {
    var src = TABLE_PRESET_ORDERS[key] || TABLE_PRESET_ORDERS.table3;
    var out = [];
    for (var i = 0; i < src.length; i++) {
      var item = src[i];
      out.push({
        lineId: nextLineId(),
        dishId: item.dishId,
        name: item.name,
        price: item.price,
        qty: item.qty,
        status: item.status,
        note: item.note
      });
    }
    return out;
  }

  var state = {
    activeCat: 'all',
    searchQuery: '',
    bestSellerOnly: false,
    outOfStockNames: loadOutOfStockNames(),
    orderItems: cloneSeedItems(BOOT.tablePresetKey),
    discountType: 'none',
    tablePaid: false,
    payMethod: 'cash',
    cashGiven: 1600000,
    bannerMsg: '',
    bannerKitchenLink: false,
    voidTargetLineId: null,
    voidQty: 1,
    voidReason: VOID_REASONS[0]
  };

  function isDishOutOfStock(dishName) {
    return state.outOfStockNames.indexOf(dishName) !== -1;
  }

  function findDish(dishId) {
    for (var i = 0; i < DISHES.length; i++) {
      if (DISHES[i].id === dishId) return DISHES[i];
    }
    return null;
  }

  function findLineIndex(lineId) {
    for (var i = 0; i < state.orderItems.length; i++) {
      if (state.orderItems[i].lineId === lineId) return i;
    }
    return -1;
  }

  function findNewLineIndexByDish(dishId) {
    for (var i = 0; i < state.orderItems.length; i++) {
      if (state.orderItems[i].dishId === dishId && state.orderItems[i].status === 'new') return i;
    }
    return -1;
  }

  function getDishQtyStats(dishId) {
    var sentQty = 0;
    var newQty = 0;
    for (var i = 0; i < state.orderItems.length; i++) {
      var it = state.orderItems[i];
      if (it.dishId !== dishId) continue;
      if (it.status === 'sent') sentQty += it.qty;
      else newQty += it.qty;
    }
    return { sentQty: sentQty, newQty: newQty, totalQty: sentQty + newQty };
  }

  function computeTotals() {
    var subtotal = 0;
    var totalItems = 0;
    var pendingKitchen = 0;
    for (var i = 0; i < state.orderItems.length; i++) {
      var it = state.orderItems[i];
      subtotal += it.price * it.qty;
      totalItems += it.qty;
      if (it.status === 'new') pendingKitchen += it.qty;
    }

    var discount = 0;
    if (state.discountType === 'member5') discount = Math.round(subtotal * 0.05);
    else if (state.discountType === 'vip10') discount = Math.round(subtotal * 0.1);
    else if (state.discountType === 'voucher100') discount = Math.min(subtotal, 100000);

    var afterDiscount = Math.max(0, subtotal - discount);
    var vat = Math.round(afterDiscount * 0.08);
    var grandTotal = afterDiscount + vat;

    return {
      subtotal: subtotal,
      discount: discount,
      vat: vat,
      grandTotal: grandTotal,
      totalItems: totalItems,
      pendingKitchen: pendingKitchen
    };
  }

  function adjustGridDish(dishId, delta) {
    var dish = findDish(dishId);
    if (!dish) return;
    if (delta > 0) {
      if (isDishOutOfStock(dish.name)) {
        state.bannerKitchenLink = false;
        state.bannerMsg = 'Món "' + dish.name + '" đang ở trạng thái Tạm hết (86-List), không thể gọi thêm.';
        renderBanner();
        return;
      }
      var newIdx = findNewLineIndexByDish(dishId);
      if (newIdx !== -1) {
        state.orderItems[newIdx].qty += 1;
      } else {
        state.orderItems.push({
          lineId: nextLineId(),
          dishId: dish.id,
          name: dish.name,
          price: dish.price,
          qty: 1,
          status: 'new',
          note: 'Bình thường'
        });
      }
      renderAll();
      return;
    }

    if (delta < 0) {
      var idx = findNewLineIndexByDish(dishId);
      if (idx === -1) {
        state.bannerKitchenLink = false;
        state.bannerMsg = 'Món đã gửi bếp không thể tự ý giảm số lượng — vui lòng bấm "Hủy/Trả món" trên phiếu hóa đơn.';
        renderBanner();
        return;
      }
      var nextQty = state.orderItems[idx].qty + delta;
      if (nextQty <= 0) state.orderItems.splice(idx, 1);
      else state.orderItems[idx].qty = nextQty;
      renderAll();
    }
  }

  function adjustNewLineQty(lineId, delta) {
    var idx = findLineIndex(lineId);
    if (idx === -1) return;
    var line = state.orderItems[idx];
    if (line.status !== 'new') {
      state.bannerKitchenLink = false;
      state.bannerMsg = 'Dòng món đã gửi bếp bị khóa nút giảm (-) để chống gian lận. Dùng nút "Hủy/Trả món" để xác nhận lý do.';
      renderBanner();
      return;
    }
    if (delta > 0 && isDishOutOfStock(line.name)) {
      state.bannerKitchenLink = false;
      state.bannerMsg = 'Món "' + line.name + '" vừa báo Tạm hết (86-List), không thể tăng thêm số lượng.';
      renderBanner();
      return;
    }
    var nextQty = line.qty + delta;
    if (nextQty <= 0) state.orderItems.splice(idx, 1);
    else line.qty = nextQty;
    renderAll();
  }

  function removeNewLine(lineId) {
    var idx = findLineIndex(lineId);
    if (idx === -1) return;
    if (state.orderItems[idx].status !== 'new') return;
    state.orderItems.splice(idx, 1);
    renderAll();
  }

  function cycleOrderNote(lineId) {
    var idx = findLineIndex(lineId);
    if (idx === -1 || state.orderItems[idx].status !== 'new') return;
    var current = state.orderItems[idx].note || 'Bình thường';
    var pos = NOTE_PRESETS.indexOf(current);
    state.orderItems[idx].note = NOTE_PRESETS[(pos + 1) % NOTE_PRESETS.length];
    renderAll();
  }

  function renderTabs() {
    var html = '';
    for (var i = 0; i < CATEGORIES.length; i++) {
      var cat = CATEGORIES[i];
      var cls = 'pos-cat-tab' + (state.activeCat === cat.id ? ' is-active' : '');
      html += '<button type="button" class="' + cls + '" data-cat-id="' + escapeHtml(cat.id) + '">' + escapeHtml(cat.label) + '</button>';
    }
    document.getElementById('category-tabs-bar').innerHTML = html;
  }

  function render86CountAndModal() {
    var count = 0;
    for (var i = 0; i < DISHES.length; i++) {
      if (isDishOutOfStock(DISHES[i].name)) count++;
    }
    var countEl = document.getElementById('order-86-count');
    if (countEl) countEl.textContent = String(count);

    var listEl = document.getElementById('pos-86-list');
    if (!listEl) return;
    var html = '';
    for (var j = 0; j < DISHES.length; j++) {
      var d = DISHES[j];
      var out = isDishOutOfStock(d.name);
      var bdr = out ? 'rgba(239, 68, 68, 0.5)' : '#334155';
      var btnBg = out ? '#065F46' : 'rgba(185, 28, 28, 0.88)';
      var btnBdr = out ? '#34D399' : '#F87171';
      var stBadge = out
        ? '<span style="padding: 2px 8px; border-radius: 999px; background-color: rgba(239, 68, 68, 0.22); border: 1px solid rgba(239, 68, 68, 0.5); color: #FECACA; font-size: 11px; font-weight: 800;">TẠM HẾT</span>'
        : '<span style="padding: 2px 8px; border-radius: 999px; background-color: rgba(16, 185, 129, 0.16); border: 1px solid rgba(16, 185, 129, 0.4); color: #6EE7B7; font-size: 11px; font-weight: 700;">Đang bán</span>';

      html +=
        '<div style="display: flex; align-items: center; justify-content: space-between; gap: 10px; padding: 10px 12px; border-radius: 11px; background-color: #1E293B; border: 1px solid ' + bdr + ';">' +
          '<div style="display: flex; flex-direction: column; gap: 3px; min-width: 0;">' +
            '<div style="display: flex; align-items: center; gap: 8px; flex-wrap: wrap;">' +
              '<span style="font-size: 13.5px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(d.name) + '</span>' +
              stBadge +
            '</div>' +
            '<span style="font-size: 11.5px; color: #94A3B8;">' + escapeHtml(d.categoryLabel) + ' &middot; <strong style="color: #FBBF24; font-family: \'JetBrains Mono\', monospace;">' + formatVnd(d.price) + '</strong></span>' +
          '</div>' +
          '<button type="button" data-toggle-order86="' + escapeHtml(d.name) + '" style="min-height: 40px; padding: 0 13px; border-radius: 9px; font-size: 12px; font-weight: 700; cursor: pointer; white-space: nowrap; border: 1px solid ' + btnBdr + '; background-color: ' + btnBg + '; color: #FFFFFF;">' +
            (out ? 'Mở bán lại' : 'Báo tạm hết') +
          '</button>' +
        '</div>';
    }
    listEl.innerHTML = html;
  }

  function renderDishGrid() {
    var q = (state.searchQuery || '').trim().toLowerCase();
    var html = '';
    var matchCount = 0;

    for (var i = 0; i < DISHES.length; i++) {
      var d = DISHES[i];
      if (state.activeCat !== 'all' && d.cat !== state.activeCat) continue;
      if (state.bestSellerOnly && !d.bestSeller) continue;
      if (q && d.name.toLowerCase().indexOf(q) === -1 && d.categoryLabel.toLowerCase().indexOf(q) === -1) continue;

      matchCount++;
      var stats = getDishQtyStats(d.id);
      var qty = stats.totalQty;
      var inCart = qty > 0;
      var isOut = isDishOutOfStock(d.name);

      var tagBg = 'rgba(245, 158, 11, 0.22)';
      var tagColor = '#FDE68A';
      var tagBorder = 'rgba(245, 158, 11, 0.5)';
      if (d.tagType === 'hot') {
        tagBg = 'rgba(239, 68, 68, 0.28)';
        tagColor = '#FECACA';
        tagBorder = 'rgba(239, 68, 68, 0.55)';
      } else if (d.tagType === 'mild') {
        tagBg = 'rgba(16, 185, 129, 0.22)';
        tagColor = '#A7F3D0';
        tagBorder = 'rgba(16, 185, 129, 0.5)';
      } else if (d.tagType === 'fresh') {
        tagBg = 'rgba(14, 165, 233, 0.24)';
        tagColor = '#BAE6FD';
        tagBorder = 'rgba(56, 189, 248, 0.5)';
      }

      var qtyBadge = inCart
        ? '<span style="position: absolute; bottom: 7px; right: 7px; padding: 2px 8px; border-radius: 999px; background-color: #B91C1C; border: 1px solid #FBBF24; color: #FDE68A; font-family: \'JetBrains Mono\', monospace; font-size: 11px; font-weight: 800;">x' + qty + '</span>'
        : '';

      var outOverlay = isOut
        ? '<span style="position: absolute; top: 7px; right: 7px; padding: 3px 9px; border-radius: 999px; background-color: rgba(153, 27, 27, 0.94); border: 1px solid #FCA5A5; color: #FFFFFF; font-size: 10.5px; font-weight: 800; letter-spacing: 0.04em;">TẠM HẾT (86)</span>'
        : '';

      var actionControl = '';
      if (!inCart && isOut) {
        actionControl =
          '<button type="button" disabled aria-label="Món đã tạm hết" title="Bếp đã khóa món (86-List)" style="min-height: 44px; padding: 0 13px; border-radius: 9px; background-color: #1E293B; border: 1px solid rgba(239, 68, 68, 0.45); color: #FCA5A5; font-size: 12px; font-weight: 800; cursor: not-allowed; opacity: 0.72; white-space: nowrap;">Tạm hết</button>';
      } else if (!inCart) {
        actionControl =
          '<button type="button" data-dish-inc="' + escapeHtml(d.id) + '" style="min-height: 44px; padding: 0 14px; border-radius: 9px; background-color: #B91C1C; border: 1px solid rgba(251, 191, 36, 0.48); color: #FAF7F2; font-size: 12.5px; font-weight: 700; cursor: pointer; display: inline-flex; align-items: center; gap: 5px; white-space: nowrap;">' +
          '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5V19"></path><path d="M5 12H19"></path></svg>' +
          '<span>Thêm</span></button>';
      } else {
        var canDecNew = stats.newQty > 0;
        var decAttr = canDecNew ? ' data-dish-dec="' + escapeHtml(d.id) + '"' : ' disabled title="Đã gửi bếp — dùng Hủy/Trả món trên hóa đơn"';
        var decStyle = 'min-width: 36px; min-height: 40px; border-radius: 7px; border: none; background-color: #1E293B; color: #F8FAFC; font-size: 16px; font-weight: 700; ' +
          (canDecNew ? 'cursor: pointer;' : 'cursor: not-allowed; opacity: 0.35;');
        var incAttr = isOut ? ' disabled title="Món đã tạm hết (86-List)"' : ' data-dish-inc="' + escapeHtml(d.id) + '"';
        var incStyle = 'min-width: 36px; min-height: 40px; border-radius: 7px; border: none; background-color: #991B1B; color: #FDE68A; font-size: 16px; font-weight: 700; ' +
          (isOut ? 'cursor: not-allowed; opacity: 0.38;' : 'cursor: pointer;');

        actionControl =
          '<div style="display: inline-flex; align-items: center; gap: 4px; background-color: #0B1120; border: 1px solid rgba(245, 158, 11, 0.5); border-radius: 9px; padding: 2px;">' +
          '<button type="button"' + decAttr + ' aria-label="Giảm số lượng món" style="' + decStyle + '">-</button>' +
          '<span style="min-width: 24px; text-align: center; font-family: \'JetBrains Mono\', monospace; font-size: 13.5px; font-weight: 800; color: #FBBF24;">' + qty + '</span>' +
          '<button type="button"' + incAttr + ' aria-label="Tăng số lượng món" style="' + incStyle + '">+</button>' +
          '</div>';
      }

      var imgStyle = 'width: 100%; height: 100%; object-fit: cover; display: block;' + (isOut ? ' opacity: 0.42; filter: grayscale(0.78);' : '');
      var cardCls = 'dish-card' + (inCart ? ' in-cart' : '') + (isOut ? ' is-out-of-stock' : '');

      html +=
        '<article class="' + cardCls + '">' +
        '<div style="position: relative; width: 100%; height: 102px; border-radius: 9px; overflow: hidden; background-color: #0B1120;">' +
        '<img src="' + escapeHtml(d.img) + '" alt="' + escapeHtml(d.name) + '" style="' + imgStyle + '">' +
        '<div style="position: absolute; inset: 0; background: linear-gradient(180deg, rgba(11, 17, 32, 0.08) 40%, rgba(11, 17, 32, 0.72) 100%); pointer-events: none;"></div>' +
        '<span style="position: absolute; top: 7px; left: 7px; padding: 3px 8px; border-radius: 999px; font-size: 10.5px; font-weight: 700; backdrop-filter: blur(4px); background-color: ' + tagBg + '; color: ' + tagColor + '; border: 1px solid ' + tagBorder + ';">' + escapeHtml(d.tag) + '</span>' +
        outOverlay +
        qtyBadge +
        '</div>' +
        '<div style="display: flex; flex-direction: column; gap: 3px; flex: 1;">' +
        '<h3 style="margin: 0; font-size: 13.5px; font-weight: 700; color: ' + (isOut ? '#CBD5E1' : '#F8FAFC') + '; line-height: 1.3;">' + escapeHtml(d.name) + '</h3>' +
        '<span style="font-size: 11.5px; color: #94A3B8;">' + escapeHtml(d.categoryLabel) + (isOut ? ' &middot; <strong style="color: #FCA5A5;">Khóa bếp 86</strong>' : '') + '</span>' +
        '</div>' +
        '<div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; padding-top: 6px; border-top: 1px dashed rgba(148, 163, 184, 0.16);">' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 14.5px; font-weight: 800; color: ' + (isOut ? '#94A3B8' : '#FBBF24') + '; white-space: nowrap;">' + formatVnd(d.price) + '</span>' +
        actionControl +
        '</div></article>';
    }

    if (matchCount === 0) {
      html = '<div style="grid-column: 1 / -1; padding: 40px 20px; text-align: center; border-radius: 14px; border: 1px dashed rgba(148, 163, 184, 0.28); color: #94A3B8; font-size: 14px;">Không tìm thấy món phù hợp với từ khóa hoặc bộ lọc hiện tại.</div>';
    }

    document.getElementById('pos-dish-grid').innerHTML = html;
  }

  function renderOrderListAndTotals() {
    var totals = computeTotals();
    var html = '';

    if (state.orderItems.length === 0) {
      html = '<div style="padding: 36px 16px; text-align: center; border-radius: 12px; border: 1px dashed rgba(148, 163, 184, 0.25); color: #94A3B8; font-size: 13px;">Chưa có món nào trong phiếu. Hãy chọn món từ thực đơn bên trái.</div>';
    } else {
      for (var i = 0; i < state.orderItems.length; i++) {
        var it = state.orderItems[i];
        var isNew = it.status === 'new';
        var isOut = isDishOutOfStock(it.name);
        var statusBg = isNew ? 'rgba(245, 158, 11, 0.22)' : 'rgba(16, 185, 129, 0.16)';
        var statusColor = isNew ? '#FDE68A' : '#6EE7B7';
        var statusBorder = isNew ? 'rgba(245, 158, 11, 0.48)' : 'rgba(16, 185, 129, 0.35)';
        var statusLabel = isNew ? 'Món mới chọn' : 'Đã gửi bếp';

        var topRightAction = isNew
          ? '<button type="button" data-line-remove="' + escapeHtml(it.lineId) + '" aria-label="Xóa món mới khỏi phiếu order" style="min-width: 36px; min-height: 36px; border-radius: 8px; background-color: rgba(239, 68, 68, 0.14); border: 1px solid rgba(239, 68, 68, 0.35); color: #FCA5A5; cursor: pointer; display: inline-flex; align-items: center; justify-content: center; flex-shrink: 0;">' +
            '<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
            '<path d="M3 6H21"></path><path d="M19 6V20A2 2 0 0 1 17 22H7A2 2 0 0 1 5 20V6"></path><path d="M8 6V4A2 2 0 0 1 10 2H14A2 2 0 0 1 16 4V6"></path>' +
            '</svg></button>'
          : '<button type="button" class="pos-void-btn" data-line-void="' + escapeHtml(it.lineId) + '">Hủy/Trả món</button>';

        var noteHtml = isNew
          ? '<button type="button" data-line-note="' + escapeHtml(it.lineId) + '" style="padding: 2px 7px; border-radius: 6px; background-color: rgba(30, 41, 59, 0.9); border: 1px solid rgba(148, 163, 184, 0.25); color: #CBD5E1; font-size: 11px; cursor: pointer;">Ghi chú: ' + escapeHtml(it.note || 'Bình thường') + '</button>'
          : '<span style="padding: 2px 7px; border-radius: 6px; background-color: rgba(15, 23, 42, 0.75); border: 1px solid rgba(148, 163, 184, 0.18); color: #94A3B8; font-size: 11px;">Ghi chú: ' + escapeHtml(it.note || 'Bình thường') + '</span>';

        var decBtnHtml = isNew
          ? '<button type="button" data-line-dec="' + escapeHtml(it.lineId) + '" aria-label="Giảm số lượng" style="min-width: 34px; min-height: 34px; border-radius: 6px; border: none; background-color: #1E293B; color: #F8FAFC; font-size: 15px; font-weight: 700; cursor: pointer;">-</button>'
          : '<button type="button" disabled aria-label="Đã gửi bếp - khóa nút giảm" title="Món đã gửi bếp — không thể tự ý giảm số lượng, vui lòng chọn Hủy/Trả món" style="min-width: 34px; min-height: 34px; border-radius: 6px; border: none; background-color: #1E293B; color: #64748B; font-size: 15px; font-weight: 700; cursor: not-allowed; opacity: 0.38;">-</button>';

        var incAttr = isOut
          ? ' disabled title="Món đang tạm hết (86-List)"'
          : (isNew ? ' data-line-inc="' + escapeHtml(it.lineId) + '"' : ' data-line-add-extra="' + escapeHtml(it.dishId) + '" title="Gọi thêm 1 phần mới"');
        var incStyle = 'min-width: 34px; min-height: 34px; border-radius: 6px; border: none; background-color: #1E293B; color: #F8FAFC; font-size: 15px; font-weight: 700; ' +
          (isOut ? 'cursor: not-allowed; opacity: 0.38;' : 'cursor: pointer;');

        html +=
          '<div class="pos-order-row' + (isNew ? ' is-new' : '') + '">' +
          '<div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 8px;">' +
          '<div style="display: flex; flex-direction: column; gap: 3px; min-width: 0;">' +
          '<div style="display: flex; align-items: center; gap: 6px; flex-wrap: wrap;">' +
          '<span style="font-size: 13.5px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(it.name) + '</span>' +
          '<span style="padding: 2px 8px; border-radius: 999px; font-size: 10.5px; font-weight: 700; background-color: ' + statusBg + '; color: ' + statusColor + '; border: 1px solid ' + statusBorder + ';">' + statusLabel + '</span>' +
          '</div>' +
          '<div style="display: flex; align-items: center; gap: 8px; font-size: 11.5px; color: #94A3B8; flex-wrap: wrap;">' +
          '<span style="font-family: \'JetBrains Mono\', monospace;">Đơn giá: ' + formatVnd(it.price) + '</span>' +
          noteHtml +
          '</div></div>' +
          topRightAction +
          '</div>' +
          '<div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; padding-top: 4px; border-top: 1px dashed rgba(148, 163, 184, 0.14);">' +
          '<div style="display: inline-flex; align-items: center; gap: 4px; background-color: #0B1120; border: 1px solid rgba(148, 163, 184, 0.24); border-radius: 8px; padding: 2px;">' +
          decBtnHtml +
          '<span style="min-width: 24px; text-align: center; font-family: \'JetBrains Mono\', monospace; font-size: 13px; font-weight: 800; color: #F8FAFC;">' + it.qty + '</span>' +
          '<button type="button"' + incAttr + ' aria-label="Tăng số lượng" style="' + incStyle + '">+</button>' +
          '</div>' +
          '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 15px; font-weight: 800; color: #FBBF24;">' + formatVnd(it.price * it.qty) + '</span>' +
          '</div></div>';
      }
    }

    document.getElementById('pos-order-list').innerHTML = html;
    document.getElementById('bill-count-summary').textContent = totals.totalItems + ' phần · ' + totals.pendingKitchen + ' chờ bếp';
    document.getElementById('summary-subtotal').textContent = formatVnd(totals.subtotal);
    document.getElementById('summary-discount').textContent = '-' + formatVnd(totals.discount);
    document.getElementById('summary-vat').textContent = '+' + formatVnd(totals.vat);
    document.getElementById('summary-grand-total').textContent = formatVnd(totals.grandTotal);
    document.getElementById('modal-grand-total').textContent = formatVnd(totals.grandTotal);

    var kitchenBtn = document.getElementById('btn-send-kitchen');
    var kitchenLabel = document.getElementById('btn-send-kitchen-label');
    if (totals.pendingKitchen > 0) {
      kitchenBtn.classList.remove('is-sent');
      kitchenLabel.textContent = 'Gửi bếp (' + totals.pendingKitchen + ' món mới)';
    } else {
      kitchenBtn.classList.add('is-sent');
      kitchenLabel.textContent = 'Đã gửi đủ bếp';
    }

    var badge = document.getElementById('hdr-table-badge');
    var dot = document.getElementById('hdr-table-dot');
    var statusText = document.getElementById('hdr-table-status');
    if (state.tablePaid) {
      badge.classList.add('is-paid');
      dot.classList.add('is-paid');
      statusText.textContent = 'Đã thanh toán';
    } else {
      badge.classList.remove('is-paid');
      dot.classList.remove('is-paid');
      statusText.textContent = 'Đang phục vụ';
    }

    syncModalPaymentUI();
  }

  function renderBanner() {
    var banner = document.getElementById('order-banner');
    var msgEl = document.getElementById('order-banner-msg');
    var linkEl = document.getElementById('order-banner-link');
    if (state.bannerMsg) {
      msgEl.textContent = state.bannerMsg;
      linkEl.style.display = state.bannerKitchenLink ? 'inline-flex' : 'none';
      banner.classList.add('is-visible');
    } else {
      linkEl.style.display = 'none';
      banner.classList.remove('is-visible');
    }
  }

  function syncVoidModalUI() {
    var idx = findLineIndex(state.voidTargetLineId);
    if (idx === -1) return;
    var line = state.orderItems[idx];
    document.getElementById('void-dish-name').textContent = line.name;
    document.getElementById('void-dish-sent-qty').textContent = String(line.qty);
    document.getElementById('void-qty-val').textContent = String(state.voidQty);
    document.getElementById('void-reasons-list').innerHTML = VOID_REASONS.map(function (r) {
      var cls = 'pos-void-reason-pill' + (state.voidReason === r ? ' is-active' : '');
      return '<button type="button" class="' + cls + '" data-void-reason="' + escapeHtml(r) + '">' + escapeHtml(r) + '</button>';
    }).join('');
  }

  function syncModalPaymentUI() {
    var totals = computeTotals();
    var cashTab = document.getElementById('tab-method-cash');
    var qrTab = document.getElementById('tab-method-qr');
    var cashView = document.getElementById('view-method-cash');
    var qrView = document.getElementById('view-method-qr');

    cashTab.classList.toggle('is-active', state.payMethod === 'cash');
    qrTab.classList.toggle('is-active', state.payMethod === 'qr');
    cashView.style.display = state.payMethod === 'cash' ? 'flex' : 'none';
    qrView.style.display = state.payMethod === 'qr' ? 'flex' : 'none';

    var changeAmt = Math.max(0, (Number(state.cashGiven) || 0) - totals.grandTotal);
    document.getElementById('modal-change-amount').textContent = formatVnd(changeAmt);
  }

  function renderAll() {
    renderBanner();
    renderTabs();
    render86CountAndModal();
    renderDishGrid();
    renderOrderListAndTotals();
  }

  document.addEventListener('DOMContentLoaded', function () {
    renderAll();

    document.getElementById('order-banner-dismiss').addEventListener('click', function () {
      state.bannerMsg = '';
      state.bannerKitchenLink = false;
      renderBanner();
    });

    document.getElementById('category-tabs-bar').addEventListener('click', function (e) {
      var btn = e.target.closest('[data-cat-id]');
      if (!btn) return;
      state.activeCat = btn.getAttribute('data-cat-id');
      renderTabs();
      renderDishGrid();
    });

    document.getElementById('dish-search-input').addEventListener('input', function () {
      state.searchQuery = this.value;
      renderDishGrid();
    });

    document.getElementById('bestseller-filter-btn').addEventListener('click', function () {
      state.bestSellerOnly = !state.bestSellerOnly;
      this.classList.toggle('is-active', state.bestSellerOnly);
      renderDishGrid();
    });

    document.getElementById('pos-dish-grid').addEventListener('click', function (e) {
      var incBtn = e.target.closest('[data-dish-inc]');
      if (incBtn && !incBtn.disabled) {
        adjustGridDish(incBtn.getAttribute('data-dish-inc'), 1);
        return;
      }
      var decBtn = e.target.closest('[data-dish-dec]');
      if (decBtn && !decBtn.disabled) {
        adjustGridDish(decBtn.getAttribute('data-dish-dec'), -1);
      }
    });

    var voidModal = document.getElementById('pos-void-modal');
    function openVoidModal(lineId) {
      var idx = findLineIndex(lineId);
      if (idx === -1) return;
      state.voidTargetLineId = lineId;
      state.voidQty = 1;
      state.voidReason = VOID_REASONS[0];
      document.getElementById('void-note-input').value = '';
      syncVoidModalUI();
      voidModal.classList.add('is-open');
    }
    function closeVoidModal() {
      state.voidTargetLineId = null;
      voidModal.classList.remove('is-open');
    }

    document.getElementById('void-modal-close-x').addEventListener('click', closeVoidModal);
    document.getElementById('void-modal-cancel-btn').addEventListener('click', closeVoidModal);
    voidModal.addEventListener('click', function (e) {
      if (e.target === voidModal) closeVoidModal();
    });

    document.getElementById('void-qty-dec').addEventListener('click', function () {
      if (state.voidQty > 1) {
        state.voidQty -= 1;
        document.getElementById('void-qty-val').textContent = String(state.voidQty);
      }
    });

    document.getElementById('void-qty-inc').addEventListener('click', function () {
      var idx = findLineIndex(state.voidTargetLineId);
      if (idx === -1) return;
      if (state.voidQty < state.orderItems[idx].qty) {
        state.voidQty += 1;
        document.getElementById('void-qty-val').textContent = String(state.voidQty);
      }
    });

    document.getElementById('void-reasons-list').addEventListener('click', function (e) {
      var btn = e.target.closest('[data-void-reason]');
      if (!btn) return;
      state.voidReason = btn.getAttribute('data-void-reason');
      syncVoidModalUI();
    });

    document.getElementById('void-modal-confirm-btn').addEventListener('click', function () {
      var idx = findLineIndex(state.voidTargetLineId);
      if (idx === -1) {
        closeVoidModal();
        return;
      }
      var line = state.orderItems[idx];
      var cancelQty = Math.min(state.voidQty, line.qty);
      var extraNote = (document.getElementById('void-note-input').value || '').trim();
      if (cancelQty >= line.qty) {
        state.orderItems.splice(idx, 1);
      } else {
        line.qty -= cancelQty;
      }
      state.bannerKitchenLink = false;
      state.bannerMsg = 'Đã hủy/trả x' + cancelQty + ' "' + line.name + '" đã báo bếp (Lý do: ' + state.voidReason + (extraNote ? ' · ' + extraNote : '') + '). Đã lưu nhật ký kiểm soát.';
      closeVoidModal();
      renderAll();
    });

    var modal86 = document.getElementById('pos-86-modal');
    function open86Modal() {
      render86CountAndModal();
      modal86.classList.add('is-open');
    }
    function close86Modal() {
      modal86.classList.remove('is-open');
    }
    document.getElementById('btn-sync-86').addEventListener('click', open86Modal);
    document.getElementById('pos-86-close-x').addEventListener('click', close86Modal);
    document.getElementById('pos-86-done-btn').addEventListener('click', close86Modal);
    modal86.addEventListener('click', function (e) {
      if (e.target === modal86) close86Modal();
    });

    document.getElementById('pos-86-list').addEventListener('click', function (e) {
      var btn = e.target.closest('[data-toggle-order86]');
      if (!btn) return;
      var dishName = btn.getAttribute('data-toggle-order86');
      var idx = state.outOfStockNames.indexOf(dishName);
      if (idx !== -1) {
        state.outOfStockNames.splice(idx, 1);
        state.bannerMsg = 'Đã mở bán lại "' + dishName + '" trên POS Order & đồng bộ 86-List.';
      } else {
        state.outOfStockNames.push(dishName);
        state.bannerMsg = 'Đã bật Tạm hết (86-List) cho "' + dishName + '" — khóa nút gọi thêm trên POS.';
      }
      state.bannerKitchenLink = false;
      saveOutOfStockNames(state.outOfStockNames);
      renderAll();
    });

    document.getElementById('pos-order-list').addEventListener('click', function (e) {
      var incBtn = e.target.closest('[data-line-inc]');
      if (incBtn && !incBtn.disabled) {
        adjustNewLineQty(incBtn.getAttribute('data-line-inc'), 1);
        return;
      }
      var addExtraBtn = e.target.closest('[data-line-add-extra]');
      if (addExtraBtn && !addExtraBtn.disabled) {
        adjustGridDish(addExtraBtn.getAttribute('data-line-add-extra'), 1);
        return;
      }
      var decBtn = e.target.closest('[data-line-dec]');
      if (decBtn && !decBtn.disabled) {
        adjustNewLineQty(decBtn.getAttribute('data-line-dec'), -1);
        return;
      }
      var remBtn = e.target.closest('[data-line-remove]');
      if (remBtn) {
        removeNewLine(remBtn.getAttribute('data-line-remove'));
        return;
      }
      var voidBtn = e.target.closest('[data-line-void]');
      if (voidBtn) {
        openVoidModal(voidBtn.getAttribute('data-line-void'));
        return;
      }
      var noteBtn = e.target.closest('[data-line-note]');
      if (noteBtn) {
        cycleOrderNote(noteBtn.getAttribute('data-line-note'));
      }
    });

    document.getElementById('order-discount-select').addEventListener('change', function () {
      state.discountType = this.value;
      renderOrderListAndTotals();
    });

    document.getElementById('btn-print-temp').addEventListener('click', function () {
      var totals = computeTotals();
      state.bannerKitchenLink = false;
      state.bannerMsg = 'Đã gửi lệnh in Phiếu tạm tính cho ' + BOOT.tableName + ' (' + formatVnd(totals.grandTotal) + ') ra máy in thu ngân.';
      renderBanner();
    });

    document.getElementById('btn-send-kitchen').addEventListener('click', function () {
      var totals = computeTotals();
      state.bannerKitchenLink = true;
      if (totals.pendingKitchen === 0) {
        state.bannerMsg = 'Tất cả món trong phiếu đã được gửi xuống bếp trước đó.';
        renderBanner();
        return;
      }
      var merged = [];
      for (var i = 0; i < state.orderItems.length; i++) {
        var cur = state.orderItems[i];
        var foundSent = null;
        for (var j = 0; j < merged.length; j++) {
          if (merged[j].dishId === cur.dishId && merged[j].status === 'sent') {
            foundSent = merged[j];
            break;
          }
        }
        if (foundSent && cur.status === 'new') {
          foundSent.qty += cur.qty;
        } else {
          cur.status = 'sent';
          merged.push(cur);
        }
      }
      state.orderItems = merged;
      state.bannerMsg = 'Đã gửi bếp chế biến xuống Bếp Nóng & Bar cho ' + totals.pendingKitchen + ' phần món mới.';
      renderAll();
    });

    var payModal = document.getElementById('pos-pay-modal');
    function openPayModal() {
      var totals = computeTotals();
      state.cashGiven = Math.max(totals.grandTotal, 1600000);
      document.getElementById('cash-received-input').value = state.cashGiven;
      syncModalPaymentUI();
      payModal.classList.add('is-open');
    }
    function closePayModal() {
      payModal.classList.remove('is-open');
    }

    document.getElementById('btn-open-checkout').addEventListener('click', openPayModal);
    document.getElementById('pay-modal-close-x').addEventListener('click', closePayModal);
    document.getElementById('pay-modal-close-btn').addEventListener('click', closePayModal);
    payModal.addEventListener('click', function (e) {
      if (e.target === payModal) closePayModal();
    });

    document.getElementById('tab-method-cash').addEventListener('click', function () {
      state.payMethod = 'cash';
      syncModalPaymentUI();
    });

    document.getElementById('tab-method-qr').addEventListener('click', function () {
      state.payMethod = 'qr';
      syncModalPaymentUI();
    });

    var cashInput = document.getElementById('cash-received-input');
    cashInput.addEventListener('input', function () {
      state.cashGiven = Number(this.value) || 0;
      syncModalPaymentUI();
    });

    document.getElementById('btn-cash-exact').addEventListener('click', function () {
      state.cashGiven = computeTotals().grandTotal;
      cashInput.value = state.cashGiven;
      syncModalPaymentUI();
    });

    document.getElementById('btn-cash-1500').addEventListener('click', function () {
      state.cashGiven = 1500000;
      cashInput.value = 1500000;
      syncModalPaymentUI();
    });

    document.getElementById('btn-cash-2000').addEventListener('click', function () {
      state.cashGiven = 2000000;
      cashInput.value = 2000000;
      syncModalPaymentUI();
    });

    document.getElementById('pay-modal-confirm-btn').addEventListener('click', function () {
      var totals = computeTotals();
      state.tablePaid = true;
      state.bannerKitchenLink = false;
      closePayModal();
      state.bannerMsg = 'Thanh toán thành công ' + formatVnd(totals.grandTotal) + ' cho ' + BOOT.tableName + ' (' + (state.payMethod === 'qr' ? 'VietQR' : 'Tiền mặt') + '). Đang quay lại Sơ đồ bàn...';
      renderAll();
      setTimeout(function () {
        window.location.href = BOOT.posUrl + '?paidTableId=' + encodeURIComponent(BOOT.tableId) + '&paidAmount=' + encodeURIComponent(totals.grandTotal);
      }, 450);
    });

    window.addEventListener('storage', function (e) {
      if (e.key === STORAGE_86_KEY) {
        state.outOfStockNames = loadOutOfStockNames();
        renderAll();
      }
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        closePayModal();
        closeVoidModal();
        close86Modal();
      }
    });
  });
})();
</script>
</body>
</html>

