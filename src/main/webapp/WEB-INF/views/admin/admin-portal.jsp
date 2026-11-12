<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HOUGO ADMIN — Cổng Quản Trị Hệ Thống</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&amp;family=JetBrains+Mono:wght@500;700;800&amp;family=Playfair+Display:wght@600;700&amp;display=swap">
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      min-height: 100vh;
      background-color: #0B1120;
      color: #F8FAFC;
      font-family: 'Be Vietnam Pro', system-ui, -apple-system, sans-serif;
      color-scheme: dark;
    }

    a {
      text-decoration: none;
    }

    button,
    input,
    select {
      font-family: inherit;
    }

    button,
    a.admin-quick-link,
    a.admin-logout-btn {
      transition: transform 0.14s ease, filter 0.14s ease, background-color 0.14s ease, border-color 0.14s ease, box-shadow 0.14s ease;
    }

    button:hover:not(:disabled),
    a.admin-quick-link:hover,
    a.admin-logout-btn:hover {
      filter: brightness(1.08);
    }

    button:active:not(:disabled),
    a.admin-quick-link:active,
    a.admin-logout-btn:active {
      transform: scale(0.985);
    }

    button:focus-visible,
    a:focus-visible,
    input:focus-visible,
    select:focus-visible {
      outline: 2px solid #F59E0B;
      outline-offset: 2px;
    }

    input::placeholder {
      color: #94A3B8;
    }

    @keyframes adminPulse {
      0%, 100% {
        opacity: 1;
        transform: scale(1);
      }
      50% {
        opacity: 0.45;
        transform: scale(1.25);
      }
    }

    .admin-live-dot {
      animation: adminPulse 1.8s ease-in-out infinite;
    }

    .admin-scroll::-webkit-scrollbar {
      height: 6px;
      width: 6px;
    }

    .admin-scroll::-webkit-scrollbar-thumb {
      background: rgba(148, 163, 184, 0.28);
      border-radius: 999px;
    }

    .admin-shell {
      min-height: 100vh;
      width: 100%;
      background-color: #0B1120;
      color: #F8FAFC;
      display: flex;
      flex-wrap: wrap;
      align-items: stretch;
    }

    .admin-sidebar {
      flex: 1 1 250px;
      min-width: 250px;
      background-color: #111827;
      border-right: 1px solid #334155;
      padding: 20px 16px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      gap: 22px;
    }

    .admin-main {
      flex: 999 1 680px;
      min-width: 0;
      padding: 22px 26px 32px;
      display: flex;
      flex-direction: column;
      gap: 18px;
    }

    .admin-nav-btn {
      min-height: 54px;
      width: 100%;
      padding: 8px 11px;
      border-radius: 11px;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 10px;
      border: 1px solid transparent;
      background-color: rgba(15, 23, 42, 0.45);
      color: #E2E8F0;
    }

    .admin-nav-btn.is-active {
      border-color: rgba(245, 158, 11, 0.72);
      background-color: #B91C1C;
      color: #FAF7F2;
    }

    .admin-nav-sub {
      font-size: 11px;
      font-weight: 500;
      color: #94A3B8;
    }

    .admin-nav-btn.is-active .admin-nav-sub {
      color: #FDE68A;
    }

    .admin-pill-btn {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      font-size: 12.5px;
      font-weight: 700;
      cursor: pointer;
      white-space: nowrap;
      border: 1px solid #334155;
      background-color: #0F172A;
      color: #CBD5E1;
    }

    .admin-pill-btn.is-active {
      border-color: rgba(245, 158, 11, 0.75);
      background-color: #991B1B;
      color: #FDE68A;
    }

    .admin-tab-panel {
      display: none;
      flex-direction: column;
      gap: 18px;
    }

    .admin-tab-panel.is-active {
      display: flex;
    }

    .admin-modal-backdrop {
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

    .admin-modal-backdrop.is-open {
      display: flex;
    }

    @media (max-width: 1120px) {
      .admin-sidebar {
        flex: 1 1 228px;
        min-width: 220px;
        padding: 16px 12px;
      }

      .admin-main {
        flex: 999 1 600px;
        padding: 16px 18px 24px;
      }
    }

    @media (max-width: 780px) {
      .admin-sidebar {
        flex: 1 1 100%;
        border-right: none;
        border-bottom: 1px solid #334155;
      }

      .admin-main {
        flex: 1 1 100%;
        padding: 14px;
      }
    }
  </style>
</head>
<body>
<div class="admin-shell">

  <!-- SIDEBAR CỐ ĐỊNH BÊN TRÁI -->
  <aside class="admin-sidebar">

    <div style="display: flex; flex-direction: column; gap: 20px;">
      <!-- Brand Logo HOUGO ADMIN -->
      <div style="display: flex; align-items: center; gap: 11px; padding: 4px 6px 14px; border-bottom: 1px solid rgba(245, 158, 11, 0.25);">
        <div style="width: 42px; height: 42px; border-radius: 11px; background: linear-gradient(135deg, #B91C1C, #7F1D1D); border: 1.5px solid rgba(251, 191, 36, 0.65); display: flex; align-items: center; justify-content: center; flex-shrink: 0;">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FDE68A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M12 2L15 8L21 9L16.5 14L17.5 21L12 17.5L6.5 21L7.5 14L3 9L9 8L12 2Z"></path>
          </svg>
        </div>
        <div style="display: flex; flex-direction: column; gap: 2px;">
          <span style="font-family: 'Playfair Display', Georgia, serif; font-size: 17px; font-weight: 700; letter-spacing: 0.06em; color: #FAF7F2;">HOUGO ADMIN</span>
          <span style="font-size: 11px; font-weight: 700; letter-spacing: 0.08em; color: #FBBF24;">QUẢN TRỊ HỆ THỐNG</span>
        </div>
      </div>

      <!-- 5 Interactive Navigation Tabs -->
      <nav aria-label="Điều hướng Quản trị viên" style="display: flex; flex-direction: column; gap: 7px;">
        <span style="padding: 0 10px 4px; font-size: 11px; font-weight: 700; letter-spacing: 0.12em; color: #94A3B8; text-transform: uppercase;">Nghiệp vụ Quản trị</span>

        <button type="button" class="admin-nav-btn is-active" data-nav-tab="reports">
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" style="flex-shrink: 0;">
            <path d="M3 3V21H21"></path>
            <path d="M18 17V9"></path>
            <path d="M13 17V5"></path>
            <path d="M8 17V14"></path>
          </svg>
          <div style="flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: flex-start; gap: 2px;">
            <span style="font-size: 13.5px; font-weight: 700; line-height: 1.2;">Báo cáo &amp; Thống kê</span>
            <span class="admin-nav-sub">Doanh thu &amp; KPI</span>
          </div>
        </button>

        <button type="button" class="admin-nav-btn" data-nav-tab="bookings">
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" style="flex-shrink: 0;">
            <rect x="3" y="4" width="18" height="18" rx="2"></rect>
            <path d="M16 2V6"></path>
            <path d="M8 2V6"></path>
            <path d="M3 10H21"></path>
          </svg>
          <div style="flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: flex-start; gap: 2px;">
            <span style="font-size: 13.5px; font-weight: 700; line-height: 1.2;">Quản lý Đặt bàn</span>
            <span class="admin-nav-sub">Xếp bàn trực tuyến</span>
          </div>
          <span id="nav-pending-badge" style="padding: 2px 7px; border-radius: 999px; background-color: rgba(245, 158, 11, 0.22); border: 1px solid rgba(245, 158, 11, 0.55); color: #FDE68A; font-family: 'JetBrains Mono', monospace; font-size: 11px; font-weight: 800; flex-shrink: 0;">3</span>
        </button>

        <button type="button" class="admin-nav-btn" data-nav-tab="menu">
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" style="flex-shrink: 0;">
            <path d="M3 2V7C3 9.21 4.79 11 7 11V22"></path>
            <path d="M7 2V11"></path>
            <path d="M11 2V7C11 9.21 9.21 11 7 11"></path>
            <path d="M17 2V22"></path>
            <path d="M21 2C21 2 21 9 17 11"></path>
          </svg>
          <div style="flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: flex-start; gap: 2px;">
            <span style="font-size: 13.5px; font-weight: 700; line-height: 1.2;">Quản trị Thực đơn</span>
            <span class="admin-nav-sub">Món ăn &amp; Đơn giá</span>
          </div>
        </button>

        <button type="button" class="admin-nav-btn" data-nav-tab="tables">
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" style="flex-shrink: 0;">
            <rect x="3" y="3" width="7" height="7" rx="1.5"></rect>
            <rect x="14" y="3" width="7" height="7" rx="1.5"></rect>
            <rect x="3" y="14" width="7" height="7" rx="1.5"></rect>
            <rect x="14" y="14" width="7" height="7" rx="1.5"></rect>
          </svg>
          <div style="flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: flex-start; gap: 2px;">
            <span style="font-size: 13.5px; font-weight: 700; line-height: 1.2;">Quản trị Bàn ăn</span>
            <span class="admin-nav-sub">Tầng &amp; Phòng VIP</span>
          </div>
        </button>

        <button type="button" class="admin-nav-btn" data-nav-tab="accounts">
          <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" style="flex-shrink: 0;">
            <path d="M16 21V19C16 16.79 14.21 15 12 15H6C3.79 15 2 16.79 2 19V21"></path>
            <circle cx="9" cy="7" r="4"></circle>
            <path d="M22 21V19C22 17.13 20.73 15.56 19 15.13"></path>
            <path d="M16 3.13C17.73 3.56 19 5.13 19 7C19 8.87 17.73 10.44 16 10.87"></path>
          </svg>
          <div style="flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: flex-start; gap: 2px;">
            <span style="font-size: 13.5px; font-weight: 700; line-height: 1.2;">Tài khoản &amp; Phân quyền</span>
            <span class="admin-nav-sub">Nhân sự &amp; Vai trò</span>
          </div>
        </button>
      </nav>
    </div>

    <!-- Quick Links Cluster -->
    <div style="display: flex; flex-direction: column; gap: 8px; padding-top: 14px; border-top: 1px solid #334155;">
      <span style="padding: 0 8px 2px; font-size: 11px; font-weight: 700; letter-spacing: 0.12em; color: #94A3B8; text-transform: uppercase;">Truy cập nhanh hệ thống</span>

      <a href="${pageContext.request.contextPath}/pos" class="admin-quick-link" style="min-height: 44px; width: 100%; padding: 0 12px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 12.5px; font-weight: 700; display: flex; align-items: center; justify-content: space-between; gap: 8px;">
        <span>Sơ đồ bàn POS</span>
        <span style="font-family: 'JetBrains Mono', monospace; font-size: 11px; color: #FBBF24;">/pos</span>
      </a>

      <a href="${pageContext.request.contextPath}/kitchen" class="admin-quick-link" style="min-height: 44px; width: 100%; padding: 0 12px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 12.5px; font-weight: 700; display: flex; align-items: center; justify-content: space-between; gap: 8px;">
        <span>Màn hình Bếp (KDT)</span>
        <span style="font-family: 'JetBrains Mono', monospace; font-size: 11px; color: #FCA5A5;">/kitchen</span>
      </a>

      <a href="${pageContext.request.contextPath}/home" class="admin-quick-link" style="min-height: 44px; width: 100%; padding: 0 12px; border-radius: 10px; background-color: #0F172A; border: 1px solid #334155; color: #CBD5E1; font-size: 12.5px; font-weight: 600; display: flex; align-items: center; justify-content: space-between; gap: 8px;">
        <span>Trang chủ Nhà hàng</span>
        <span style="font-family: 'JetBrains Mono', monospace; font-size: 11px; color: #94A3B8;">/home</span>
      </a>
    </div>
  </aside>

  <!-- KHU VỰC NỘI DUNG CHÍNH BÊN PHẢI -->
  <main class="admin-main">

    <!-- Top Admin Context Bar -->
    <header style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 14px; padding-bottom: 16px; border-bottom: 1px solid #334155;">
      <div style="display: flex; flex-direction: column; gap: 4px;">
        <span id="header-eyebrow" style="font-size: 11.5px; font-weight: 700; letter-spacing: 0.14em; color: #F59E0B;">BÁO CÁO ĐIỀU HÀNH</span>
        <h1 id="header-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 26px; font-weight: 700; color: #FAF7F2;">Báo Cáo &amp; Thống Kê Doanh Thu</h1>
        <span id="header-desc" style="font-size: 13px; color: #94A3B8;">Theo dõi chỉ số kinh doanh, cơ cấu nước lẩu và sản lượng bán chạy theo kỳ.</span>
      </div>

      <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 10px;">
        <div style="min-height: 44px; padding: 0 14px; border-radius: 10px; background-color: #111827; border: 1px solid #334155; display: inline-flex; align-items: center; gap: 8px; font-size: 12.5px; color: #CBD5E1;">
          <span class="admin-live-dot" style="width: 8px; height: 8px; border-radius: 999px; background-color: #10B981; display: inline-block;"></span>
          <span>Đồng bộ POS &amp; KDT: <strong style="color: #6EE7B7;">Trực tuyến</strong></span>
        </div>

        <div style="min-height: 44px; padding: 0 14px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(245, 158, 11, 0.38); display: inline-flex; align-items: center; gap: 9px;">
          <div style="width: 28px; height: 28px; border-radius: 999px; background-color: #991B1B; color: #FDE68A; font-size: 12px; font-weight: 800; display: flex; align-items: center; justify-content: center;">${not empty sessionScope.authShortCode ? sessionScope.authShortCode : 'QT'}</div>
          <div style="display: flex; flex-direction: column;">
            <span style="font-size: 12.5px; font-weight: 700; color: #F8FAFC;">${not empty sessionScope.authFullName ? sessionScope.authFullName : 'Nguyễn Hoàng Hải'}</span>
            <span style="font-size: 11px; color: #FBBF24;">${not empty sessionScope.authRole ? sessionScope.authRole : 'Quản trị viên'} &middot; ${not empty sessionScope.authShift ? sessionScope.authShift : 'Ca Tối'}</span>
          </div>
        </div>

        <a href="${pageContext.request.contextPath}/login" class="admin-logout-btn" style="min-height: 44px; padding: 0 13px; border-radius: 10px; background-color: rgba(153, 27, 27, 0.35); border: 1px solid rgba(248, 113, 113, 0.55); color: #FECACA; font-size: 12.5px; font-weight: 700; display: inline-flex; align-items: center; gap: 6px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M9 21H5C3.9 21 3 20.1 3 19V5C3 3.9 3.9 3 5 3H9"></path>
            <polyline points="16 17 21 12 16 7"></polyline>
            <line x1="21" y1="12" x2="9" y2="12"></line>
          </svg>
          <span>Đăng xuất</span>
        </a>
      </div>
    </header>

    <!-- Feedback Status Banner -->
    <div id="admin-banner" role="status" aria-live="polite" style="display: none; padding: 10px 16px; border-radius: 11px; background-color: rgba(185, 28, 28, 0.24); border: 1px solid rgba(245, 158, 11, 0.55); align-items: center; justify-content: space-between; gap: 12px;">
      <span id="admin-banner-text" style="font-size: 13px; font-weight: 600; color: #F8FAFC;"></span>
      <button type="button" id="admin-banner-close" style="min-height: 44px; padding: 0 14px; border-radius: 8px; background-color: #111827; border: 1px solid #334155; color: #CBD5E1; font-size: 12px; font-weight: 700; cursor: pointer;">Đóng</button>
    </div>

    <!-- TAB 1: BÁO CÁO & THỐNG KÊ -->
    <section id="tab-reports" class="admin-tab-panel is-active">
      <!-- Period Filters + Export / Print Action Bar -->
      <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 12px; background-color: #111827; border: 1px solid #334155; border-radius: 14px; padding: 10px 14px;">
        <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 10px;">
          <span style="font-size: 13px; font-weight: 700; color: #CBD5E1;">Kỳ thống kê:</span>
          <div id="period-filters" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
        </div>

        <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
          <button type="button" id="btn-export-excel" style="min-height: 44px; padding: 0 14px; border-radius: 10px; background-color: #064E3B; border: 1px solid rgba(52, 211, 153, 0.55); color: #A7F3D0; font-size: 12.5px; font-weight: 700; cursor: pointer; display: inline-flex; align-items: center; gap: 7px; white-space: nowrap;">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M14 2H6C4.9 2 4 2.9 4 4V20C4 21.1 4.9 22 6 22H18C19.1 22 20 21.1 20 20V8Z"></path>
              <polyline points="14 2 14 8 20 8"></polyline>
              <line x1="8" y1="13" x2="16" y2="17"></line>
              <line x1="16" y1="13" x2="8" y2="17"></line>
            </svg>
            <span>Xuất Excel (.xlsx)</span>
          </button>

          <button type="button" id="btn-print-shift" style="min-height: 44px; padding: 0 14px; border-radius: 10px; background-color: #1E293B; border: 1px solid #475569; color: #F8FAFC; font-size: 12.5px; font-weight: 700; cursor: pointer; display: inline-flex; align-items: center; gap: 7px; white-space: nowrap;">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <polyline points="6 9 6 2 18 2 18 9"></polyline>
              <path d="M6 18H4C2.9 18 2 17.1 2 16V11C2 9.9 2.9 9 4 9H20C21.1 9 22 9.9 22 11V16C22 17.1 21.1 18 20 18H18"></path>
              <rect x="6" y="14" width="12" height="8"></rect>
            </svg>
            <span>In báo cáo ca</span>
          </button>
        </div>
      </div>

      <!-- 4 KPI Cards -->
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(min(230px, 100%), 1fr)); gap: 14px;">
        <div style="background-color: #1E293B; border: 1px solid rgba(245, 158, 11, 0.42); border-radius: 14px; padding: 18px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">
            <span style="font-size: 12.5px; font-weight: 600; color: #CBD5E1;">Tổng doanh thu</span>
            <span id="kpi-rev-delta" style="padding: 3px 8px; border-radius: 999px; background-color: rgba(16, 185, 129, 0.18); border: 1px solid rgba(16, 185, 129, 0.45); color: #6EE7B7; font-family: 'JetBrains Mono', monospace; font-size: 11px; font-weight: 700;">+14.8%</span>
          </div>
          <span id="kpi-revenue" style="font-family: 'JetBrains Mono', monospace; font-size: 25px; font-weight: 800; color: #FBBF24;">48.650.000đ</span>
          <span style="font-size: 12px; color: #94A3B8;">Đã gồm VAT 8% &amp; thanh toán POS</span>
        </div>

        <div style="background-color: #1E293B; border: 1px solid #334155; border-radius: 14px; padding: 18px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">
            <span style="font-size: 12.5px; font-weight: 600; color: #CBD5E1;">Hóa đơn hoàn thành</span>
            <span id="kpi-bills-delta" style="padding: 3px 8px; border-radius: 999px; background-color: rgba(56, 189, 248, 0.16); border: 1px solid rgba(56, 189, 248, 0.4); color: #7DD3FC; font-family: 'JetBrains Mono', monospace; font-size: 11px; font-weight: 700;">+6 đơn</span>
          </div>
          <span id="kpi-bills" style="font-family: 'JetBrains Mono', monospace; font-size: 25px; font-weight: 800; color: #F8FAFC;">42 hóa đơn</span>
          <span style="font-size: 12px; color: #94A3B8;">Tỷ lệ hủy đơn dưới 1.2%</span>
        </div>

        <div style="background-color: #1E293B; border: 1px solid #334155; border-radius: 14px; padding: 18px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">
            <span style="font-size: 12.5px; font-weight: 600; color: #CBD5E1;">Tỷ lệ lấp đầy bàn</span>
            <span style="padding: 3px 8px; border-radius: 999px; background-color: rgba(16, 185, 129, 0.18); border: 1px solid rgba(16, 185, 129, 0.45); color: #6EE7B7; font-size: 11px; font-weight: 700;">Cao điểm tối</span>
          </div>
          <span id="kpi-occupancy" style="font-family: 'JetBrains Mono', monospace; font-size: 25px; font-weight: 800; color: #6EE7B7;">78%</span>
          <div style="height: 6px; width: 100%; border-radius: 999px; background-color: #0F172A; overflow: hidden;">
            <div id="kpi-occupancy-bar" style="width: 78%; height: 100%; background-color: #10B981; border-radius: 999px;"></div>
          </div>
        </div>

        <div style="background-color: #1E293B; border: 1px solid #334155; border-radius: 14px; padding: 18px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">
            <span style="font-size: 12.5px; font-weight: 600; color: #CBD5E1;">Giá trị TB / Bàn</span>
            <span style="padding: 3px 8px; border-radius: 999px; background-color: rgba(245, 158, 11, 0.18); border: 1px solid rgba(245, 158, 11, 0.4); color: #FDE68A; font-size: 11px; font-weight: 700;">Nhóm 4.2 khách</span>
          </div>
          <span id="kpi-avg-ticket" style="font-family: 'JetBrains Mono', monospace; font-size: 25px; font-weight: 800; color: #FDE68A;">1.158.000đ</span>
          <span style="font-size: 12px; color: #94A3B8;">Bình quân chi tiêu mỗi hóa đơn</span>
        </div>
      </div>

      <!-- 2-Column Visual Charts Row -->
      <div style="display: flex; flex-wrap: wrap; gap: 16px;">
        <!-- Left Chart: Revenue Trend Bar Chart -->
        <div style="flex: 1.5 1 500px; min-width: 0; background-color: #111827; border: 1px solid #334155; border-radius: 16px; padding: 20px; display: flex; flex-direction: column; gap: 16px;">
          <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px; flex-wrap: wrap;">
            <div>
              <h2 id="chart-title" style="margin: 0; font-size: 16.5px; font-weight: 800; color: #FAF7F2;">Biểu Đồ Tăng Trưởng Doanh Thu</h2>
              <span id="chart-subtitle" style="font-size: 12.5px; color: #94A3B8;"></span>
            </div>
            <span id="chart-unit-badge" style="padding: 4px 10px; border-radius: 8px; background-color: #1E293B; border: 1px solid #334155; font-size: 12px; font-weight: 700; color: #FBBF24;">Đơn vị: Triệu VNĐ</span>
          </div>

          <div id="reports-bar-plot" style="height: 220px; padding: 14px 10px 6px; border-radius: 12px; background-color: #0F172A; border: 1px solid rgba(51, 65, 85, 0.7); display: flex; align-items: flex-end; justify-content: space-between; gap: 12px;"></div>
        </div>

        <!-- Right Chart: 4 Signature Broths Mix -->
        <div style="flex: 1 1 320px; min-width: 0; background-color: #111827; border: 1px solid #334155; border-radius: 16px; padding: 20px; display: flex; flex-direction: column; gap: 16px;">
          <div>
            <h2 style="margin: 0; font-size: 16.5px; font-weight: 800; color: #FAF7F2;">Cơ Cấu 4 Vị Nước Lẩu Signature</h2>
            <span id="broths-subtitle" style="font-size: 12.5px; color: #94A3B8;"></span>
          </div>

          <div id="broths-segmented" style="height: 14px; width: 100%; border-radius: 999px; overflow: hidden; display: flex; gap: 2px; background-color: #0F172A;"></div>
          <div id="broths-list" style="display: flex; flex-direction: column; gap: 12px;"></div>
        </div>
      </div>

      <!-- Top 5 Best-Selling Dishes & Combos Table -->
      <div style="background-color: #111827; border: 1px solid #334155; border-radius: 16px; padding: 20px; display: flex; flex-direction: column; gap: 14px;">
        <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 10px;">
          <div>
            <h2 style="margin: 0; font-size: 16.5px; font-weight: 800; color: #FAF7F2;">Top 5 Món Nhúng &amp; Combo Bán Chạy Nhất</h2>
            <span style="font-size: 12.5px; color: #94A3B8;">Tổng hợp sản lượng xuất bếp &amp; doanh thu thực tế</span>
          </div>
          <button type="button" id="btn-jump-menu" style="min-height: 44px; padding: 0 15px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #FDE68A; font-size: 12.5px; font-weight: 700; cursor: pointer;">Mở Quản trị Thực đơn &rarr;</button>
        </div>

        <div class="admin-scroll" style="overflow-x: auto;">
          <div style="min-width: 720px; display: flex; flex-direction: column; gap: 6px;">
            <div style="display: grid; grid-template-columns: 70px 2fr 1.1fr 120px 150px 110px; gap: 12px; padding: 10px 14px; border-radius: 9px; background-color: #0F172A; font-size: 12px; font-weight: 700; color: #94A3B8; text-transform: uppercase;">
              <span>Hạng</span>
              <span>Món nhúng / Gói Combo</span>
              <span>Phân loại</span>
              <span>Lượt gọi</span>
              <span>Doanh thu</span>
              <span>Tỷ trọng</span>
            </div>
            <div id="top5-rows" style="display: flex; flex-direction: column; gap: 6px;"></div>
          </div>
        </div>
      </div>
    </section>

    <!-- TAB 2: QUẢN LÝ ĐẶT BÀN TRỰC TUYẾN -->
    <section id="tab-bookings" class="admin-tab-panel">
      <div style="background-color: #111827; border: 1px solid #334155; border-radius: 14px; padding: 14px; display: flex; flex-direction: column; gap: 12px;">
        <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 10px;">
          <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 10px; flex: 1 1 420px;">
            <input type="search" id="booking-search-input" aria-label="Tìm theo tên khách, số điện thoại hoặc mã đặt" placeholder="Tìm theo Tên khách, SĐT hoặc Mã đặt (#RES-...)..." style="min-height: 44px; flex: 1 1 240px; padding: 0 14px; border-radius: 10px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13.5px;">
            <div style="display: inline-flex; align-items: center; gap: 6px; padding: 0 10px; min-height: 44px; border-radius: 10px; border: 1px solid #334155; background-color: #0F172A;">
              <span style="font-size: 12px; font-weight: 700; color: #94A3B8; white-space: nowrap;">Ngày:</span>
              <input type="date" id="booking-date-input" value="2026-11-12" aria-label="Lọc đặt bàn theo ngày" style="min-height: 36px; border: none; background: transparent; color: #FBBF24; font-family: 'JetBrains Mono', monospace; font-size: 12.5px; font-weight: 700; cursor: pointer;">
              <button type="button" id="booking-today-btn" class="admin-pill-btn is-active" style="min-height: 32px; padding: 0 10px; font-size: 11.5px;">Hôm nay</button>
              <button type="button" id="booking-all-dates-btn" class="admin-pill-btn" style="min-height: 32px; padding: 0 10px; font-size: 11.5px;">Tất cả ngày</button>
            </div>
          </div>
          <button type="button" id="btn-open-new-booking" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #B91C1C; border: 1.5px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; white-space: nowrap;">+ Tạo đặt bàn mới</button>
        </div>

        <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 10px;">
          <div id="booking-filters" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
          <span style="font-size: 12.5px; color: #CBD5E1;">Đồng bộ trực tiếp từ Form <strong style="color: #FBBF24;">/dat-ban</strong> &amp; Hotline lễ tân</span>
        </div>
      </div>

      <div class="admin-scroll" style="background-color: #111827; border: 1px solid #334155; border-radius: 16px; padding: 16px; overflow-x: auto;">
        <div style="min-width: 980px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: grid; grid-template-columns: 95px 1.2fr 115px 125px 75px 1.4fr 115px 95px 220px; gap: 10px; padding: 10px 14px; border-radius: 9px; background-color: #0F172A; font-size: 11.5px; font-weight: 700; color: #94A3B8; text-transform: uppercase;">
            <span>Mã đặt</span>
            <span>Khách hàng</span>
            <span>SĐT</span>
            <span>Giờ đến</span>
            <span>Khách</span>
            <span>Combo dự kiến</span>
            <span>Trạng thái</span>
            <span>Bàn gán</span>
            <span>Thao tác</span>
          </div>
          <div id="bookings-rows" style="display: flex; flex-direction: column; gap: 8px;"></div>
        </div>
      </div>
    </section>

    <!-- TAB 3: QUẢN TRỊ THỰC ĐƠN -->
    <section id="tab-menu" class="admin-tab-panel">
      <div style="background-color: #111827; border: 1px solid #334155; border-radius: 14px; padding: 14px; display: flex; flex-direction: column; gap: 12px;">
        <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 12px;">
          <input type="search" id="menu-search-input" aria-label="Tìm kiếm mã món hoặc tên món ăn" placeholder="Tìm theo mã món (NL-, CB-, TB-...) hoặc tên món lẩu, thịt, hải sản..." style="min-height: 44px; flex: 1 1 280px; padding: 0 14px; border-radius: 10px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13.5px;">
          <button type="button" id="btn-open-new-menu" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #B91C1C; border: 1.5px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; white-space: nowrap;">+ Thêm món mới</button>
        </div>

        <div id="menu-cat-filters" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
      </div>

      <div class="admin-scroll" style="background-color: #111827; border: 1px solid #334155; border-radius: 16px; padding: 16px; overflow-x: auto;">
        <div style="min-width: 900px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: grid; grid-template-columns: 64px 95px 1.8fr 1.1fr 110px 125px 160px 150px; gap: 12px; padding: 10px 14px; border-radius: 9px; background-color: #0F172A; font-size: 11.5px; font-weight: 700; color: #94A3B8; text-transform: uppercase;">
            <span>Ảnh</span>
            <span>Mã món</span>
            <span>Tên món ăn / Combo</span>
            <span>Danh mục</span>
            <span>ĐVT</span>
            <span>Giá bán</span>
            <span>Trạng thái bán</span>
            <span>Thao tác</span>
          </div>
          <div id="menu-rows" style="display: flex; flex-direction: column; gap: 8px;"></div>
        </div>
      </div>
    </section>

    <!-- TAB 4: QUẢN TRỊ BÀN ĂN -->
    <section id="tab-tables" class="admin-tab-panel">
      <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 12px; background-color: #111827; border: 1px solid #334155; border-radius: 14px; padding: 12px 14px;">
        <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 10px;">
          <div id="table-zone-filters" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
          <span id="tables-status-summary" style="padding: 6px 12px; border-radius: 999px; background-color: #0F172A; border: 1px solid #334155; font-size: 12px; font-weight: 700; color: #CBD5E1;"></span>
        </div>
        <button type="button" id="btn-open-new-table" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #B91C1C; border: 1.5px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">+ Thêm bàn mới</button>
      </div>

      <div id="tables-grid" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(min(270px, 100%), 1fr)); gap: 14px;"></div>
    </section>

    <!-- TAB 5: QUẢN LÝ TÀI KHOẢN & PHÂN QUYỀN -->
    <section id="tab-accounts" class="admin-tab-panel">
      <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 12px; background-color: #111827; border: 1px solid #334155; border-radius: 14px; padding: 12px 14px;">
        <div id="account-role-filters" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
        <button type="button" id="btn-open-new-account" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #B91C1C; border: 1.5px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">+ Cấp tài khoản mới</button>
      </div>

      <div class="admin-scroll" style="background-color: #111827; border: 1px solid #334155; border-radius: 16px; padding: 16px; overflow-x: auto;">
        <div style="min-width: 900px; display: flex; flex-direction: column; gap: 8px;">
          <div style="display: grid; grid-template-columns: 90px 1.4fr 1.1fr 1.2fr 120px 115px 190px; gap: 12px; padding: 10px 14px; border-radius: 9px; background-color: #0F172A; font-size: 11.5px; font-weight: 700; color: #94A3B8; text-transform: uppercase;">
            <span>Mã NV</span>
            <span>Họ tên nhân sự</span>
            <span>Tài khoản</span>
            <span>Vai trò phân quyền</span>
            <span>Ca làm việc</span>
            <span>Trạng thái</span>
            <span>Thao tác</span>
          </div>
          <div id="accounts-rows" style="display: flex; flex-direction: column; gap: 8px;"></div>
        </div>
      </div>
    </section>

  </main>

  <!-- MODAL 1: DUYỆT & GÁN BÀN TRỐNG -->
  <div id="modal-assign" class="admin-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="modal-assign-title">
    <div style="width: 100%; max-width: 540px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.45); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 16px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <div>
          <span style="font-size: 11px; font-weight: 700; letter-spacing: 0.14em; color: #FBBF24;">DUYỆT ĐẶT BÀN &amp; GÁN VỊ TRÍ</span>
          <h2 id="modal-assign-title" style="margin: 4px 0 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Chọn Bàn Trống</h2>
        </div>
        <button type="button" data-close-modal="assign" aria-label="Đóng hộp thoại gán bàn" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer; display: inline-flex; align-items: center; justify-content: center;">&times;</button>
      </div>

      <span style="font-size: 13px; color: #CBD5E1;">Yêu cầu: <strong id="assign-target-info" style="color: #FDE68A;"></strong></span>

      <div id="assign-table-options" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(145px, 1fr)); gap: 10px;"></div>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 6px; border-top: 1px solid #334155;">
        <button type="button" data-close-modal="assign" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 13px; font-weight: 700; cursor: pointer;">Hủy bỏ</button>
        <button type="button" id="btn-confirm-assign" style="min-height: 44px; padding: 0 20px; border-radius: 10px; background-color: #047857; border: 1px solid #34D399; color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">Xác nhận Duyệt &amp; Gán bàn</button>
      </div>
    </div>
  </div>

  <!-- MODAL 2: THÊM / SỬA MÓN ĂN -->
  <div id="modal-menu" class="admin-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="modal-menu-title">
    <div style="width: 100%; max-width: 520px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.45); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 14px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <h2 id="modal-menu-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Thêm Món Ăn Mới</h2>
        <button type="button" data-close-modal="menu" aria-label="Đóng hộp thoại món ăn" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer;">&times;</button>
      </div>

      <div style="display: grid; grid-template-columns: 120px 1fr; gap: 10px;">
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Mã món</span>
          <input type="text" id="form-menu-code" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
        </label>
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Tên món ăn / Combo</span>
          <input type="text" id="form-menu-name" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
        </label>
      </div>

      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Đơn vị tính</span>
          <input type="text" id="form-menu-unit" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
        </label>
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Giá bán (VNĐ)</span>
          <input type="number" id="form-menu-price" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #FBBF24; font-family: 'JetBrains Mono', monospace; font-weight: 700; font-size: 13.5px;">
        </label>
      </div>

      <div style="display: flex; flex-direction: column; gap: 6px;">
        <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">Danh mục thực đơn</span>
        <div id="form-menu-cats" style="display: flex; flex-wrap: wrap; gap: 7px;"></div>
      </div>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 8px; border-top: 1px solid #334155;">
        <button type="button" data-close-modal="menu" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 13px; font-weight: 700; cursor: pointer;">Hủy</button>
        <button type="button" id="btn-save-menu" style="min-height: 44px; padding: 0 22px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">Lưu Thực Đơn</button>
      </div>
    </div>
  </div>

  <!-- MODAL 3: THÊM / SỬA BÀN ĂN -->
  <div id="modal-table" class="admin-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="modal-table-title">
    <div style="width: 100%; max-width: 480px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.45); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 14px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <h2 id="modal-table-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Thêm Bàn Ăn Mới</h2>
        <button type="button" data-close-modal="table" aria-label="Đóng hộp thoại bàn ăn" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer;">&times;</button>
      </div>

      <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
        <span>Tên bàn</span>
        <input type="text" id="form-table-name" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13.5px;">
      </label>

      <div style="display: flex; flex-direction: column; gap: 6px;">
        <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">Khu vực bố trí</span>
        <div id="form-table-zones" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 6px;">
        <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">Số ghế tiêu chuẩn</span>
        <div id="form-table-seats" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
      </div>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 8px; border-top: 1px solid #334155;">
        <button type="button" data-close-modal="table" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 13px; font-weight: 700; cursor: pointer;">Hủy</button>
        <button type="button" id="btn-save-table" style="min-height: 44px; padding: 0 22px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">Lưu Bàn Ăn</button>
      </div>
    </div>
  </div>

  <!-- MODAL 4: CẤP TÀI KHOẢN / PHÂN QUYỀN -->
  <div id="modal-account" class="admin-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="modal-account-title">
    <div style="width: 100%; max-width: 520px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.45); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 14px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <h2 id="modal-account-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Cấp Tài Khoản Nhân Sự Mới</h2>
        <button type="button" data-close-modal="account" aria-label="Đóng hộp thoại tài khoản" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer;">&times;</button>
      </div>

      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Họ tên nhân viên</span>
          <input type="text" id="form-acc-name" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
        </label>
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Tên đăng nhập</span>
          <input type="text" id="form-acc-user" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #FBBF24; font-family: 'JetBrains Mono', monospace; font-size: 13px;">
        </label>
      </div>

      <div style="display: flex; flex-direction: column; gap: 6px;">
        <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">Vai trò phân quyền</span>
        <div id="form-acc-roles" style="display: flex; flex-wrap: wrap; gap: 7px;"></div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 6px;">
        <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">Ca làm việc</span>
        <div id="form-acc-shifts" style="display: flex; flex-wrap: wrap; gap: 7px;"></div>
      </div>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 8px; border-top: 1px solid #334155;">
        <button type="button" data-close-modal="account" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 13px; font-weight: 700; cursor: pointer;">Hủy</button>
        <button type="button" id="btn-save-account" style="min-height: 44px; padding: 0 22px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">Lưu Tài Khoản</button>
      </div>
    </div>
  </div>

  <!-- MODAL 5: TẠO ĐẶT BÀN MỚI (HOTLINE / TRỰC TIẾP) -->
  <div id="modal-booking" class="admin-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="modal-booking-title">
    <div style="width: 100%; max-width: 540px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.45); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 14px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <div>
          <span style="font-size: 11px; font-weight: 700; letter-spacing: 0.14em; color: #FBBF24;">ĐẶT CHỖ HOTLINE / LỄ TÂN</span>
          <h2 id="modal-booking-title" style="margin: 4px 0 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2;">Tạo Lịch Đặt Bàn Mới</h2>
        </div>
        <button type="button" data-close-modal="booking" aria-label="Đóng hộp thoại tạo đặt bàn" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; cursor: pointer;">&times;</button>
      </div>

      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Họ tên khách hàng</span>
          <input type="text" id="form-bk-name" placeholder="Ví dụ: Nguyễn Quốc Bảo" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
        </label>
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Số điện thoại</span>
          <input type="text" id="form-bk-phone" placeholder="0901 234 567" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #FBBF24; font-family: 'JetBrains Mono', monospace; font-size: 13px;">
        </label>
      </div>

      <div style="display: grid; grid-template-columns: 1fr 1fr 100px; gap: 10px;">
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Ngày đến</span>
          <input type="date" id="form-bk-date" value="2026-11-12" style="min-height: 44px; padding: 0 10px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-family: 'JetBrains Mono', monospace; font-size: 12.5px;">
        </label>
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Giờ đến</span>
          <input type="time" id="form-bk-time" value="19:30" style="min-height: 44px; padding: 0 10px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-family: 'JetBrains Mono', monospace; font-size: 12.5px;">
        </label>
        <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
          <span>Số khách</span>
          <input type="number" id="form-bk-guests" min="1" max="30" value="4" style="min-height: 44px; padding: 0 10px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #FBBF24; font-family: 'JetBrains Mono', monospace; font-weight: 800; font-size: 13.5px;">
        </label>
      </div>

      <label style="display: flex; flex-direction: column; gap: 5px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
        <span>Gói Combo / Yêu cầu đặc biệt</span>
        <input type="text" id="form-bk-combo" value="Combo Buffet Hougo 269K" style="min-height: 44px; padding: 0 12px; border-radius: 9px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13px;">
      </label>

      <div style="display: flex; justify-content: flex-end; gap: 10px; padding-top: 8px; border-top: 1px solid #334155;">
        <button type="button" data-close-modal="booking" style="min-height: 44px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155; color: #E2E8F0; font-size: 13px; font-weight: 700; cursor: pointer;">Hủy</button>
        <button type="button" id="btn-save-booking" style="min-height: 44px; padding: 0 22px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(251, 191, 36, 0.65); color: #FFFFFF; font-size: 13.5px; font-weight: 800; cursor: pointer;">Lưu Đặt Bàn</button>
      </div>
    </div>
  </div>

</div>

<script>
(function () {
  var CONTEXT_PATH = '${pageContext.request.contextPath}';
  var IMG_BASE = CONTEXT_PATH + '/assets/images/hotpot/';
  var ALLOWED_TABS = ['reports', 'bookings', 'menu', 'tables', 'accounts'];

  function formatVnd(n) {
    return Math.round(n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.') + 'đ';
  }

  function escapeHtml(str) {
    return String(str == null ? '' : str)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;');
  }

  function resolveInitialTab() {
    var serverTab = '${activeTab}';
    var queryTab = '';
    try {
      queryTab = new URLSearchParams(window.location.search).get('tab') || '';
    } catch (e) {
      queryTab = '';
    }
    var candidate = (serverTab || queryTab || 'reports').toLowerCase().trim();
    return ALLOWED_TABS.indexOf(candidate) !== -1 ? candidate : 'reports';
  }

  var TAB_META = {
    reports: { tag: 'BÁO CÁO ĐIỀU HÀNH', title: 'Báo Cáo & Thống Kê Doanh Thu', desc: 'Theo dõi chỉ số kinh doanh, cơ cấu nước lẩu và sản lượng bán chạy theo kỳ.' },
    bookings: { tag: 'QUẢN LÝ ĐẶT CHỖ', title: 'Quản Lý Đặt Bàn & Xếp Bàn', desc: 'Phê duyệt yêu cầu đặt bàn từ Landing Page và gán bàn trống thực tế.' },
    menu: { tag: 'DANH MỤC THỰC ĐƠN', title: 'Danh Mục Món Ăn & Tình Trạng Bán', desc: 'Thêm, sửa đơn giá và đồng bộ trạng thái Tạm hết xuống POS & Bếp.' },
    tables: { tag: 'SƠ ĐỒ & PHÒNG BÀN', title: 'Quản Trị Bàn Ăn & Khu Vực', desc: 'Cấu hình tầng, phòng VIP, số ghế chuẩn và trạng thái hoạt động bàn.' },
    accounts: { tag: 'NHÂN SỰ & PHÂN QUYỀN', title: 'Quản Lý Tài Khoản & Phân Quyền', desc: 'Cấp tài khoản nhân viên, phân ca và kiểm soát quyền truy cập hệ thống.' }
  };

  var REPORTS_DATA = {
    today: {
      periodTitle: 'Hôm nay · 12/11/2026',
      chartSubtitle: 'Doanh thu theo khung giờ (10:00 – 22:00) · Lũy kế 48.65M khớp KPI',
      revenue: '48.650.000đ',
      revDelta: '+14.8%',
      bills: '42 hóa đơn',
      billsDelta: '+6 đơn',
      occupancy: '78%',
      occPctNum: 78,
      avgTicket: '1.158.000đ',
      bars: [
        { axis: '10h', val: 3.2, valLabel: '3.2M', peak: false },
        { axis: '12h', val: 8.5, valLabel: '8.5M', peak: false },
        { axis: '14h', val: 4.1, valLabel: '4.1M', peak: false },
        { axis: '16h', val: 2.8, valLabel: '2.8M', peak: false },
        { axis: '18h', val: 10.4, valLabel: '10.4M', peak: false },
        { axis: '20h', val: 13.8, valLabel: '13.8M', peak: true },
        { axis: '22h', val: 5.85, valLabel: '5.85M', peak: false }
      ],
      broths: [
        { name: 'Lẩu Tứ Xuyên Mala', pct: 38, pots: '24 nồi', color: '#EF4444' },
        { name: 'Lẩu Tomyum Hải Sản', pct: 27, pots: '17 nồi', color: '#F59E0B' },
        { name: 'Lẩu Nấm Dưỡng Sinh', pct: 20, pots: '13 nồi', color: '#10B981' },
        { name: 'Lẩu Cà Chua Collagen', pct: 15, pots: '9 nồi', color: '#38BDF8' }
      ],
      top5: [
        { rank: '#01', name: 'Set Combo Tuyết Hoa Tứ Hải (269K)', category: 'Combo Buffet', orders: '52 phần', rev: '13.988.000đ', share: '28.8%' },
        { rank: '#02', name: 'Bò Wagyu Nhật A5 (150g)', category: 'Thịt bò', orders: '34 khay', rev: '9.860.000đ', share: '20.3%' },
        { rank: '#03', name: 'Đĩa Hải Sản Tươi Tổng Hợp', category: 'Hải sản', orders: '28 đĩa', rev: '8.372.000đ', share: '17.2%' },
        { rank: '#04', name: 'Lõi Vai Bò Mỹ Thượng Hạng', category: 'Thịt bò', orders: '26 khay', rev: '4.810.000đ', share: '9.9%' },
        { rank: '#05', name: 'Nước Lẩu Tứ Xuyên Mala', category: 'Nước lẩu', orders: '24 nồi', rev: '3.576.000đ', share: '7.4%' }
      ]
    },
    week: {
      periodTitle: 'Tuần này · T2 – CN',
      chartSubtitle: 'Tổng hợp doanh thu 7 ngày · Lũy kế 342.80M khớp KPI',
      revenue: '342.800.000đ',
      revDelta: '+18.2%',
      bills: '294 hóa đơn',
      billsDelta: '+34 đơn',
      occupancy: '84%',
      occPctNum: 84,
      avgTicket: '1.166.000đ',
      bars: [
        { axis: 'T2', val: 34.5, valLabel: '34.5M', peak: false },
        { axis: 'T3', val: 38.2, valLabel: '38.2M', peak: false },
        { axis: 'T4', val: 41.0, valLabel: '41.0M', peak: false },
        { axis: 'T5', val: 45.6, valLabel: '45.6M', peak: false },
        { axis: 'T6', val: 56.4, valLabel: '56.4M', peak: false },
        { axis: 'T7', val: 68.9, valLabel: '68.9M', peak: true },
        { axis: 'CN', val: 58.2, valLabel: '58.2M', peak: false }
      ],
      broths: [
        { name: 'Lẩu Tứ Xuyên Mala', pct: 40, pots: '162 nồi', color: '#EF4444' },
        { name: 'Lẩu Tomyum Hải Sản', pct: 26, pots: '105 nồi', color: '#F59E0B' },
        { name: 'Lẩu Nấm Dưỡng Sinh', pct: 19, pots: '77 nồi', color: '#10B981' },
        { name: 'Lẩu Cà Chua Collagen', pct: 15, pots: '61 nồi', color: '#38BDF8' }
      ],
      top5: [
        { rank: '#01', name: 'Set Combo Tuyết Hoa Tứ Hải (269K)', category: 'Combo Buffet', orders: '364 phần', rev: '97.916.000đ', share: '28.6%' },
        { rank: '#02', name: 'Bò Wagyu Nhật A5 (150g)', category: 'Thịt bò', orders: '240 khay', rev: '69.600.000đ', share: '20.3%' },
        { rank: '#03', name: 'Đĩa Hải Sản Tươi Tổng Hợp', category: 'Hải sản', orders: '196 đĩa', rev: '58.604.000đ', share: '17.1%' },
        { rank: '#04', name: 'Lõi Vai Bò Mỹ Thượng Hạng', category: 'Thịt bò', orders: '180 khay', rev: '33.300.000đ', share: '9.7%' },
        { rank: '#05', name: 'Nước Lẩu Tứ Xuyên Mala', category: 'Nước lẩu', orders: '162 nồi', rev: '24.138.000đ', share: '7.0%' }
      ]
    },
    month: {
      periodTitle: 'Tháng 11/2026',
      chartSubtitle: 'Tiến độ doanh thu các giai đoạn · Lũy kế 1.486,20M khớp KPI',
      revenue: '1.486.200.000đ',
      revDelta: '+21.5%',
      bills: '1.268 hóa đơn',
      billsDelta: '+148 đơn',
      occupancy: '86%',
      occPctNum: 86,
      avgTicket: '1.172.000đ',
      bars: [
        { axis: '01-05/11', val: 238, valLabel: '238M', peak: false },
        { axis: '06-10/11', val: 264, valLabel: '264M', peak: false },
        { axis: '11-15/11', val: 289.2, valLabel: '289.2M', peak: true },
        { axis: '16-20/11', val: 251, valLabel: '251M', peak: false },
        { axis: '21-25/11', val: 232, valLabel: '232M', peak: false },
        { axis: '26-30/11', val: 212, valLabel: '212M', peak: false }
      ],
      broths: [
        { name: 'Lẩu Tứ Xuyên Mala', pct: 39, pots: '698 nồi', color: '#EF4444' },
        { name: 'Lẩu Tomyum Hải Sản', pct: 28, pots: '501 nồi', color: '#F59E0B' },
        { name: 'Lẩu Nấm Dưỡng Sinh', pct: 18, pots: '322 nồi', color: '#10B981' },
        { name: 'Lẩu Cà Chua Collagen', pct: 15, pots: '268 nồi', color: '#38BDF8' }
      ],
      top5: [
        { rank: '#01', name: 'Set Combo Tuyết Hoa Tứ Hải (269K)', category: 'Combo Buffet', orders: '1.580 phần', rev: '425.020.000đ', share: '28.6%' },
        { rank: '#02', name: 'Bò Wagyu Nhật A5 (150g)', category: 'Thịt bò', orders: '1.040 khay', rev: '301.600.000đ', share: '20.3%' },
        { rank: '#03', name: 'Đĩa Hải Sản Tươi Tổng Hợp', category: 'Hải sản', orders: '850 đĩa', rev: '254.150.000đ', share: '17.1%' },
        { rank: '#04', name: 'Lõi Vai Bò Mỹ Thượng Hạng', category: 'Thịt bò', orders: '780 khay', rev: '144.300.000đ', share: '9.7%' },
        { rank: '#05', name: 'Nước Lẩu Tứ Xuyên Mala', category: 'Nước lẩu', orders: '698 nồi', rev: '104.002.000đ', share: '7.0%' }
      ]
    },
    year: {
      periodTitle: 'Năm 2026',
      chartSubtitle: 'Doanh thu các quý trong năm 2026 · Tổng cộng 16.92B khớp KPI',
      revenue: '16.920.000.000đ',
      revDelta: '+28.4%',
      bills: '14.380 hóa đơn',
      billsDelta: '+2.4K đơn',
      occupancy: '82%',
      occPctNum: 82,
      avgTicket: '1.176.000đ',
      bars: [
        { axis: 'Q1/26', val: 3820, valLabel: '3.82B', peak: false },
        { axis: 'Q2/26', val: 4050, valLabel: '4.05B', peak: false },
        { axis: 'Q3/26', val: 4310, valLabel: '4.31B', peak: false },
        { axis: 'Q4/26*', val: 4740, valLabel: '4.74B', peak: true }
      ],
      broths: [
        { name: 'Lẩu Tứ Xuyên Mala', pct: 37, pots: '7.840 nồi', color: '#EF4444' },
        { name: 'Lẩu Tomyum Hải Sản', pct: 27, pots: '5.720 nồi', color: '#F59E0B' },
        { name: 'Lẩu Nấm Dưỡng Sinh', pct: 21, pots: '4.450 nồi', color: '#10B981' },
        { name: 'Lẩu Cà Chua Collagen', pct: 15, pots: '3.180 nồi', color: '#38BDF8' }
      ],
      top5: [
        { rank: '#01', name: 'Set Combo Tuyết Hoa Tứ Hải (269K)', category: 'Combo Buffet', orders: '18.200 phần', rev: '4.895.800.000đ', share: '28.9%' },
        { rank: '#02', name: 'Bò Wagyu Nhật A5 (150g)', category: 'Thịt bò', orders: '11.800 khay', rev: '3.422.000.000đ', share: '20.2%' },
        { rank: '#03', name: 'Đĩa Hải Sản Tươi Tổng Hợp', category: 'Hải sản', orders: '9.600 đĩa', rev: '2.870.400.000đ', share: '17.0%' },
        { rank: '#04', name: 'Lõi Vai Bò Mỹ Thượng Hạng', category: 'Thịt bò', orders: '8.800 khay', rev: '1.628.000.000đ', share: '9.6%' },
        { rank: '#05', name: 'Nước Lẩu Tứ Xuyên Mala', category: 'Nước lẩu', orders: '7.840 nồi', rev: '1.168.160.000đ', share: '6.9%' }
      ]
    }
  };

  var MENU_CATS = ['Tất cả', 'Nước lẩu', 'Combo', 'Thịt bò', 'Hải sản', 'Rau nấm', 'Đồ uống'];
  var ROLES = ['Quản trị viên', 'Thu ngân POS', 'Phục vụ', 'Điều phối Bếp'];
  var SHIFTS = ['Toàn thời gian', 'Ca Sáng', 'Ca Chiều', 'Ca Tối'];
  var TABLE_ZONES = ['Tầng 1 Sảnh chung', 'Tầng 2 Phòng VIP'];
  var TABLE_SEATS = [2, 4, 6, 8, 10];

  var STORAGE_86_KEY = 'hougo_86_dishes_v1';

  var state = {
    activeTab: resolveInitialTab(),
    period: 'today',
    bookingFilter: 'all',
    bookingSearch: '',
    bookingDate: '2026-11-12',
    menuFilter: 'Tất cả',
    menuSearch: '',
    tableZoneFilter: 'all',
    accountRoleFilter: 'all',

    bookings: [
      { id: 'b1', code: '#RES-1108', customer: 'Trần Minh Khôi', phone: '0908 312 459', date: '2026-11-12', arrival: '19:30 · Hôm nay', guests: 6, combo: 'Combo Buffet Hougo 269K', status: 'pending', assignedTable: 'Chưa gán' },
      { id: 'b2', code: '#RES-1109', customer: 'Nguyễn Thảo Vy', phone: '0912 774 881', date: '2026-11-12', arrival: '19:45 · Hôm nay', guests: 8, combo: 'Lẩu Uyên Ương + Wagyu A5', status: 'pending', assignedTable: 'Chưa gán' },
      { id: 'b3', code: '#RES-1110', customer: 'Lê Gia Bảo', phone: '0979 551 024', date: '2026-11-12', arrival: '20:00 · Hôm nay', guests: 4, combo: 'Combo Thượng Hạng 329K', status: 'pending', assignedTable: 'Chưa gán' },
      { id: 'b4', code: '#RES-1104', customer: 'Phạm Hoàng Anh', phone: '0933 882 910', date: '2026-11-12', arrival: '18:30 · Hôm nay', guests: 6, combo: 'Lẩu Tứ Xuyên + Bò Mỹ', status: 'confirmed', assignedTable: 'BÀN 04' },
      { id: 'b6', code: '#RES-1106', customer: 'Công ty Minh Phát', phone: '0909 456 789', date: '2026-11-12', arrival: '20:00 · Hôm nay', guests: 10, combo: 'Combo Thượng Hạng 329K · Cọc VIP', status: 'confirmed', assignedTable: 'BÀN 15' },
      { id: 'b5', code: '#RES-1099', customer: 'Đặng Quỳnh Chi', phone: '0984 119 362', date: '2026-11-12', arrival: '18:00 · Hôm nay', guests: 4, combo: 'Combo Buffet Hougo 269K', status: 'seated', assignedTable: 'BÀN 03' },
      { id: 'b7', code: '#RES-1115', customer: 'Hoàng Ngọc Diệp', phone: '0918 662 340', date: '2026-11-13', arrival: '19:00 · 13/11/2026', guests: 6, combo: 'Combo Thượng Hạng 329K', status: 'confirmed', assignedTable: 'BÀN 10' }
    ],

    menuItems: [
      { id: 'm1', code: 'NL-01', name: 'Nước Lẩu Tứ Xuyên Mala', category: 'Nước lẩu', unit: 'Nồi', price: 149000, available: true, img: IMG_BASE + 'dish-mala.jpg' },
      { id: 'm2', code: 'NL-02', name: 'Nước Lẩu Tomyum Hải Sản', category: 'Nước lẩu', unit: 'Nồi', price: 159000, available: true, img: IMG_BASE + 'dish-tomyum.jpg' },
      { id: 'm3', code: 'NL-03', name: 'Nước Lẩu Nấm Dưỡng Sinh', category: 'Nước lẩu', unit: 'Nồi', price: 139000, available: true, img: IMG_BASE + 'dish-mushroom.jpg' },
      { id: 'm4', code: 'NL-04', name: 'Nước Lẩu Cà Chua Collagen', category: 'Nước lẩu', unit: 'Nồi', price: 145000, available: true, img: IMG_BASE + 'dish-tomato.jpg' },
      { id: 'm5', code: 'CB-01', name: 'Combo Buffet Hougo 269K', category: 'Combo', unit: 'Set/Người', price: 269000, available: true, img: IMG_BASE + 'hero-hotpot.jpg' },
      { id: 'm10', code: 'CB-02', name: 'Combo Buffet Thượng Hạng 329K', category: 'Combo', unit: 'Set/Người', price: 329000, available: true, img: IMG_BASE + 'hero-hotpot.jpg' },
      { id: 'm6', code: 'TB-01', name: 'Bò Wagyu Nhật A5 (150g)', category: 'Thịt bò', unit: 'Khay 150g', price: 289000, available: true, img: IMG_BASE + 'dish-wagyu.jpg' },
      { id: 'm11', code: 'TB-02', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', category: 'Thịt bò', unit: 'Đĩa 150g', price: 129000, available: true, img: IMG_BASE + 'dish-wagyu.jpg' },
      { id: 'm7', code: 'HS-01', name: 'Đĩa Hải Sản Tươi Tổng Hợp', category: 'Hải sản', unit: 'Đĩa lớn', price: 259000, available: false, img: IMG_BASE + 'dish-seafood.jpg' },
      { id: 'm12', code: 'HS-02', name: 'Tôm Sú & Mực Hoa Tươi', category: 'Hải sản', unit: 'Đĩa 200g', price: 179000, available: true, img: IMG_BASE + 'dish-seafood.jpg' },
      { id: 'm8', code: 'RN-01', name: 'Tháp Rau Nấm & Váng Đậu', category: 'Rau nấm', unit: 'Tháp', price: 95000, available: true, img: IMG_BASE + 'dish-veggie.jpg' },
      { id: 'm9', code: 'DU-01', name: 'Trà Bí Đao Hạt Chia (Bình)', category: 'Đồ uống', unit: 'Bình 1L', price: 75000, available: true, img: IMG_BASE + 'dish-drink.jpg' }
    ],

    tables: [
      { id: 'tb1', name: 'BÀN 01', zone: 'Tầng 1 Sảnh chung', seats: 4, status: 'empty' },
      { id: 'tb2', name: 'BÀN 02', zone: 'Tầng 1 Sảnh chung', seats: 4, status: 'busy' },
      { id: 'tb3', name: 'BÀN 03', zone: 'Tầng 1 Sảnh chung', seats: 4, status: 'busy' },
      { id: 'tb4', name: 'BÀN 04', zone: 'Tầng 1 Sảnh chung', seats: 6, status: 'reserved' },
      { id: 'tb5', name: 'BÀN 05', zone: 'Tầng 1 Sảnh chung', seats: 2, status: 'empty' },
      { id: 'tb6', name: 'BÀN 06', zone: 'Tầng 1 Sảnh chung', seats: 6, status: 'busy' },
      { id: 'tb7', name: 'BÀN 07', zone: 'Tầng 1 Sảnh chung', seats: 4, status: 'empty' },
      { id: 'tb8', name: 'BÀN 08', zone: 'Tầng 1 Sảnh chung', seats: 6, status: 'empty' },
      { id: 'tb9', name: 'BÀN 09', zone: 'Tầng 2 Phòng VIP', seats: 8, status: 'busy' },
      { id: 'tb10', name: 'BÀN 10', zone: 'Tầng 2 Phòng VIP', seats: 6, status: 'empty' },
      { id: 'tb11', name: 'BÀN 11', zone: 'Tầng 2 Phòng VIP', seats: 8, status: 'busy' },
      { id: 'tb12', name: 'BÀN 12', zone: 'Tầng 2 Phòng VIP', seats: 10, status: 'empty' },
      { id: 'tb13', name: 'BÀN 13', zone: 'Tầng 2 Phòng VIP', seats: 6, status: 'busy' },
      { id: 'tb14', name: 'BÀN 14', zone: 'Tầng 2 Phòng VIP', seats: 4, status: 'empty' },
      { id: 'tb15', name: 'BÀN 15', zone: 'Tầng 2 Phòng VIP', seats: 10, status: 'reserved' },
      { id: 'tb16', name: 'BÀN 16', zone: 'Tầng 2 Phòng VIP', seats: 8, status: 'empty' }
    ],

    accounts: [
      { id: 'a1', code: 'NV-001', fullName: 'Nguyễn Hoàng Hải', username: 'admin.hai', role: 'Quản trị viên', shift: 'Toàn thời gian', active: true },
      { id: 'a2', code: 'NV-002', fullName: 'Phạm Thùy Linh', username: 'pos.linh', role: 'Thu ngân POS', shift: 'Ca Tối', active: true },
      { id: 'a3', code: 'NV-003', fullName: 'Nguyễn Văn Minh', username: 'srv.minh', role: 'Phục vụ', shift: 'Ca Tối', active: true },
      { id: 'a4', code: 'NV-004', fullName: 'Trần Thị Lan', username: 'srv.lan', role: 'Phục vụ', shift: 'Ca Chiều', active: true },
      { id: 'a5', code: 'NV-005', fullName: 'Lê Hoàng Nam', username: 'kds.nam', role: 'Điều phối Bếp', shift: 'Ca Tối', active: true },
      { id: 'a6', code: 'NV-006', fullName: 'Vũ Quốc Khánh', username: 'kds.khanh', role: 'Điều phối Bếp', shift: 'Ca Sáng', active: false }
    ],

    assignBookingId: null,
    pickedTableName: '',

    editMenuId: null,
    formMenuCat: 'Thịt bò',

    editTableId: null,
    formTableZone: 'Tầng 1 Sảnh chung',
    formTableSeats: 4,

    editAccountId: null,
    formAccRole: 'Phục vụ',
    formAccShift: 'Ca Tối'
  };

  function syncMenuFromShared86() {
    try {
      var raw = window.localStorage.getItem(STORAGE_86_KEY);
      if (!raw) return;
      var arr = JSON.parse(raw);
      if (!Array.isArray(arr)) return;
      state.menuItems = state.menuItems.map(function (m) {
        var isOut = arr.indexOf(m.name) !== -1;
        return Object.assign({}, m, { available: !isOut });
      });
    } catch (e) {}
  }

  function pushMenuToShared86() {
    try {
      var existing = [];
      var raw = window.localStorage.getItem(STORAGE_86_KEY);
      if (raw) {
        var parsed = JSON.parse(raw);
        if (Array.isArray(parsed)) existing = parsed;
      }
      var menuNames = state.menuItems.map(function (m) { return m.name; });
      var preservedOther = existing.filter(function (name) { return menuNames.indexOf(name) === -1; });
      var outFromMenu = state.menuItems.filter(function (m) { return !m.available; }).map(function (m) { return m.name; });
      window.localStorage.setItem(STORAGE_86_KEY, JSON.stringify(preservedOther.concat(outFromMenu)));
    } catch (e) {}
  }

  syncMenuFromShared86();

  function showBanner(msg) {
    var box = document.getElementById('admin-banner');
    var txt = document.getElementById('admin-banner-text');
    if (!msg) {
      box.style.display = 'none';
      txt.textContent = '';
      return;
    }
    txt.textContent = msg;
    box.style.display = 'flex';
  }

  function closeAllModals() {
    document.getElementById('modal-assign').classList.remove('is-open');
    document.getElementById('modal-menu').classList.remove('is-open');
    document.getElementById('modal-table').classList.remove('is-open');
    document.getElementById('modal-account').classList.remove('is-open');
    document.getElementById('modal-booking').classList.remove('is-open');
    state.assignBookingId = null;
  }

  function switchTab(tab) {
    if (ALLOWED_TABS.indexOf(tab) === -1) tab = 'reports';
    state.activeTab = tab;
    closeAllModals();
    showBanner('');
    renderShellHeaderAndNav();
    renderActiveTab();
  }

  function renderPendingBadge() {
    var count = state.bookings.filter(function (b) { return b.status === 'pending'; }).length;
    document.getElementById('nav-pending-badge').textContent = String(count);
  }

  function renderShellHeaderAndNav() {
    var meta = TAB_META[state.activeTab] || TAB_META.reports;
    document.getElementById('header-eyebrow').textContent = meta.tag;
    document.getElementById('header-title').textContent = meta.title;
    document.getElementById('header-desc').textContent = meta.desc;

    var navBtns = document.querySelectorAll('[data-nav-tab]');
    for (var i = 0; i < navBtns.length; i++) {
      var btn = navBtns[i];
      if (btn.getAttribute('data-nav-tab') === state.activeTab) {
        btn.classList.add('is-active');
      } else {
        btn.classList.remove('is-active');
      }
    }

    for (var j = 0; j < ALLOWED_TABS.length; j++) {
      var t = ALLOWED_TABS[j];
      var panel = document.getElementById('tab-' + t);
      if (t === state.activeTab) {
        panel.classList.add('is-active');
      } else {
        panel.classList.remove('is-active');
      }
    }
    renderPendingBadge();
  }

  function renderReportsTab() {
    var raw = REPORTS_DATA[state.period] || REPORTS_DATA.today;

    var periods = [
      { id: 'today', label: 'Hôm nay' },
      { id: 'week', label: 'Tuần này' },
      { id: 'month', label: 'Tháng 11/2026' },
      { id: 'year', label: 'Năm 2026' }
    ];
    document.getElementById('period-filters').innerHTML = periods.map(function (p) {
      var activeCls = state.period === p.id ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + activeCls + '" data-period="' + p.id + '">' + escapeHtml(p.label) + '</button>';
    }).join('');

    document.getElementById('kpi-revenue').textContent = raw.revenue;
    document.getElementById('kpi-rev-delta').textContent = raw.revDelta;
    document.getElementById('kpi-bills').textContent = raw.bills;
    document.getElementById('kpi-bills-delta').textContent = raw.billsDelta;
    document.getElementById('kpi-occupancy').textContent = raw.occupancy;
    document.getElementById('kpi-occupancy-bar').style.width = raw.occPctNum + '%';
    document.getElementById('kpi-avg-ticket').textContent = raw.avgTicket;

    document.getElementById('chart-title').textContent = 'Biểu Đồ Tăng Trưởng Doanh Thu (' + raw.periodTitle + ')';
    document.getElementById('chart-subtitle').textContent = raw.chartSubtitle;
    document.getElementById('chart-unit-badge').textContent = state.period === 'year' ? 'Đơn vị: Tỷ VNĐ' : 'Đơn vị: Triệu VNĐ';
    document.getElementById('broths-subtitle').textContent = 'Tỷ trọng gọi nồi theo ' + raw.periodTitle;

    var maxBar = Math.max.apply(null, raw.bars.map(function (b) { return b.val; }).concat([1]));
    document.getElementById('reports-bar-plot').innerHTML = raw.bars.map(function (b) {
      var hPx = Math.max(18, Math.round((b.val / maxBar) * 145));
      var bg = b.peak ? 'linear-gradient(180deg, #FBBF24 0%, #B91C1C 100%)' : 'linear-gradient(180deg, #EF4444 0%, #7F1D1D 100%)';
      var bdr = b.peak ? '#FDE68A' : 'rgba(248, 113, 113, 0.45)';
      return '<div style="flex: 1; min-width: 0; height: 100%; display: flex; flex-direction: column; align-items: center; justify-content: flex-end; gap: 7px;">' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 11.5px; font-weight: 700; color: #E2E8F0;">' + escapeHtml(b.valLabel) + '</span>' +
        '<div style="width: 100%; max-width: 46px; height: ' + hPx + 'px; border-radius: 8px 8px 3px 3px; background: ' + bg + '; border: 1px solid ' + bdr + ';"></div>' +
        '<span style="font-size: 11.5px; font-weight: 600; color: #94A3B8;">' + escapeHtml(b.axis) + '</span>' +
      '</div>';
    }).join('');

    document.getElementById('broths-segmented').innerHTML = raw.broths.map(function (br) {
      return '<div style="width: ' + br.pct + '%; background-color: ' + br.color + '; border-radius: 4px;"></div>';
    }).join('');

    document.getElementById('broths-list').innerHTML = raw.broths.map(function (br) {
      return '<div style="display: flex; flex-direction: column; gap: 5px;">' +
        '<div style="display: flex; align-items: center; justify-content: space-between; font-size: 13px;">' +
          '<span style="display: inline-flex; align-items: center; gap: 7px; font-weight: 700; color: #F8FAFC;">' +
            '<span style="width: 9px; height: 9px; border-radius: 999px; background-color: ' + br.color + '; display: inline-block;"></span>' +
            '<span>' + escapeHtml(br.name) + '</span>' +
          '</span>' +
          '<span style="font-family: \'JetBrains Mono\', monospace; font-weight: 800; color: #E2E8F0;">' + br.pct + '% &middot; ' + escapeHtml(br.pots) + '</span>' +
        '</div>' +
        '<div style="height: 7px; width: 100%; border-radius: 999px; background-color: #0F172A; overflow: hidden;">' +
          '<div style="width: ' + br.pct + '%; height: 100%; background-color: ' + br.color + '; border-radius: 999px;"></div>' +
        '</div>' +
      '</div>';
    }).join('');

    document.getElementById('top5-rows').innerHTML = raw.top5.map(function (t, idx) {
      var rankCol = idx === 0 ? '#FBBF24' : (idx === 1 ? '#E2E8F0' : '#94A3B8');
      return '<div style="display: grid; grid-template-columns: 70px 2fr 1.1fr 120px 150px 110px; gap: 12px; align-items: center; padding: 12px 14px; border-radius: 10px; background-color: #1E293B; border: 1px solid #334155;">' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 13px; font-weight: 800; color: ' + rankCol + ';">' + escapeHtml(t.rank) + '</span>' +
        '<span style="font-size: 13.5px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(t.name) + '</span>' +
        '<span style="font-size: 12.5px; color: #CBD5E1;">' + escapeHtml(t.category) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 13.5px; font-weight: 700; color: #6EE7B7;">' + escapeHtml(t.orders) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 13.5px; font-weight: 800; color: #FBBF24;">' + escapeHtml(t.rev) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12.5px; font-weight: 700; color: #E2E8F0;">' + escapeHtml(t.share) + '</span>' +
      '</div>';
    }).join('');
  }

  function renderBookingsTab() {
    renderPendingBadge();
    var dateInput = document.getElementById('booking-date-input');
    var todayBtn = document.getElementById('booking-today-btn');
    var allDateBtn = document.getElementById('booking-all-dates-btn');
    if (dateInput) dateInput.value = state.bookingDate === 'all' ? '' : state.bookingDate;
    if (todayBtn) todayBtn.classList.toggle('is-active', state.bookingDate === '2026-11-12');
    if (allDateBtn) allDateBtn.classList.toggle('is-active', state.bookingDate === 'all');

    var dateScoped = state.bookings.filter(function (b) {
      return state.bookingDate === 'all' || !state.bookingDate || b.date === state.bookingDate;
    });
    var pendingCount = dateScoped.filter(function (b) { return b.status === 'pending'; }).length;
    var filters = [
      { id: 'all', label: 'Tất cả (' + dateScoped.length + ')' },
      { id: 'pending', label: 'Chờ duyệt (' + pendingCount + ')' },
      { id: 'confirmed', label: 'Đã xác nhận' },
      { id: 'seated', label: 'Đã nhận bàn' },
      { id: 'cancelled', label: 'Đã hủy' }
    ];
    document.getElementById('booking-filters').innerHTML = filters.map(function (bf) {
      var cls = state.bookingFilter === bf.id ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-booking-filter="' + bf.id + '">' + escapeHtml(bf.label) + '</button>';
    }).join('');

    var stMap = {
      pending: { label: 'Chờ duyệt', bg: 'rgba(245, 158, 11, 0.2)', col: '#FDE68A', bdr: 'rgba(245, 158, 11, 0.55)' },
      confirmed: { label: 'Đã xác nhận', bg: 'rgba(56, 189, 248, 0.2)', col: '#BAE6FD', bdr: 'rgba(56, 189, 248, 0.5)' },
      seated: { label: 'Đã nhận bàn', bg: 'rgba(16, 185, 129, 0.2)', col: '#A7F3D0', bdr: 'rgba(16, 185, 129, 0.5)' },
      cancelled: { label: 'Đã hủy', bg: 'rgba(239, 68, 68, 0.2)', col: '#FECACA', bdr: 'rgba(239, 68, 68, 0.5)' }
    };

    var q = (state.bookingSearch || '').trim().toLowerCase();
    var qDigits = q.replace(/\s+/g, '');
    var rows = dateScoped.filter(function (b) {
      var stOk = state.bookingFilter === 'all' || b.status === state.bookingFilter;
      var qOk = !q ||
        b.customer.toLowerCase().indexOf(q) !== -1 ||
        b.code.toLowerCase().indexOf(q) !== -1 ||
        b.phone.toLowerCase().indexOf(q) !== -1 ||
        b.phone.replace(/\s+/g, '').indexOf(qDigits) !== -1;
      return stOk && qOk;
    });

    if (rows.length === 0) {
      document.getElementById('bookings-rows').innerHTML =
        '<div style="padding: 28px; text-align: center; color: #94A3B8; font-size: 13.5px; border-radius: 12px; background-color: #0F172A; border: 1px dashed #334155;">Không tìm thấy lịch đặt bàn nào khớp với từ khóa, ngày hoặc trạng thái đang lọc.</div>';
      return;
    }

    document.getElementById('bookings-rows').innerHTML = rows.map(function (b) {
      var st = stMap[b.status] || stMap.pending;
      var assignLabel = b.status === 'pending' ? 'Duyệt & Gán bàn' : 'Đổi bàn';
      return '<div style="display: grid; grid-template-columns: 95px 1.2fr 115px 125px 75px 1.4fr 115px 95px 220px; gap: 10px; align-items: center; padding: 12px 14px; border-radius: 11px; background-color: #1E293B; border: 1px solid #334155;">' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12.5px; font-weight: 800; color: #FBBF24;">' + escapeHtml(b.code) + '</span>' +
        '<span style="font-size: 13.5px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(b.customer) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12px; color: #CBD5E1;">' + escapeHtml(b.phone) + '</span>' +
        '<span style="font-size: 12.5px; font-weight: 600; color: #E2E8F0;">' + escapeHtml(b.arrival) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 13px; font-weight: 700; color: #F8FAFC;">' + b.guests + ' ng</span>' +
        '<span style="font-size: 12.5px; color: #CBD5E1;">' + escapeHtml(b.combo) + '</span>' +
        '<span style="padding: 4px 10px; border-radius: 999px; font-size: 11.5px; font-weight: 800; text-align: center; background-color: ' + st.bg + '; color: ' + st.col + '; border: 1px solid ' + st.bdr + ';">' + escapeHtml(st.label) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12.5px; font-weight: 800; color: #6EE7B7;">' + escapeHtml(b.assignedTable) + '</span>' +
        '<div style="display: flex; align-items: center; gap: 6px;">' +
          '<button type="button" data-booking-assign="' + b.id + '" style="min-height: 44px; padding: 0 12px; border-radius: 9px; font-size: 12px; font-weight: 700; cursor: pointer; white-space: nowrap; border: 1px solid #34D399; background-color: #065F46; color: #FFFFFF;">' + assignLabel + '</button>' +
          '<button type="button" data-booking-reject="' + b.id + '" style="min-height: 44px; padding: 0 11px; border-radius: 9px; background-color: #0F172A; border: 1px solid rgba(239, 68, 68, 0.55); color: #FECACA; font-size: 12px; font-weight: 700; cursor: pointer;">Hủy</button>' +
        '</div>' +
      '</div>';
    }).join('');
  }

  function renderAssignModalOptions() {
    var empties = state.tables.filter(function (t) { return t.status === 'empty'; });
    if (empties.length === 0) {
      document.getElementById('assign-table-options').innerHTML =
        '<div style="grid-column: 1 / -1; padding: 16px; border-radius: 10px; background-color: #0F172A; border: 1px dashed #475569; color: #CBD5E1; font-size: 13px;">Hiện tại tất cả bàn đều đang bận hoặc bảo trì.</div>';
      return;
    }
    document.getElementById('assign-table-options').innerHTML = empties.map(function (t) {
      var picked = state.pickedTableName === t.name;
      var style = 'min-height: 54px; padding: 8px 10px; border-radius: 10px; cursor: pointer; display: flex; flex-direction: column; align-items: flex-start; gap: 3px; border: 1.5px solid ' +
        (picked ? '#FBBF24' : '#334155') + '; background-color: ' + (picked ? '#991B1B' : '#0F172A') + '; color: ' + (picked ? '#FDE68A' : '#F8FAFC') + ';';
      return '<button type="button" data-pick-table="' + escapeHtml(t.name) + '" style="' + style + '">' +
        '<span style="font-size: 14px; font-weight: 800;">' + escapeHtml(t.name) + '</span>' +
        '<span style="font-size: 11.5px; color: #CBD5E1;">' + escapeHtml(t.zone) + ' &middot; ' + t.seats + ' ghế</span>' +
      '</button>';
    }).join('');
  }

  function renderMenuTab() {
    document.getElementById('menu-cat-filters').innerHTML = MENU_CATS.map(function (cat) {
      var cls = state.menuFilter === cat ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-menu-cat="' + escapeHtml(cat) + '">' + escapeHtml(cat) + '</button>';
    }).join('');

    var q = (state.menuSearch || '').trim().toLowerCase();
    var rows = state.menuItems.filter(function (m) {
      var catOk = state.menuFilter === 'Tất cả' || m.category === state.menuFilter;
      var searchOk = !q || m.name.toLowerCase().indexOf(q) !== -1 || m.code.toLowerCase().indexOf(q) !== -1;
      return catOk && searchOk;
    });

    if (rows.length === 0) {
      document.getElementById('menu-rows').innerHTML =
        '<div style="padding: 28px; text-align: center; color: #94A3B8; font-size: 13.5px; border-radius: 12px; background-color: #0F172A; border: 1px dashed #334155;">Không tìm thấy món ăn phù hợp với từ khóa/danh mục đã chọn.</div>';
      return;
    }

    document.getElementById('menu-rows').innerHTML = rows.map(function (m) {
      var wrapBdr = m.available ? 'rgba(16, 185, 129, 0.45)' : 'rgba(239, 68, 68, 0.45)';
      var trackJustify = m.available ? 'flex-end' : 'flex-start';
      var trackBg = m.available ? '#059669' : '#475569';
      var txtCol = m.available ? '#6EE7B7' : '#FECACA';
      var txtLabel = m.available ? 'Đang bán' : 'Tạm hết';

      return '<div style="display: grid; grid-template-columns: 64px 95px 1.8fr 1.1fr 110px 125px 160px 150px; gap: 12px; align-items: center; padding: 10px 14px; border-radius: 11px; background-color: #1E293B; border: 1px solid #334155;">' +
        '<img src="' + escapeHtml(m.img) + '" alt="' + escapeHtml(m.name) + '" style="width: 48px; height: 48px; border-radius: 10px; object-fit: cover; border: 1px solid rgba(251, 191, 36, 0.35);">' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12.5px; font-weight: 800; color: #CBD5E1;">' + escapeHtml(m.code) + '</span>' +
        '<span style="font-size: 13.5px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(m.name) + '</span>' +
        '<span style="font-size: 12.5px; color: #CBD5E1;">' + escapeHtml(m.category) + '</span>' +
        '<span style="font-size: 12.5px; color: #94A3B8;">' + escapeHtml(m.unit) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 13.5px; font-weight: 800; color: #FBBF24;">' + formatVnd(m.price) + '</span>' +
        '<button type="button" role="switch" aria-checked="' + (m.available ? 'true' : 'false') + '" data-menu-toggle="' + m.id + '" style="min-height: 44px; padding: 0 10px; border-radius: 10px; background-color: #0F172A; border: 1px solid ' + wrapBdr + '; cursor: pointer; display: inline-flex; align-items: center; gap: 9px;">' +
          '<span style="width: 38px; height: 22px; border-radius: 999px; padding: 3px; display: inline-flex; align-items: center; justify-content: ' + trackJustify + '; background-color: ' + trackBg + ';">' +
            '<span style="width: 16px; height: 16px; border-radius: 999px; background-color: #FFFFFF;"></span>' +
          '</span>' +
          '<span style="font-size: 12px; font-weight: 700; color: ' + txtCol + ';">' + txtLabel + '</span>' +
        '</button>' +
        '<div style="display: flex; align-items: center; gap: 6px;">' +
          '<button type="button" data-menu-edit="' + m.id + '" style="min-height: 44px; padding: 0 12px; border-radius: 8px; background-color: #0F172A; border: 1px solid #475569; color: #E2E8F0; font-size: 12.5px; font-weight: 700; cursor: pointer;">Sửa</button>' +
          '<button type="button" data-menu-delete="' + m.id + '" style="min-height: 44px; padding: 0 12px; border-radius: 8px; background-color: rgba(153, 27, 27, 0.45); border: 1px solid rgba(239, 68, 68, 0.55); color: #FECACA; font-size: 12.5px; font-weight: 700; cursor: pointer;">Xóa</button>' +
        '</div>' +
      '</div>';
    }).join('');
  }

  function renderMenuModalPills() {
    document.getElementById('form-menu-cats').innerHTML = MENU_CATS.slice(1).map(function (cat) {
      var cls = state.formMenuCat === cat ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-form-menu-cat="' + escapeHtml(cat) + '">' + escapeHtml(cat) + '</button>';
    }).join('');
  }

  function renderTablesTab() {
    var f1Count = state.tables.filter(function (t) { return t.zone === 'Tầng 1 Sảnh chung'; }).length;
    var f2Count = state.tables.filter(function (t) { return t.zone === 'Tầng 2 Phòng VIP'; }).length;
    var zones = [
      { id: 'all', label: 'Tất cả bàn (' + state.tables.length + ')' },
      { id: 'Tầng 1 Sảnh chung', label: 'Tầng 1 Sảnh chung (' + f1Count + ')' },
      { id: 'Tầng 2 Phòng VIP', label: 'Tầng 2 Phòng VIP (' + f2Count + ')' }
    ];
    document.getElementById('table-zone-filters').innerHTML = zones.map(function (tz) {
      var cls = state.tableZoneFilter === tz.id ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-table-zone="' + escapeHtml(tz.id) + '">' + escapeHtml(tz.label) + '</button>';
    }).join('');

    var rows = state.tables.filter(function (t) {
      return state.tableZoneFilter === 'all' || t.zone === state.tableZoneFilter;
    });

    var busyCount = rows.filter(function (t) { return t.status === 'busy'; }).length;
    var reservedCount = rows.filter(function (t) { return t.status === 'reserved'; }).length;
    var emptyCount = rows.filter(function (t) { return t.status === 'empty'; }).length;
    var maintCount = rows.filter(function (t) { return t.status === 'maintenance'; }).length;
    var sumEl = document.getElementById('tables-status-summary');
    if (sumEl) {
      sumEl.textContent = busyCount + ' Đang phục vụ · ' + reservedCount + ' Đã đặt trước · ' + emptyCount + ' Sẵn sàng' + (maintCount > 0 ? (' · ' + maintCount + ' Bảo trì') : '');
    }

    document.getElementById('tables-grid').innerHTML = rows.map(function (t) {
      var isMaint = t.status === 'maintenance';
      var isBusy = t.status === 'busy';
      var isReserved = t.status === 'reserved';
      var badgeCol = isMaint ? '#CBD5E1' : (isBusy ? '#FCA5A5' : (isReserved ? '#FDE68A' : '#6EE7B7'));
      var badgeBg = isMaint ? 'rgba(100, 116, 139, 0.28)' : (isBusy ? 'rgba(239, 68, 68, 0.22)' : (isReserved ? 'rgba(245, 158, 11, 0.22)' : 'rgba(16, 185, 129, 0.2)'));
      var statusLabel = isMaint ? 'Bảo trì' : (isBusy ? 'Đang phục vụ' : (isReserved ? 'Đã đặt trước' : 'Sẵn sàng'));
      var cardBdr = isMaint ? '#64748B' : (isBusy ? 'rgba(239, 68, 68, 0.55)' : (isReserved ? 'rgba(245, 158, 11, 0.55)' : '#334155'));
      var toggleLabel = isMaint ? 'Mở hoạt động' : 'Tạm bảo trì';
      var toggleBdr = isMaint ? '#10B981' : 'rgba(245, 158, 11, 0.5)';
      var toggleBg = isMaint ? '#065F46' : '#0F172A';
      var toggleCol = isMaint ? '#FFFFFF' : '#FDE68A';

      return '<div style="background-color: #1E293B; border: 1px solid ' + cardBdr + '; border-radius: 14px; padding: 16px; display: flex; flex-direction: column; gap: 12px;">' +
        '<div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">' +
          '<span style="font-size: 18px; font-weight: 800; color: #F8FAFC;">' + escapeHtml(t.name) + '</span>' +
          '<span style="padding: 3px 9px; border-radius: 999px; font-size: 11px; font-weight: 800; background-color: ' + badgeBg + '; color: ' + badgeCol + ';">' + statusLabel + '</span>' +
        '</div>' +
        '<div style="display: flex; flex-direction: column; gap: 5px; font-size: 13px; color: #CBD5E1;">' +
          '<span>Khu vực: <strong style="color: #F8FAFC;">' + escapeHtml(t.zone) + '</strong></span>' +
          '<span>Sức chứa: <strong style="font-family: \'JetBrains Mono\', monospace; color: #FBBF24;">' + t.seats + ' ghế</strong></span>' +
        '</div>' +
        '<div style="display: flex; align-items: center; gap: 8px; padding-top: 6px; border-top: 1px solid rgba(148, 163, 184, 0.16);">' +
          '<button type="button" data-table-edit="' + t.id + '" style="flex: 1; min-height: 44px; padding: 0 12px; border-radius: 9px; background-color: #0F172A; border: 1px solid #475569; color: #E2E8F0; font-size: 12.5px; font-weight: 700; cursor: pointer;">Chỉnh sửa</button>' +
          '<button type="button" data-table-toggle="' + t.id + '" style="min-height: 44px; padding: 0 12px; border-radius: 9px; font-size: 12px; font-weight: 700; cursor: pointer; border: 1px solid ' + toggleBdr + '; background-color: ' + toggleBg + '; color: ' + toggleCol + ';">' + toggleLabel + '</button>' +
        '</div>' +
      '</div>';
    }).join('');
  }

  function renderTableModalPills() {
    document.getElementById('form-table-zones').innerHTML = TABLE_ZONES.map(function (z) {
      var cls = state.formTableZone === z ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-form-table-zone="' + escapeHtml(z) + '">' + escapeHtml(z) + '</button>';
    }).join('');

    document.getElementById('form-table-seats').innerHTML = TABLE_SEATS.map(function (s) {
      var cls = state.formTableSeats === s ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-form-table-seat="' + s + '">' + s + ' ghế</button>';
    }).join('');
  }

  function renderAccountsTab() {
    var roleFilters = ['all'].concat(ROLES);
    document.getElementById('account-role-filters').innerHTML = roleFilters.map(function (r) {
      var label = r === 'all' ? 'Tất cả vai trò (' + state.accounts.length + ')' : r;
      var cls = state.accountRoleFilter === r ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-account-role="' + escapeHtml(r) + '">' + escapeHtml(label) + '</button>';
    }).join('');

    var roleColMap = {
      'Quản trị viên': { bg: 'rgba(185, 28, 28, 0.35)', col: '#FDE68A', bdr: 'rgba(251, 191, 36, 0.5)' },
      'Thu ngân POS': { bg: 'rgba(16, 185, 129, 0.2)', col: '#A7F3D0', bdr: 'rgba(16, 185, 129, 0.45)' },
      'Phục vụ': { bg: 'rgba(56, 189, 248, 0.18)', col: '#BAE6FD', bdr: 'rgba(56, 189, 248, 0.45)' },
      'Điều phối Bếp': { bg: 'rgba(245, 158, 11, 0.2)', col: '#FDE68A', bdr: 'rgba(245, 158, 11, 0.45)' }
    };

    var rows = state.accounts.filter(function (a) {
      return state.accountRoleFilter === 'all' || a.role === state.accountRoleFilter;
    });

    document.getElementById('accounts-rows').innerHTML = rows.map(function (a) {
      var rc = roleColMap[a.role] || roleColMap['Phục vụ'];
      var stLabel = a.active ? 'Hoạt động' : 'Đang khóa';
      var stBg = a.active ? 'rgba(16, 185, 129, 0.2)' : 'rgba(239, 68, 68, 0.2)';
      var stCol = a.active ? '#6EE7B7' : '#FECACA';
      var lockLabel = a.active ? 'Khóa TK' : 'Mở khóa';
      var lockBdr = a.active ? 'rgba(239, 68, 68, 0.5)' : '#10B981';
      var lockBg = a.active ? 'rgba(153, 27, 27, 0.4)' : '#065F46';
      var lockCol = a.active ? '#FECACA' : '#FFFFFF';

      return '<div style="display: grid; grid-template-columns: 90px 1.4fr 1.1fr 1.2fr 120px 115px 190px; gap: 12px; align-items: center; padding: 12px 14px; border-radius: 11px; background-color: #1E293B; border: 1px solid #334155;">' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12.5px; font-weight: 800; color: #FBBF24;">' + escapeHtml(a.code) + '</span>' +
        '<span style="font-size: 13.5px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(a.fullName) + '</span>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 12.5px; color: #CBD5E1;">' + escapeHtml(a.username) + '</span>' +
        '<span style="padding: 4px 10px; border-radius: 999px; font-size: 11.5px; font-weight: 700; text-align: center; background-color: ' + rc.bg + '; color: ' + rc.col + '; border: 1px solid ' + rc.bdr + ';">' + escapeHtml(a.role) + '</span>' +
        '<span style="font-size: 12.5px; color: #CBD5E1;">' + escapeHtml(a.shift) + '</span>' +
        '<span style="padding: 4px 10px; border-radius: 999px; font-size: 11.5px; font-weight: 700; text-align: center; background-color: ' + stBg + '; color: ' + stCol + ';">' + stLabel + '</span>' +
        '<div style="display: flex; align-items: center; gap: 6px;">' +
          '<button type="button" data-acc-edit="' + a.id + '" style="min-height: 44px; padding: 0 12px; border-radius: 8px; background-color: #0F172A; border: 1px solid #475569; color: #E2E8F0; font-size: 12px; font-weight: 700; cursor: pointer;">Phân quyền</button>' +
          '<button type="button" data-acc-toggle="' + a.id + '" style="min-height: 44px; padding: 0 11px; border-radius: 8px; font-size: 12px; font-weight: 700; cursor: pointer; border: 1px solid ' + lockBdr + '; background-color: ' + lockBg + '; color: ' + lockCol + ';">' + lockLabel + '</button>' +
        '</div>' +
      '</div>';
    }).join('');
  }

  function renderAccountModalPills() {
    document.getElementById('form-acc-roles').innerHTML = ROLES.map(function (r) {
      var cls = state.formAccRole === r ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-form-acc-role="' + escapeHtml(r) + '">' + escapeHtml(r) + '</button>';
    }).join('');

    document.getElementById('form-acc-shifts').innerHTML = SHIFTS.map(function (sh) {
      var cls = state.formAccShift === sh ? 'admin-pill-btn is-active' : 'admin-pill-btn';
      return '<button type="button" class="' + cls + '" data-form-acc-shift="' + escapeHtml(sh) + '">' + escapeHtml(sh) + '</button>';
    }).join('');
  }

  function renderActiveTab() {
    if (state.activeTab === 'reports') renderReportsTab();
    else if (state.activeTab === 'bookings') renderBookingsTab();
    else if (state.activeTab === 'menu') renderMenuTab();
    else if (state.activeTab === 'tables') renderTablesTab();
    else if (state.activeTab === 'accounts') renderAccountsTab();
  }

  // Sidebar Tab Switches & Banner Close
  document.addEventListener('click', function (e) {
    var navBtn = e.target.closest('[data-nav-tab]');
    if (navBtn) {
      switchTab(navBtn.getAttribute('data-nav-tab'));
      return;
    }

    var closeModalBtn = e.target.closest('[data-close-modal]');
    if (closeModalBtn) {
      closeAllModals();
      return;
    }

    if (e.target.classList && e.target.classList.contains('admin-modal-backdrop')) {
      closeAllModals();
      return;
    }

    var periodBtn = e.target.closest('[data-period]');
    if (periodBtn) {
      state.period = periodBtn.getAttribute('data-period');
      renderReportsTab();
      return;
    }

    var bfBtn = e.target.closest('[data-booking-filter]');
    if (bfBtn) {
      state.bookingFilter = bfBtn.getAttribute('data-booking-filter');
      renderBookingsTab();
      return;
    }

    var assignBtn = e.target.closest('[data-booking-assign]');
    if (assignBtn) {
      var bkId = assignBtn.getAttribute('data-booking-assign');
      var bk = state.bookings.find(function (x) { return x.id === bkId; });
      if (!bk) return;
      var firstEmpty = state.tables.find(function (t) { return t.status === 'empty'; });
      state.assignBookingId = bk.id;
      state.pickedTableName = firstEmpty ? firstEmpty.name : '';
      document.getElementById('modal-assign-title').textContent = 'Chọn Bàn Trống Cho ' + bk.customer;
      document.getElementById('assign-target-info').textContent = bk.code + ' · ' + bk.guests + ' khách · ' + bk.arrival;
      renderAssignModalOptions();
      document.getElementById('modal-assign').classList.add('is-open');
      return;
    }

    var rejectBtn = e.target.closest('[data-booking-reject]');
    if (rejectBtn) {
      var rId = rejectBtn.getAttribute('data-booking-reject');
      var rBk = state.bookings.find(function (x) { return x.id === rId; });
      if (!rBk) return;
      var oldTabName = rBk.assignedTable;
      state.bookings = state.bookings.map(function (x) {
        return x.id === rId ? Object.assign({}, x, { status: 'cancelled', assignedTable: 'Đã hủy' }) : x;
      });
      if (oldTabName) {
        state.tables = state.tables.map(function (t) {
          return t.name === oldTabName ? Object.assign({}, t, { status: 'empty' }) : t;
        });
      }
      showBanner('Đã từ chối / hủy lịch đặt ' + rBk.code + ' của khách ' + rBk.customer + '.');
      renderBookingsTab();
      renderTablesTab();
      return;
    }

    var pickTableBtn = e.target.closest('[data-pick-table]');
    if (pickTableBtn) {
      state.pickedTableName = pickTableBtn.getAttribute('data-pick-table');
      renderAssignModalOptions();
      return;
    }

    var menuCatBtn = e.target.closest('[data-menu-cat]');
    if (menuCatBtn) {
      state.menuFilter = menuCatBtn.getAttribute('data-menu-cat');
      renderMenuTab();
      return;
    }

    var menuToggleBtn = e.target.closest('[data-menu-toggle]');
    if (menuToggleBtn) {
      var mtId = menuToggleBtn.getAttribute('data-menu-toggle');
      var targetDish = state.menuItems.find(function (x) { return x.id === mtId; });
      if (!targetDish) return;
      state.menuItems = state.menuItems.map(function (x) {
        return x.id === mtId ? Object.assign({}, x, { available: !x.available }) : x;
      });
      pushMenuToShared86();
      showBanner((targetDish.available ? 'Đã chuyển sang Tạm hết (đồng bộ 86-List POS & Bếp): ' : 'Đã mở bán lại: ') + targetDish.name + '.');
      renderMenuTab();
      return;
    }

    var menuEditBtn = e.target.closest('[data-menu-edit]');
    if (menuEditBtn) {
      var meId = menuEditBtn.getAttribute('data-menu-edit');
      var mi = state.menuItems.find(function (x) { return x.id === meId; });
      if (!mi) return;
      state.editMenuId = mi.id;
      state.formMenuCat = mi.category;
      document.getElementById('modal-menu-title').textContent = 'Chỉnh Sửa Món Ăn';
      document.getElementById('form-menu-code').value = mi.code;
      document.getElementById('form-menu-name').value = mi.name;
      document.getElementById('form-menu-unit').value = mi.unit;
      document.getElementById('form-menu-price').value = String(mi.price);
      renderMenuModalPills();
      document.getElementById('modal-menu').classList.add('is-open');
      return;
    }

    var menuDelBtn = e.target.closest('[data-menu-delete]');
    if (menuDelBtn) {
      var mdId = menuDelBtn.getAttribute('data-menu-delete');
      var mdItem = state.menuItems.find(function (x) { return x.id === mdId; });
      if (!mdItem) return;
      state.menuItems = state.menuItems.filter(function (x) { return x.id !== mdId; });
      showBanner('Đã xóa món "' + mdItem.name + '" khỏi danh mục thực đơn.');
      renderMenuTab();
      return;
    }

    var formMenuCatBtn = e.target.closest('[data-form-menu-cat]');
    if (formMenuCatBtn) {
      state.formMenuCat = formMenuCatBtn.getAttribute('data-form-menu-cat');
      renderMenuModalPills();
      return;
    }

    var zoneFilterBtn = e.target.closest('[data-table-zone]');
    if (zoneFilterBtn) {
      state.tableZoneFilter = zoneFilterBtn.getAttribute('data-table-zone');
      renderTablesTab();
      return;
    }

    var tableEditBtn = e.target.closest('[data-table-edit]');
    if (tableEditBtn) {
      var teId = tableEditBtn.getAttribute('data-table-edit');
      var tb = state.tables.find(function (x) { return x.id === teId; });
      if (!tb) return;
      state.editTableId = tb.id;
      state.formTableZone = tb.zone;
      state.formTableSeats = tb.seats;
      document.getElementById('modal-table-title').textContent = 'Chỉnh Sửa Bàn Ăn';
      document.getElementById('form-table-name').value = tb.name;
      renderTableModalPills();
      document.getElementById('modal-table').classList.add('is-open');
      return;
    }

    var tableToggleBtn = e.target.closest('[data-table-toggle]');
    if (tableToggleBtn) {
      var ttId = tableToggleBtn.getAttribute('data-table-toggle');
      var tObj = state.tables.find(function (x) { return x.id === ttId; });
      if (!tObj) return;
      state.tables = state.tables.map(function (x) {
        return x.id === ttId ? Object.assign({}, x, { status: x.status === 'maintenance' ? 'empty' : 'maintenance' }) : x;
      });
      showBanner('Đã cập nhật trạng thái hoạt động của ' + tObj.name + '.');
      renderTablesTab();
      return;
    }

    var formZoneBtn = e.target.closest('[data-form-table-zone]');
    if (formZoneBtn) {
      state.formTableZone = formZoneBtn.getAttribute('data-form-table-zone');
      renderTableModalPills();
      return;
    }

    var formSeatBtn = e.target.closest('[data-form-table-seat]');
    if (formSeatBtn) {
      state.formTableSeats = Number(formSeatBtn.getAttribute('data-form-table-seat')) || 4;
      renderTableModalPills();
      return;
    }

    var accRoleFilterBtn = e.target.closest('[data-account-role]');
    if (accRoleFilterBtn) {
      state.accountRoleFilter = accRoleFilterBtn.getAttribute('data-account-role');
      renderAccountsTab();
      return;
    }

    var accEditBtn = e.target.closest('[data-acc-edit]');
    if (accEditBtn) {
      var aeId = accEditBtn.getAttribute('data-acc-edit');
      var acc = state.accounts.find(function (x) { return x.id === aeId; });
      if (!acc) return;
      state.editAccountId = acc.id;
      state.formAccRole = acc.role;
      state.formAccShift = acc.shift;
      document.getElementById('modal-account-title').textContent = 'Cập Nhật Phân Quyền Nhân Sự';
      document.getElementById('form-acc-name').value = acc.fullName;
      document.getElementById('form-acc-user').value = acc.username;
      renderAccountModalPills();
      document.getElementById('modal-account').classList.add('is-open');
      return;
    }

    var accToggleBtn = e.target.closest('[data-acc-toggle]');
    if (accToggleBtn) {
      var atId = accToggleBtn.getAttribute('data-acc-toggle');
      var targetAcc = state.accounts.find(function (x) { return x.id === atId; });
      if (!targetAcc) return;
      state.accounts = state.accounts.map(function (x) {
        return x.id === atId ? Object.assign({}, x, { active: !x.active }) : x;
      });
      showBanner((targetAcc.active ? 'Đã khóa tài khoản ' : 'Đã kích hoạt lại tài khoản ') + targetAcc.username + '.');
      renderAccountsTab();
      return;
    }

    var formAccRoleBtn = e.target.closest('[data-form-acc-role]');
    if (formAccRoleBtn) {
      state.formAccRole = formAccRoleBtn.getAttribute('data-form-acc-role');
      renderAccountModalPills();
      return;
    }

    var formAccShiftBtn = e.target.closest('[data-form-acc-shift]');
    if (formAccShiftBtn) {
      state.formAccShift = formAccShiftBtn.getAttribute('data-form-acc-shift');
      renderAccountModalPills();
    }
  });

  document.getElementById('admin-banner-close').addEventListener('click', function () {
    showBanner('');
  });

  document.getElementById('btn-export-excel').addEventListener('click', function () {
    var raw = REPORTS_DATA[state.period] || REPORTS_DATA.today;
    showBanner('Đã xuất file Excel "Bao_Cao_Hougo_' + raw.periodTitle + '.xlsx" gồm KPI, doanh thu giờ & Top 5 món.');
  });

  document.getElementById('btn-print-shift').addEventListener('click', function () {
    var raw = REPORTS_DATA[state.period] || REPORTS_DATA.today;
    showBanner('Đang gửi lệnh In báo cáo ca (' + raw.periodTitle + ' · ' + raw.revenue + ') tới máy in quản lý.');
  });

  document.getElementById('btn-jump-menu').addEventListener('click', function () {
    switchTab('menu');
  });

  document.getElementById('menu-search-input').addEventListener('input', function (e) {
    state.menuSearch = e.target.value;
    renderMenuTab();
  });

  document.getElementById('booking-search-input').addEventListener('input', function (e) {
    state.bookingSearch = e.target.value;
    renderBookingsTab();
  });

  document.getElementById('booking-date-input').addEventListener('change', function (e) {
    state.bookingDate = e.target.value || 'all';
    renderBookingsTab();
  });

  document.getElementById('booking-today-btn').addEventListener('click', function () {
    state.bookingDate = '2026-11-12';
    renderBookingsTab();
  });

  document.getElementById('booking-all-dates-btn').addEventListener('click', function () {
    state.bookingDate = 'all';
    renderBookingsTab();
  });

  document.getElementById('btn-open-new-booking').addEventListener('click', function () {
    document.getElementById('form-bk-name').value = '';
    document.getElementById('form-bk-phone').value = '';
    document.getElementById('form-bk-date').value = (state.bookingDate && state.bookingDate !== 'all') ? state.bookingDate : '2026-11-12';
    document.getElementById('form-bk-time').value = '19:30';
    document.getElementById('form-bk-guests').value = '4';
    document.getElementById('form-bk-combo').value = 'Combo Buffet Hougo 269K';
    document.getElementById('modal-booking').classList.add('is-open');
  });

  document.getElementById('btn-save-booking').addEventListener('click', function () {
    var name = (document.getElementById('form-bk-name').value || '').trim() || 'Khách Hotline';
    var phone = (document.getElementById('form-bk-phone').value || '').trim() || '0900 000 000';
    var date = document.getElementById('form-bk-date').value || '2026-11-12';
    var time = document.getElementById('form-bk-time').value || '19:30';
    var guests = Math.max(1, parseInt(document.getElementById('form-bk-guests').value, 10) || 4);
    var combo = (document.getElementById('form-bk-combo').value || '').trim() || 'Combo Buffet Hougo 269K';
    var dayLabel = date === '2026-11-12' ? 'Hôm nay' : date.split('-').reverse().join('/');
    var seq = 1110 + state.bookings.length + 1;

    state.bookings.unshift({
      id: 'b-' + Date.now(),
      code: '#RES-' + seq,
      customer: name,
      phone: phone,
      date: date,
      arrival: time + ' · ' + dayLabel,
      guests: guests,
      combo: combo,
      status: 'pending',
      assignedTable: 'Chưa gán'
    });
    state.bookingDate = date;
    state.bookingFilter = 'all';
    closeAllModals();
    showBanner('Đã tạo lịch đặt bàn hotline #RES-' + seq + ' cho khách ' + name + ' (' + guests + ' khách).');
    renderBookingsTab();
  });

  document.getElementById('btn-confirm-assign').addEventListener('click', function () {
    if (!state.assignBookingId) return;
    if (!state.pickedTableName) {
      closeAllModals();
      showBanner('Hiện không còn bàn trống khả dụng để gán.');
      return;
    }
    var cur = state.bookings.find(function (b) { return b.id === state.assignBookingId; });
    var oldTable = cur ? cur.assignedTable : '';
    var picked = state.pickedTableName;
    state.bookings = state.bookings.map(function (b) {
      return b.id === state.assignBookingId ? Object.assign({}, b, { status: 'confirmed', assignedTable: picked }) : b;
    });
    state.tables = state.tables.map(function (t) {
      if (t.name === picked) return Object.assign({}, t, { status: 'reserved' });
      if (oldTable && t.name === oldTable && t.name !== picked && t.status === 'reserved') return Object.assign({}, t, { status: 'empty' });
      return t;
    });
    closeAllModals();
    showBanner('Đã duyệt đặt bàn và gán ' + picked + ' (Đã đặt trước) cho khách ' + (cur ? cur.customer : '') + '.');
    renderBookingsTab();
    renderTablesTab();
  });

  document.getElementById('btn-open-new-menu').addEventListener('click', function () {
    state.editMenuId = null;
    state.formMenuCat = 'Thịt bò';
    document.getElementById('modal-menu-title').textContent = 'Thêm Món Ăn Mới';
    document.getElementById('form-menu-code').value = 'MN-' + (state.menuItems.length + 10);
    document.getElementById('form-menu-name').value = '';
    document.getElementById('form-menu-unit').value = 'Đĩa 150g';
    document.getElementById('form-menu-price').value = '195000';
    renderMenuModalPills();
    document.getElementById('modal-menu').classList.add('is-open');
  });

  document.getElementById('btn-save-menu').addEventListener('click', function () {
    var code = (document.getElementById('form-menu-code').value || '').trim() || 'MN-NEW';
    var name = (document.getElementById('form-menu-name').value || '').trim() || 'Món Lẩu Mới Hougo';
    var unit = (document.getElementById('form-menu-unit').value || '').trim() || 'Phần';
    var price = Math.max(0, Number(document.getElementById('form-menu-price').value) || 0);
    var cat = state.formMenuCat;

    if (state.editMenuId) {
      state.menuItems = state.menuItems.map(function (m) {
        return m.id === state.editMenuId ? Object.assign({}, m, { code: code, name: name, category: cat, unit: unit, price: price }) : m;
      });
      showBanner('Đã cập nhật thông tin món "' + name + '" (' + formatVnd(price) + ').');
    } else {
      state.menuItems.unshift({
        id: 'm-' + Date.now(),
        code: code,
        name: name,
        category: cat,
        unit: unit,
        price: price,
        available: true,
        img: IMG_BASE + 'dish-wagyu.jpg'
      });
      showBanner('Đã thêm món mới "' + name + '" vào thực đơn hệ thống.');
    }
    pushMenuToShared86();
    closeAllModals();
    renderMenuTab();
  });

  document.getElementById('btn-open-new-table').addEventListener('click', function () {
    state.editTableId = null;
    state.formTableZone = 'Tầng 1 Sảnh chung';
    state.formTableSeats = 4;
    document.getElementById('modal-table-title').textContent = 'Thêm Bàn Ăn Mới';
    document.getElementById('form-table-name').value = 'BÀN ' + (state.tables.length + 1);
    renderTableModalPills();
    document.getElementById('modal-table').classList.add('is-open');
  });

  document.getElementById('btn-save-table').addEventListener('click', function () {
    var name = (document.getElementById('form-table-name').value || '').trim() || 'BÀN MỚI';
    if (state.editTableId) {
      state.tables = state.tables.map(function (t) {
        return t.id === state.editTableId ? Object.assign({}, t, { name: name, zone: state.formTableZone, seats: state.formTableSeats }) : t;
      });
      showBanner('Đã cập nhật cấu hình ' + name + ' (' + state.formTableSeats + ' ghế).');
    } else {
      state.tables.push({
        id: 'tb-' + Date.now(),
        name: name,
        zone: state.formTableZone,
        seats: state.formTableSeats,
        status: 'empty'
      });
      showBanner('Đã thêm ' + name + ' vào ' + state.formTableZone + '.');
    }
    closeAllModals();
    renderTablesTab();
  });

  document.getElementById('btn-open-new-account').addEventListener('click', function () {
    state.editAccountId = null;
    state.formAccRole = 'Phục vụ';
    state.formAccShift = 'Ca Tối';
    document.getElementById('modal-account-title').textContent = 'Cấp Tài Khoản Nhân Sự Mới';
    document.getElementById('form-acc-name').value = '';
    document.getElementById('form-acc-user').value = '';
    renderAccountModalPills();
    document.getElementById('modal-account').classList.add('is-open');
  });

  document.getElementById('btn-save-account').addEventListener('click', function () {
    var fullName = (document.getElementById('form-acc-name').value || '').trim() || 'Nhân sự Mới';
    var username = (document.getElementById('form-acc-user').value || '').trim() || ('user.' + (state.accounts.length + 1));
    if (state.editAccountId) {
      state.accounts = state.accounts.map(function (a) {
        return a.id === state.editAccountId ? Object.assign({}, a, { fullName: fullName, username: username, role: state.formAccRole, shift: state.formAccShift }) : a;
      });
      showBanner('Đã cập nhật phân quyền "' + state.formAccRole + '" cho ' + fullName + '.');
    } else {
      var idx = String(state.accounts.length + 1);
      while (idx.length < 3) idx = '0' + idx;
      state.accounts.push({
        id: 'a-' + Date.now(),
        code: 'NV-' + idx,
        fullName: fullName,
        username: username,
        role: state.formAccRole,
        shift: state.formAccShift,
        active: true
      });
      showBanner('Đã cấp tài khoản "' + username + '" (' + state.formAccRole + ').');
    }
    closeAllModals();
    renderAccountsTab();
  });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') closeAllModals();
  });

  window.addEventListener('storage', function (e) {
    if (e.key === STORAGE_86_KEY) {
      syncMenuFromShared86();
      renderMenuTab();
    }
  });

  renderShellHeaderAndNav();
  renderReportsTab();
  renderBookingsTab();
  renderMenuTab();
  renderTablesTab();
  renderAccountsTab();
})();
</script>
</body>
</html>

