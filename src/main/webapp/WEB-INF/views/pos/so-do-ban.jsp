<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HOUGO POS — Sơ Đồ Bàn Nhà Hàng</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&amp;family=JetBrains+Mono:wght@500;700;800&amp;family=Playfair+Display:wght@600;700&amp;display=swap">
  <style>
    :root {
      --bg-canvas: #0B1120;
      --bg-surface: #111827;
      --bg-elevated: #1E293B;
      --crimson: #B91C1C;
      --crimson-deep: #991B1B;
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

    body {
      margin: 0;
      min-height: 100vh;
      background-color: var(--bg-canvas);
      color: var(--text-primary);
      font-family: 'Be Vietnam Pro', system-ui, -apple-system, sans-serif;
      color-scheme: dark;
    }

    a {
      text-decoration: none;
    }

    button,
    input,
    select,
    textarea {
      font-family: inherit;
    }

    button,
    .pos-back-link,
    .pos-kitchen-link,
    .pos-admin-link,
    .pos-logout-link,
    .pos-card-cta {
      transition: transform 0.14s ease, filter 0.14s ease, background-color 0.14s ease, border-color 0.14s ease, box-shadow 0.14s ease;
    }

    button:hover:not(:disabled),
    .pos-back-link:hover,
    .pos-kitchen-link:hover,
    .pos-admin-link:hover,
    .pos-logout-link:hover,
    a.pos-card-cta:hover {
      filter: brightness(1.08);
    }

    button:active:not(:disabled),
    .pos-back-link:active,
    .pos-kitchen-link:active,
    .pos-admin-link:active,
    .pos-logout-link:active,
    a.pos-card-cta:active {
      transform: scale(0.985);
    }

    button:focus-visible,
    a:focus-visible,
    input:focus-visible,
    select:focus-visible,
    textarea:focus-visible {
      outline: 2px solid var(--gold);
      outline-offset: 2px;
    }

    input::placeholder,
    textarea::placeholder {
      color: var(--text-muted);
    }

    @keyframes posPulse {
      0%, 100% {
        opacity: 1;
        transform: scale(1);
      }
      50% {
        opacity: 0.45;
        transform: scale(1.25);
      }
    }

    .pos-shell {
      min-height: 100vh;
      width: 100%;
      background-color: var(--bg-canvas);
      display: flex;
      flex-direction: column;
    }

    /* Topbar POS */
    .pos-topbar {
      width: 100%;
      background-color: var(--bg-surface);
      border-bottom: 1px solid rgba(245, 158, 11, 0.25);
      padding: 10px 24px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 14px;
    }

    .pos-topbar-left {
      display: flex;
      align-items: center;
      gap: 14px;
      flex-wrap: wrap;
    }

    .pos-back-link {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      background-color: var(--bg-elevated);
      border: 1px solid rgba(148, 163, 184, 0.28);
      color: #E2E8F0;
      font-size: 13px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 7px;
      cursor: pointer;
    }

    .pos-brand {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .pos-brand-text {
      display: flex;
      flex-direction: column;
      gap: 1px;
    }

    .pos-brand-row {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .pos-brand-name {
      font-family: 'Playfair Display', Georgia, serif;
      font-size: 18px;
      font-weight: 700;
      letter-spacing: 0.08em;
      color: #FAF7F2;
      line-height: 1.1;
    }

    .pos-brand-tag {
      padding: 2px 7px;
      border-radius: 6px;
      background-color: rgba(185, 28, 28, 0.3);
      border: 1px solid rgba(245, 158, 11, 0.38);
      color: var(--gold-bright);
      font-size: 10.5px;
      font-weight: 700;
      letter-spacing: 0.06em;
    }

    .pos-brand-sub {
      font-size: 11.5px;
      color: var(--text-muted);
    }

    .pos-topbar-right {
      display: flex;
      align-items: center;
      gap: 12px;
      flex-wrap: wrap;
    }

    .pos-session-pill {
      min-height: 44px;
      padding: 6px 14px;
      border-radius: 10px;
      background-color: #0F172A;
      border: 1px solid rgba(148, 163, 184, 0.22);
      display: flex;
      align-items: center;
      gap: 12px;
      font-size: 12.5px;
      color: #E2E8F0;
    }

    .pos-live-dot {
      width: 8px;
      height: 8px;
      border-radius: 999px;
      background-color: var(--emerald);
      display: inline-block;
      animation: posPulse 1.8s ease-in-out infinite;
    }

    .pos-clock-pill {
      min-height: 44px;
      padding: 6px 14px;
      border-radius: 10px;
      background-color: var(--bg-elevated);
      border: 1px solid rgba(245, 158, 11, 0.35);
      display: flex;
      align-items: center;
      gap: 9px;
    }

    .pos-kitchen-link {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      background-color: var(--crimson-deep);
      border: 1px solid rgba(251, 191, 36, 0.58);
      color: var(--gold-soft);
      font-size: 13px;
      font-weight: 700;
      display: inline-flex;
      align-items: center;
      gap: 7px;
      white-space: nowrap;
      cursor: pointer;
    }

    .pos-admin-link {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      background-color: rgba(30, 41, 59, 0.92);
      border: 1px solid rgba(251, 191, 36, 0.42);
      color: var(--cream);
      font-size: 13px;
      font-weight: 700;
      display: inline-flex;
      align-items: center;
      gap: 7px;
      white-space: nowrap;
      cursor: pointer;
    }

    .pos-logout-link {
      min-height: 44px;
      padding: 0 13px;
      border-radius: 10px;
      background-color: rgba(153, 27, 27, 0.35);
      border: 1px solid rgba(248, 113, 113, 0.55);
      color: #FECACA;
      font-size: 12.5px;
      font-weight: 700;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      white-space: nowrap;
      cursor: pointer;
    }

    .pos-clock-time {
      font-family: 'JetBrains Mono', monospace;
      font-size: 16px;
      font-weight: 700;
      color: var(--gold-bright);
      letter-spacing: 0.04em;
    }

    .pos-clock-date {
      font-size: 11px;
      color: var(--text-muted);
    }

    /* Banner */
    .pos-banner {
      margin: 10px 24px 0;
      padding: 9px 16px;
      border-radius: 10px;
      background-color: rgba(30, 41, 59, 0.92);
      border: 1px solid rgba(148, 163, 184, 0.28);
      display: none;
      align-items: center;
      justify-content: space-between;
      gap: 14px;
      flex-wrap: wrap;
    }

    .pos-banner.is-visible {
      display: flex;
    }

    .pos-banner.is-mode {
      background-color: rgba(185, 28, 28, 0.25);
      border-color: rgba(245, 158, 11, 0.52);
    }

    /* Main Workspace */
    .pos-workspace {
      flex: 1;
      width: 100%;
      padding: 14px 24px 18px;
      display: flex;
      flex-wrap: wrap;
      align-items: flex-start;
      gap: 20px;
    }

    .pos-main {
      flex: 1 1 880px;
      min-width: 0;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    /* Filter Bar */
    .pos-filter-bar {
      background-color: var(--bg-surface);
      border: 1px solid rgba(148, 163, 184, 0.18);
      border-radius: 13px;
      padding: 8px 12px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .pos-floor-track {
      display: inline-flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 4px;
      padding: 4px;
      border-radius: 10px;
      background-color: var(--bg-canvas);
      border: 1px solid rgba(148, 163, 184, 0.16);
    }

    .pos-floor-tab {
      min-height: 40px;
      padding: 0 14px;
      border-radius: 7px;
      font-size: 12.5px;
      font-weight: 700;
      cursor: pointer;
      border: none;
      background-color: transparent;
      color: var(--text-muted);
    }

    .pos-floor-tab.is-active {
      background-color: var(--crimson);
      color: var(--gold-soft);
    }

    .pos-status-group {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 7px;
    }

    .pos-status-pill {
      min-height: 40px;
      padding: 0 12px;
      border-radius: 9px;
      font-size: 12px;
      font-weight: 600;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      border: 1px solid rgba(148, 163, 184, 0.2);
      background-color: #0F172A;
      color: var(--text-secondary);
    }

    .pos-status-pill.is-active {
      background-color: var(--bg-elevated);
      color: var(--text-primary);
      border-width: 1.5px;
    }

    .pos-status-pill[data-status="all"].is-active { border-color: var(--gold); }
    .pos-status-pill[data-status="empty"].is-active { border-color: var(--emerald); }
    .pos-status-pill[data-status="occupied"].is-active { border-color: var(--red-live); }
    .pos-status-pill[data-status="reserved"].is-active { border-color: var(--gold); }

    /* Table Grid (4x4 on Desktop) */
    .pos-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(min(228px, 100%), 1fr));
      gap: 12px;
    }

    .pos-table-card {
      padding: 13px 14px;
      border-radius: 13px;
      min-height: 170px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      gap: 9px;
      background: var(--bg-surface);
      border: 1.5px solid rgba(16, 185, 129, 0.55);
      box-shadow: 0 8px 20px rgba(2, 6, 23, 0.35);
      transition: transform 0.16s ease, box-shadow 0.16s ease;
    }

    .pos-table-card:hover {
      transform: translateY(-2px);
    }

    .pos-table-card.is-occupied {
      background: linear-gradient(160deg, #450A0A 0%, #1F121B 100%);
      border: 1.5px solid var(--red-live);
      box-shadow: 0 10px 24px rgba(185, 28, 28, 0.28);
    }

    .pos-table-card.is-reserved {
      background: linear-gradient(160deg, rgba(245, 158, 11, 0.14) 0%, var(--bg-surface) 100%);
      border: 1.5px solid var(--gold);
    }

    .pos-table-card.is-source {
      border: 2px solid var(--gold-bright) !important;
      box-shadow: 0 0 0 3px rgba(251, 191, 36, 0.35) !important;
    }

    .pos-card-head {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
    }

    .pos-card-title-wrap {
      display: flex;
      align-items: center;
      gap: 7px;
      min-width: 0;
    }

    .pos-table-name {
      font-size: 18px;
      font-weight: 800;
      color: var(--text-primary);
      white-space: nowrap;
      letter-spacing: 0.01em;
      line-height: 1.15;
    }

    .pos-zone-chip {
      padding: 2px 6px;
      border-radius: 5px;
      background-color: rgba(15, 23, 42, 0.78);
      border: 1px solid rgba(148, 163, 184, 0.25);
      font-size: 10.5px;
      font-weight: 700;
      color: var(--text-secondary);
      white-space: nowrap;
    }

    .pos-badge {
      padding: 3px 8px;
      border-radius: 999px;
      display: inline-flex;
      align-items: center;
      gap: 5px;
      font-size: 11px;
      font-weight: 700;
      white-space: nowrap;
      flex-shrink: 0;
    }

    .pos-badge.is-empty {
      background-color: rgba(16, 185, 129, 0.18);
      color: #A7F3D0;
      border: 1px solid rgba(16, 185, 129, 0.45);
    }

    .pos-badge.is-occupied {
      background-color: rgba(239, 68, 68, 0.24);
      color: #FECACA;
      border: 1px solid rgba(239, 68, 68, 0.55);
    }

    .pos-badge.is-reserved {
      background-color: rgba(245, 158, 11, 0.2);
      color: var(--gold-soft);
      border: 1px solid rgba(245, 158, 11, 0.5);
    }

    .pos-badge-dot {
      width: 6px;
      height: 6px;
      border-radius: 999px;
      display: inline-block;
    }

    .pos-card-body {
      flex: 1;
      padding: 9px 11px;
      border-radius: 10px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      gap: 5px;
    }

    .pos-card-body.is-empty {
      background-color: rgba(15, 23, 42, 0.58);
      border: 1px solid rgba(16, 185, 129, 0.18);
    }

    .pos-card-body.is-occupied {
      background-color: rgba(15, 23, 42, 0.7);
      border: 1px solid rgba(239, 68, 68, 0.25);
      justify-content: space-between;
    }

    .pos-card-body.is-reserved {
      background-color: rgba(15, 23, 42, 0.62);
      border: 1px solid rgba(245, 158, 11, 0.25);
    }

    .pos-card-cta {
      min-height: 44px;
      width: 100%;
      padding: 0 13px;
      border-radius: 9px;
      font-size: 13px;
      font-weight: 700;
      text-decoration: none;
      white-space: nowrap;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: space-between;
    }

    .pos-card-cta.is-empty {
      border: 1.5px solid var(--emerald);
      background-color: #065F46;
      color: #ECFDF5;
      box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);
    }

    .pos-card-cta.is-occupied {
      border: 1px solid rgba(251, 191, 36, 0.55);
      background-color: var(--crimson);
      color: #FAF7F2;
    }

    .pos-card-cta.is-reserved {
      border: 1px solid rgba(245, 158, 11, 0.6);
      background-color: rgba(245, 158, 11, 0.2);
      color: var(--gold-soft);
    }

    /* Right Sidebar */
    .pos-sidebar {
      flex: 0 0 342px;
      width: 342px;
      max-width: 100%;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .pos-side-card {
      background-color: var(--bg-surface);
      border: 1px solid rgba(148, 163, 184, 0.2);
      border-radius: 14px;
      padding: 16px;
      display: flex;
      flex-direction: column;
      gap: 11px;
    }

    .pos-side-card.revenue-panel {
      border-color: rgba(245, 158, 11, 0.32);
      gap: 12px;
    }

    .pos-side-kicker {
      font-size: 11.5px;
      font-weight: 700;
      letter-spacing: 0.14em;
      color: var(--gold);
    }

    .pos-revenue-hero {
      padding: 14px 16px;
      border-radius: 12px;
      background: linear-gradient(135deg, rgba(153, 27, 27, 0.5) 0%, rgba(15, 23, 42, 0.96) 100%);
      border: 1px solid rgba(251, 191, 36, 0.38);
      display: flex;
      flex-direction: column;
      gap: 4px;
      box-shadow: 0 8px 20px rgba(153, 27, 27, 0.22);
    }

    .pos-revenue-value {
      font-family: 'JetBrains Mono', monospace;
      font-size: 30px;
      font-weight: 800;
      color: var(--gold-bright);
      letter-spacing: -0.02em;
      line-height: 1.15;
    }

    .pos-op-btn {
      min-height: 58px;
      width: 100%;
      padding: 10px 12px;
      border-radius: 12px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      border: 1.5px solid rgba(148, 163, 184, 0.28);
      background: linear-gradient(180deg, #1E293B 0%, #141C2B 100%);
      box-shadow: 0 4px 12px rgba(2, 6, 23, 0.36);
      color: var(--text-primary);
    }

    .pos-op-btn:hover:not(:disabled) {
      transform: translateY(-2px);
      border-color: var(--gold);
      background: linear-gradient(180deg, #27354F 0%, #172033 100%);
      box-shadow: 0 8px 20px rgba(245, 158, 11, 0.18);
    }

    .pos-op-btn.is-active {
      border-color: var(--gold-bright);
      background: linear-gradient(180deg, rgba(185, 28, 28, 0.48) 0%, rgba(69, 10, 10, 0.72) 100%);
      box-shadow: 0 8px 20px rgba(245, 158, 11, 0.22);
    }

    /* Modals */
    .pos-modal-backdrop {
      position: fixed;
      inset: 0;
      background-color: rgba(2, 6, 23, 0.82);
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

    .pos-modal-box {
      width: 100%;
      max-width: 520px;
      background-color: var(--bg-surface);
      border: 1px solid rgba(245, 158, 11, 0.45);
      border-radius: 18px;
      padding: 26px;
      box-shadow: 0 28px 64px rgba(0, 0, 0, 0.65);
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .pos-modal-box.is-order {
      max-width: 540px;
      border-color: rgba(239, 68, 68, 0.45);
      gap: 18px;
    }

    .pos-preset-btn {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
      border: 1px solid rgba(148, 163, 184, 0.24);
      background-color: #0F172A;
      color: #E2E8F0;
    }

    .pos-preset-btn.is-active {
      border: 1.5px solid var(--gold);
      background-color: var(--crimson-deep);
      color: var(--gold-soft);
    }

    @media (max-width: 1120px) {
      .pos-workspace {
        padding: 12px 18px 18px;
      }
      .pos-sidebar {
        flex: 1 1 100%;
        width: 100%;
      }
    }
  </style>
</head>
<body>
<div class="pos-shell">

  <!-- Topbar POS -->
  <header class="pos-topbar">
    <div class="pos-topbar-left">
      <a href="${pageContext.request.contextPath}/home" class="pos-back-link">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <path d="M19 12H5"></path>
          <path d="M12 19L5 12L12 5"></path>
        </svg>
        <span>Về Trang Chủ</span>
      </a>

      <div class="pos-brand">
        <svg width="36" height="36" viewBox="0 0 42 42" fill="none" aria-hidden="true">
          <rect x="1" y="1" width="40" height="40" rx="10" fill="#991B1B" stroke="#F59E0B" stroke-width="1.5"></rect>
          <path d="M12 22.5H30C29.5 27.2 25.8 30 21 30C16.2 30 12.5 27.2 12 22.5Z" stroke="#FDE68A" stroke-width="1.6" stroke-linejoin="round"></path>
          <path d="M10.5 22.5H31.5" stroke="#F59E0B" stroke-width="1.8" stroke-linecap="round"></path>
          <path d="M17 17C17 15.3 18.2 14.7 18.2 13" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
          <path d="M21 17C21 15 22.4 14.3 22.4 12.3" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
          <path d="M25 17C25 15.3 26.2 14.7 26.2 13" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
        </svg>
        <div class="pos-brand-text">
          <div class="pos-brand-row">
            <span class="pos-brand-name">HOUGO POS</span>
            <span class="pos-brand-tag">QUẦY THU NGÂN</span>
          </div>
          <span class="pos-brand-sub">Sơ đồ bàn &amp; Điều phối phục vụ</span>
        </div>
      </div>
    </div>

    <!-- Session & Live Clock -->
    <div class="pos-topbar-right">
      <div class="pos-session-pill">
        <span style="display: inline-flex; align-items: center; gap: 6px;">
          <span class="pos-live-dot"></span>
          <span>Ca: <strong style="color: #FBBF24;">${not empty sessionScope.authShiftShort ? sessionScope.authShiftShort : 'Tối'}</strong></span>
        </span>
        <span style="color: #475569;">|</span>
        <span>Thu ngân: <strong style="color: #F8FAFC;">${not empty sessionScope.authFullName ? sessionScope.authFullName : 'Phạm Thùy Linh'}</strong></span>
        <span style="color: #475569;">|</span>
        <span>Bàn hoạt động: <strong id="pos-active-count" style="color: #FCA5A5; font-family: 'JetBrains Mono', monospace;">6/16</strong></span>
      </div>

      <a href="${pageContext.request.contextPath}/kitchen" class="pos-kitchen-link">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FDE68A" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <path d="M12 2C12 2 17 6.5 17 11.5A5 5 0 1 1 7 11.5C7 9.5 8 7.5 9.5 6C9.5 6 10 8 11.5 8C11.5 6 12 2 12 2Z"></path>
        </svg>
        <span>Màn hình Bếp (KDT)</span>
      </a>

      <a href="${pageContext.request.contextPath}/admin" class="pos-admin-link">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <rect x="3" y="3" width="7" height="7" rx="1.5"></rect>
          <rect x="14" y="3" width="7" height="7" rx="1.5"></rect>
          <rect x="14" y="14" width="7" height="7" rx="1.5"></rect>
          <rect x="3" y="14" width="7" height="7" rx="1.5"></rect>
        </svg>
        <span>Quản trị (Admin)</span>
      </a>

      <div class="pos-clock-pill">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <circle cx="12" cy="12" r="9"></circle>
          <path d="M12 7V12L15.5 14"></path>
        </svg>
        <div style="display: flex; align-items: baseline; gap: 8px;">
          <span id="pos-clock-time" class="pos-clock-time">--:--:--</span>
          <span id="pos-clock-date" class="pos-clock-date">--/--/----</span>
        </div>
      </div>

      <a href="${pageContext.request.contextPath}/login" class="pos-logout-link">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <path d="M9 21H5C3.9 21 3 20.1 3 19V5C3 3.9 3.9 3 5 3H9"></path>
          <polyline points="16 17 21 12 16 7"></polyline>
          <line x1="21" y1="12" x2="9" y2="12"></line>
        </svg>
        <span>Đăng xuất</span>
      </a>
    </div>
  </header>

  <!-- Action / Feedback Banner -->
  <div id="pos-banner" class="pos-banner" role="status" aria-live="polite">
    <div style="display: flex; align-items: center; gap: 9px; color: #F8FAFC; font-size: 13px; font-weight: 500;">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <circle cx="12" cy="12" r="10"></circle>
        <path d="M12 16V12"></path>
        <path d="M12 8H12.01"></path>
      </svg>
      <span id="pos-banner-text"></span>
    </div>
    <div style="display: flex; align-items: center; gap: 8px;">
      <button type="button" id="pos-cancel-mode-btn" style="display: none; min-height: 36px; padding: 0 12px; border-radius: 8px; background-color: #0F172A; border: 1px solid rgba(255, 255, 255, 0.22); color: #FBBF24; font-size: 12px; font-weight: 600; cursor: pointer;">Hủy thao tác</button>
      <button type="button" id="pos-dismiss-banner-btn" aria-label="Đóng thông báo" style="min-height: 36px; padding: 0 12px; border-radius: 8px; background-color: rgba(15, 23, 42, 0.65); border: 1px solid rgba(255, 255, 255, 0.16); color: #CBD5E1; font-size: 12px; font-weight: 600; cursor: pointer;">Đóng</button>
    </div>
  </div>

  <!-- Main Workspace -->
  <div class="pos-workspace">

    <!-- Left Column: Filter Strip + 16-Table Grid -->
    <main class="pos-main">
      <div class="pos-filter-bar">
        <div role="tablist" aria-label="Chọn khu vực tầng" class="pos-floor-track">
          <button type="button" role="tab" class="pos-floor-tab is-active" data-floor="all">Tất cả khu vực</button>
          <button type="button" role="tab" class="pos-floor-tab" data-floor="1">Tầng 1 (Sảnh chung)</button>
          <button type="button" role="tab" class="pos-floor-tab" data-floor="2">Tầng 2 (VIP &amp; Gia đình)</button>
        </div>

        <div class="pos-status-group">
          <button type="button" class="pos-status-pill is-active" data-status="all">
            <span>Tất cả (<span id="count-all">16</span>)</span>
          </button>
          <button type="button" class="pos-status-pill" data-status="empty">
            <span style="width: 8px; height: 8px; border-radius: 999px; background-color: #10B981; display: inline-block;"></span>
            <span>Bàn trống (<span id="count-empty">8</span>)</span>
          </button>
          <button type="button" class="pos-status-pill" data-status="occupied">
            <span style="width: 8px; height: 8px; border-radius: 999px; background-color: #EF4444; display: inline-block;"></span>
            <span>Đang phục vụ (<span id="count-occupied">6</span>)</span>
          </button>
          <button type="button" class="pos-status-pill" data-status="reserved">
            <span style="width: 8px; height: 8px; border-radius: 999px; background-color: #F59E0B; display: inline-block;"></span>
            <span>Đã đặt trước (<span id="count-reserved">2</span>)</span>
          </button>
        </div>
      </div>

      <div id="pos-table-grid" class="pos-grid"></div>
    </main>

    <!-- Right Sidebar (2.4): Shift Stats & Quick Action Buttons -->
    <aside class="pos-sidebar">

      <!-- Shift Revenue Panel -->
      <section class="pos-side-card revenue-panel">
        <div style="display: flex; align-items: center; justify-content: space-between;">
          <span class="pos-side-kicker">THỐNG KÊ CA TỐI</span>
          <span style="padding: 3px 9px; border-radius: 999px; background-color: rgba(16, 185, 129, 0.16); border: 1px solid rgba(16, 185, 129, 0.35); color: #6EE7B7; font-size: 11px; font-weight: 700;">Đang trực ca</span>
        </div>

        <div class="pos-revenue-hero">
          <span style="font-size: 12px; font-weight: 600; color: #CBD5E1;">Tổng doanh thu ca tạm tính</span>
          <span id="pos-shift-revenue" class="pos-revenue-value">18.910.000đ</span>
          <span id="pos-running-bill-sub" style="font-size: 12px; color: #94A3B8;">Gồm 10.270.000đ đang mở tại 6 bàn</span>
        </div>

        <div style="display: flex; flex-direction: column; gap: 6px;">
          <div style="display: flex; align-items: center; justify-content: space-between; font-size: 12.5px;">
            <span style="color: #94A3B8;">Công suất lấp đầy bàn</span>
            <strong id="pos-occupancy-text" style="color: #F8FAFC; font-family: 'JetBrains Mono', monospace;">38% (6/16)</strong>
          </div>
          <div style="height: 8px; width: 100%; border-radius: 999px; background-color: #1E293B; overflow: hidden;">
            <div id="pos-occupancy-bar" style="height: 100%; width: 38%; background: linear-gradient(90deg, #B91C1C 0%, #FBBF24 100%); border-radius: 999px; transition: width 0.25s ease;"></div>
          </div>
        </div>

        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 8px;">
          <div style="padding: 8px 6px; border-radius: 10px; background-color: rgba(239, 68, 68, 0.14); border: 1px solid rgba(239, 68, 68, 0.35); display: flex; flex-direction: column; align-items: center; gap: 1px;">
            <span id="stat-occupied" style="font-family: 'JetBrains Mono', monospace; font-size: 17px; font-weight: 800; color: #FECACA;">6</span>
            <span style="font-size: 11px; color: #FCA5A5;">Có khách</span>
          </div>
          <div style="padding: 8px 6px; border-radius: 10px; background-color: rgba(16, 185, 129, 0.14); border: 1px solid rgba(16, 185, 129, 0.35); display: flex; flex-direction: column; align-items: center; gap: 1px;">
            <span id="stat-empty" style="font-family: 'JetBrains Mono', monospace; font-size: 17px; font-weight: 800; color: #A7F3D0;">8</span>
            <span style="font-size: 11px; color: #6EE7B7;">Bàn trống</span>
          </div>
          <div style="padding: 8px 6px; border-radius: 10px; background-color: rgba(245, 158, 11, 0.14); border: 1px solid rgba(245, 158, 11, 0.35); display: flex; flex-direction: column; align-items: center; gap: 1px;">
            <span id="stat-reserved" style="font-family: 'JetBrains Mono', monospace; font-size: 17px; font-weight: 800; color: #FDE68A;">2</span>
            <span style="font-size: 11px; color: #FCD34D;">Đã đặt</span>
          </div>
        </div>
      </section>

      <!-- Quick Table Operations (2.4) -->
      <section class="pos-side-card" style="gap: 10px;">
        <span class="pos-side-kicker">THAO TÁC NHANH BÀN</span>

        <button type="button" id="btn-mode-transfer" class="pos-op-btn">
          <div style="display: flex; align-items: center; gap: 11px;">
            <div style="width: 36px; height: 36px; border-radius: 9px; background-color: rgba(245, 158, 11, 0.16); border: 1px solid rgba(245, 158, 11, 0.4); display: inline-flex; align-items: center; justify-content: center; color: #FBBF24; flex-shrink: 0;">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M17 3L21 7L17 11"></path>
                <path d="M3 7H21"></path>
                <path d="M7 21L3 17L7 13"></path>
                <path d="M21 17H3"></path>
              </svg>
            </div>
            <div style="display: flex; flex-direction: column; align-items: flex-start; text-align: left; gap: 1px;">
              <span style="font-size: 14px; font-weight: 700; color: #F8FAFC;">Chuyển bàn</span>
              <span style="font-size: 11.5px; color: #94A3B8;">Đổi khách sang bàn trống</span>
            </div>
          </div>
          <span id="tag-mode-transfer" style="padding: 4px 10px; border-radius: 7px; background-color: rgba(15, 23, 42, 0.8); border: 1px solid rgba(245, 158, 11, 0.35); font-size: 11.5px; font-weight: 700; color: #FBBF24;">Chọn</span>
        </button>

        <button type="button" id="btn-mode-merge" class="pos-op-btn">
          <div style="display: flex; align-items: center; gap: 11px;">
            <div style="width: 36px; height: 36px; border-radius: 9px; background-color: rgba(239, 68, 68, 0.18); border: 1px solid rgba(239, 68, 68, 0.4); display: inline-flex; align-items: center; justify-content: center; color: #FCA5A5; flex-shrink: 0;">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <circle cx="8" cy="18" r="3"></circle>
                <circle cx="16" cy="6" r="3"></circle>
                <path d="M8 15V9A3 3 0 0 1 11 6H13"></path>
                <path d="M16 9V15"></path>
              </svg>
            </div>
            <div style="display: flex; flex-direction: column; align-items: flex-start; text-align: left; gap: 1px;">
              <span style="font-size: 14px; font-weight: 700; color: #F8FAFC;">Gộp bàn</span>
              <span style="font-size: 11.5px; color: #94A3B8;">Gộp 2 hóa đơn đang phục vụ</span>
            </div>
          </div>
          <span id="tag-mode-merge" style="padding: 4px 10px; border-radius: 7px; background-color: rgba(15, 23, 42, 0.8); border: 1px solid rgba(245, 158, 11, 0.35); font-size: 11.5px; font-weight: 700; color: #FBBF24;">Chọn</span>
        </button>

        <button type="button" id="btn-mode-split" class="pos-op-btn">
          <div style="display: flex; align-items: center; gap: 11px;">
            <div style="width: 36px; height: 36px; border-radius: 9px; background-color: rgba(16, 185, 129, 0.16); border: 1px solid rgba(16, 185, 129, 0.4); display: inline-flex; align-items: center; justify-content: center; color: #6EE7B7; flex-shrink: 0;">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M16 3H21V8"></path>
                <path d="M4 20L21 3"></path>
                <path d="M21 16V21H16"></path>
                <path d="M15 15L21 21"></path>
                <path d="M4 4L9 9"></path>
              </svg>
            </div>
            <div style="display: flex; flex-direction: column; align-items: flex-start; text-align: left; gap: 1px;">
              <span style="font-size: 14px; font-weight: 700; color: #F8FAFC;">Tách bàn</span>
              <span style="font-size: 11.5px; color: #94A3B8;">Tách nhóm khách sang bàn mới</span>
            </div>
          </div>
          <span id="tag-mode-split" style="padding: 4px 10px; border-radius: 7px; background-color: rgba(15, 23, 42, 0.8); border: 1px solid rgba(245, 158, 11, 0.35); font-size: 11.5px; font-weight: 700; color: #FBBF24;">Chọn</span>
        </button>
      </section>

      <!-- Priority Active Tables & Legend -->
      <section class="pos-side-card" style="gap: 9px;">
        <span class="pos-side-kicker">THEO DÕI BÀN ĐANG LÊN MÓN</span>
        <div id="pos-top-active" style="display: flex; flex-direction: column; gap: 7px;"></div>
        <div style="padding-top: 8px; border-top: 1px solid rgba(148, 163, 184, 0.14); display: flex; flex-wrap: wrap; gap: 12px; font-size: 11.5px; color: #94A3B8;">
          <span style="display: inline-flex; align-items: center; gap: 5px;"><span style="width: 9px; height: 9px; border-radius: 3px; background-color: #10B981; display: inline-block;"></span>Bàn trống</span>
          <span style="display: inline-flex; align-items: center; gap: 5px;"><span style="width: 9px; height: 9px; border-radius: 3px; background-color: #EF4444; display: inline-block;"></span>Có khách</span>
          <span style="display: inline-flex; align-items: center; gap: 5px;"><span style="width: 9px; height: 9px; border-radius: 3px; background-color: #F59E0B; display: inline-block;"></span>Đã đặt</span>
        </div>
      </section>
    </aside>
  </div>

  <!-- MODAL 2.2: Mở Bàn -->
  <div id="pos-open-modal" class="pos-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="open-modal-title">
    <div class="pos-modal-box">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 16px;">
        <div style="display: flex; flex-direction: column; gap: 4px;">
          <span style="font-size: 11.5px; font-weight: 700; letter-spacing: 0.16em; color: #F59E0B;">NGHIỆP VỤ MỞ BÀN</span>
          <h2 id="open-modal-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 24px; font-weight: 700; color: #FAF7F2;">BÀN 01</h2>
          <span id="open-modal-subtitle" style="font-size: 13px; color: #94A3B8;">Tầng 1 (Sảnh chung)</span>
        </div>
        <button type="button" id="open-modal-close-x" aria-label="Đóng cửa sổ mở bàn" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.24); color: #E2E8F0; cursor: pointer; display: inline-flex; align-items: center; justify-content: center;">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M18 6L6 18"></path>
            <path d="M6 6L18 18"></path>
          </svg>
        </button>
      </div>

      <div style="display: flex; flex-direction: column; gap: 10px;">
        <label style="font-size: 13px; font-weight: 600; color: #E2E8F0;">Số lượng khách</label>
        <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
          <button type="button" class="pos-preset-btn" data-guests="2">2 khách</button>
          <button type="button" class="pos-preset-btn is-active" data-guests="4">4 khách</button>
          <button type="button" class="pos-preset-btn" data-guests="6">6 khách</button>
          <button type="button" class="pos-preset-btn" data-guests="8">8 khách</button>
          <div style="margin-left: auto; display: inline-flex; align-items: center; gap: 6px; background-color: #0F172A; border: 1px solid rgba(148, 163, 184, 0.24); border-radius: 10px; padding: 3px;">
            <button type="button" id="open-guests-dec" aria-label="Giảm số khách" style="min-width: 38px; min-height: 38px; border-radius: 8px; border: none; background-color: #1E293B; color: #F8FAFC; font-size: 16px; font-weight: 700; cursor: pointer;">-</button>
            <span id="open-guests-count" style="min-width: 34px; text-align: center; font-family: 'JetBrains Mono', monospace; font-size: 15px; font-weight: 700; color: #FBBF24;">4</span>
            <button type="button" id="open-guests-inc" aria-label="Tăng số khách" style="min-width: 38px; min-height: 38px; border-radius: 8px; border: none; background-color: #1E293B; color: #F8FAFC; font-size: 16px; font-weight: 700; cursor: pointer;">+</button>
          </div>
        </div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 8px;">
        <label for="pos-staff-select" style="font-size: 13px; font-weight: 600; color: #E2E8F0;">Nhân viên phục vụ phụ trách</label>
        <select id="pos-staff-select" style="min-height: 46px; width: 100%; padding: 10px 14px; border-radius: 10px; border: 1px solid rgba(148, 163, 184, 0.25); background-color: #0F172A; color: #F8FAFC; font-size: 14px;">
          <option value="Nguyễn Văn Minh">Nguyễn Văn Minh (Tổ trưởng Tầng 1)</option>
          <option value="Trần Thị Lan">Trần Thị Lan (Chuyên viên Tầng 1)</option>
          <option value="Lê Hoàng Nam">Lê Hoàng Nam (Phục vụ Sảnh)</option>
          <option value="Phạm Thùy Linh">Phạm Thùy Linh (Phục vụ Phòng VIP)</option>
        </select>
      </div>

      <div style="display: flex; flex-direction: column; gap: 8px;">
        <label for="pos-open-note" style="font-size: 13px; font-weight: 600; color: #E2E8F0;">Ghi chú bàn / Nồi lẩu mặc định</label>
        <textarea id="pos-open-note" rows="3" placeholder="Ví dụ: Chọn lẩu 2 ngăn Tứ Xuyên - Nấm, cần thêm 1 ghế trẻ em..." style="width: 100%; padding: 12px 14px; border-radius: 10px; border: 1px solid rgba(148, 163, 184, 0.25); background-color: #0F172A; color: #F8FAFC; font-size: 14px; resize: vertical;"></textarea>
      </div>

      <div style="display: flex; align-items: center; justify-content: flex-end; gap: 12px; padding-top: 6px;">
        <button type="button" id="open-modal-cancel" style="min-height: 46px; padding: 0 20px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.28); color: #E2E8F0; font-size: 14px; font-weight: 600; cursor: pointer;">Hủy bỏ</button>
        <button type="button" id="open-modal-confirm" style="min-height: 46px; padding: 0 24px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(245, 158, 11, 0.5); color: #FAF7F2; font-size: 14.5px; font-weight: 700; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; box-shadow: 0 10px 26px rgba(185, 28, 28, 0.4);">
          <span>Bắt đầu phục vụ</span>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M5 12H19"></path>
            <path d="M13 6L19 12L13 18"></path>
          </svg>
        </button>
      </div>
    </div>
  </div>

  <!-- MODAL 2.3/2.5: Gọi Món & Thanh Toán -->
  <div id="pos-order-modal" class="pos-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="order-modal-title">
    <div class="pos-modal-box is-order">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 16px;">
        <div style="display: flex; flex-direction: column; gap: 4px;">
          <span style="font-size: 11.5px; font-weight: 700; letter-spacing: 0.16em; color: #FCA5A5;">ĐIỀU HƯỚNG GỌI MÓN &amp; THANH TOÁN</span>
          <h2 id="order-modal-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 24px; font-weight: 700; color: #FAF7F2;">BÀN 03</h2>
          <span id="order-modal-meta" style="font-size: 13px; color: #94A3B8;"></span>
        </div>
        <button type="button" id="order-modal-close-x" aria-label="Đóng cửa sổ chi tiết bàn" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.24); color: #E2E8F0; cursor: pointer; display: inline-flex; align-items: center; justify-content: center;">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M18 6L6 18"></path>
            <path d="M6 6L18 18"></path>
          </svg>
        </button>
      </div>

      <div style="padding: 16px; border-radius: 12px; background-color: #0F172A; border: 1px solid rgba(148, 163, 184, 0.16); display: flex; flex-direction: column; gap: 10px;">
        <div style="display: flex; align-items: center; justify-content: space-between; gap: 12px; font-size: 13px; color: #94A3B8;">
          <span>Ghi chú / Combo hiện tại</span>
          <strong id="order-modal-note" style="color: #E2E8F0; text-align: right;"></strong>
        </div>
        <div style="height: 1px; background-color: rgba(148, 163, 184, 0.14);"></div>
        <div style="display: flex; align-items: center; justify-content: space-between;">
          <span style="font-size: 14px; font-weight: 600; color: #E2E8F0;">Tạm tính hiện tại</span>
          <span id="order-modal-bill" style="font-family: 'JetBrains Mono', monospace; font-size: 24px; font-weight: 800; color: #FBBF24;">0đ</span>
        </div>
      </div>

      <div style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 10px;">
        <button type="button" id="order-add-dish-btn" style="min-height: 46px; padding: 0 18px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(245, 158, 11, 0.45); color: #FBBF24; font-size: 13.5px; font-weight: 600; cursor: pointer;">+ Thêm khay Bò Wagyu (189.000đ)</button>
        <button type="button" id="order-settle-btn" style="min-height: 46px; padding: 0 22px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(245, 158, 11, 0.48); color: #FAF7F2; font-size: 14px; font-weight: 700; cursor: pointer;">Thanh toán &amp; Trả bàn</button>
      </div>
    </div>
  </div>

</div>

<script>
(function () {
  function formatVnd(n) {
    return Math.round(n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.') + 'đ';
  }

  function pad2(num) {
    return num < 10 ? '0' + num : '' + num;
  }

  function escapeHtml(str) {
    return String(str || '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  var POS_ORDER_URL = '${pageContext.request.contextPath}/pos/order?tableId=';

  var state = {
    floorFilter: 'all',
    statusFilter: 'all',
    settledShiftRevenue: 8640000,
    actionMode: null,
    sourceTableId: null,
    bannerMsg: '',
    openModalTableId: null,
    openGuestsCount: 4,
    orderModalTableId: null,
    tables: [
      { id: 1, name: 'BÀN 01', floor: 1, seats: 4, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'Sảnh chính · Gần cửa sổ' },
      { id: 2, name: 'BÀN 02', floor: 1, seats: 4, status: 'occupied', durationMin: 38, bill: 980000, guestsCount: 4, staff: 'Nguyễn Văn Minh', note: 'Combo 269K · Lẩu 2 ngăn' },
      { id: 3, name: 'BÀN 03', floor: 1, seats: 4, status: 'occupied', durationMin: 52, bill: 1420000, guestsCount: 4, staff: 'Trần Thị Lan', note: 'Lẩu Tứ Xuyên + Bò Wagyu' },
      { id: 4, name: 'BÀN 04', floor: 1, seats: 6, status: 'reserved', durationMin: 0, bill: 0, guestsCount: 6, staff: 'Lễ tân', note: 'Phạm Hoàng Anh · #RES-1104 · Bò Mỹ', reserveTime: '18:30' },
      { id: 5, name: 'BÀN 05', floor: 1, seats: 2, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'Khu cặp đôi · Quầy gia vị' },
      { id: 6, name: 'BÀN 06', floor: 1, seats: 6, status: 'occupied', durationMin: 24, bill: 1150000, guestsCount: 5, staff: 'Lê Hoàng Nam', note: 'Combo 269K x5 · Không cay' },
      { id: 7, name: 'BÀN 07', floor: 1, seats: 4, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'Sảnh chính · Khu trung tâm' },
      { id: 8, name: 'BÀN 08', floor: 1, seats: 6, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'Góc sảnh · Bàn gia đình' },
      { id: 9, name: 'BÀN 09', floor: 2, seats: 8, status: 'occupied', durationMin: 68, bill: 2840000, guestsCount: 7, staff: 'Phạm Thùy Linh', note: 'VIP Hoa Mai · Combo 329K' },
      { id: 10, name: 'BÀN 10', floor: 2, seats: 6, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'Tầng 2 · Ban công ấm cúng' },
      { id: 11, name: 'BÀN 11', floor: 2, seats: 8, status: 'occupied', durationMin: 41, bill: 3120000, guestsCount: 8, staff: 'Nguyễn Văn Minh', note: 'VIP Trúc Lâm · Lẩu Uyên Ương' },
      { id: 12, name: 'BÀN 12', floor: 2, seats: 10, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'VIP Mẫu Đơn · Cách âm' },
      { id: 13, name: 'BÀN 13', floor: 2, seats: 6, status: 'occupied', durationMin: 15, bill: 760000, guestsCount: 4, staff: 'Trần Thị Lan', note: 'Lẩu Cà Chua · Gia đình' },
      { id: 14, name: 'BÀN 14', floor: 2, seats: 4, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'Tầng 2 · Bàn yên tĩnh' },
      { id: 15, name: 'BÀN 15', floor: 2, seats: 10, status: 'reserved', durationMin: 0, bill: 0, guestsCount: 10, staff: 'Lễ tân', note: 'Công ty Minh Phát · #RES-1106 · Đặt cọc', reserveTime: '20:00' },
      { id: 16, name: 'BÀN 16', floor: 2, seats: 8, status: 'empty', durationMin: 0, bill: 0, guestsCount: 0, staff: '', note: 'VIP Kim Long · Đã dọn sạch' }
    ]
  };

  function updateClock() {
    var d = new Date();
    var tEl = document.getElementById('pos-clock-time');
    var dEl = document.getElementById('pos-clock-date');
    if (tEl) tEl.textContent = pad2(d.getHours()) + ':' + pad2(d.getMinutes()) + ':' + pad2(d.getSeconds());
    if (dEl) dEl.textContent = pad2(d.getDate()) + '/' + pad2(d.getMonth() + 1) + '/' + d.getFullYear();
  }

  function findTable(id) {
    for (var i = 0; i < state.tables.length; i++) {
      if (state.tables[i].id === id) return state.tables[i];
    }
    return null;
  }

  function shortStaff(staffName) {
    if (!staffName) return '';
    var parts = staffName.split(' ');
    return 'NV: ' + parts[parts.length - 1];
  }

  function openTableModal(tb) {
    state.openModalTableId = tb.id;
    state.openGuestsCount = tb.status === 'reserved' ? (tb.guestsCount || tb.seats) : Math.min(4, tb.seats);
    document.getElementById('open-modal-title').textContent = tb.name + ' (' + tb.seats + ' Ghế)';
    document.getElementById('open-modal-subtitle').textContent = tb.floor === 1 ? 'Tầng 1 (Sảnh chung)' : 'Tầng 2 (Phòng VIP & Gia đình)';
    document.getElementById('pos-staff-select').value = tb.floor === 2 ? 'Phạm Thùy Linh' : 'Nguyễn Văn Minh';
    document.getElementById('pos-open-note').value = tb.status === 'reserved' ? ('Nhận khách đặt trước: ' + tb.note) : 'Lẩu 2 ngăn Tứ Xuyên - Nấm Dưỡng Sinh';
    syncGuestPresetUI();
    document.getElementById('pos-open-modal').classList.add('is-open');
  }

  function closeOpenModal() {
    state.openModalTableId = null;
    document.getElementById('pos-open-modal').classList.remove('is-open');
  }

  function openOrderModal(tb) {
    state.orderModalTableId = tb.id;
    document.getElementById('order-modal-title').textContent = tb.name + ' · Đang phục vụ (' + tb.durationMin + ' phút)';
    document.getElementById('order-modal-meta').textContent = tb.guestsCount + ' khách · NV: ' + tb.staff;
    document.getElementById('order-modal-note').textContent = tb.note || 'Đang phục vụ';
    document.getElementById('order-modal-bill').textContent = formatVnd(tb.bill);
    document.getElementById('pos-order-modal').classList.add('is-open');
  }

  function closeOrderModal() {
    state.orderModalTableId = null;
    document.getElementById('pos-order-modal').classList.remove('is-open');
  }

  function syncGuestPresetUI() {
    document.getElementById('open-guests-count').textContent = state.openGuestsCount;
    var btns = document.querySelectorAll('.pos-preset-btn');
    for (var i = 0; i < btns.length; i++) {
      var val = parseInt(btns[i].getAttribute('data-guests'), 10);
      btns[i].classList.toggle('is-active', val === state.openGuestsCount);
    }
  }

  function handleCardClick(id) {
    var tb = findTable(id);
    if (!tb) return;
    var mode = state.actionMode;
    var srcId = state.sourceTableId;

    if (mode === 'transfer') {
      if (!srcId) {
        if (tb.status !== 'occupied') {
          state.bannerMsg = 'Chuyển bàn: Vui lòng chọn một bàn ĐANG CÓ KHÁCH làm bàn nguồn trước.';
          renderAll();
          return;
        }
        state.sourceTableId = tb.id;
        state.bannerMsg = 'Đã chọn ' + tb.name + ' làm bàn nguồn. Tiếp theo chọn một bàn TRỐNG để chuyển khách sang.';
        renderAll();
        return;
      }
      if (tb.id === srcId) {
        state.sourceTableId = null;
        state.bannerMsg = 'Đã bỏ chọn bàn nguồn. Chọn lại bàn đang có khách để chuyển.';
        renderAll();
        return;
      }
      if (tb.status !== 'empty') {
        state.bannerMsg = 'Chuyển bàn chỉ chuyển được vào BÀN TRỐNG. Vui lòng chọn bàn khác.';
        renderAll();
        return;
      }
      var srcTransfer = findTable(srcId);
      tb.status = 'occupied';
      tb.durationMin = srcTransfer.durationMin;
      tb.bill = srcTransfer.bill;
      tb.guestsCount = srcTransfer.guestsCount;
      tb.staff = srcTransfer.staff;
      tb.note = srcTransfer.note;
      srcTransfer.status = 'empty';
      srcTransfer.durationMin = 0;
      srcTransfer.bill = 0;
      srcTransfer.guestsCount = 0;
      srcTransfer.staff = '';
      srcTransfer.note = 'Vừa chuyển sang ' + tb.name;
      state.actionMode = null;
      state.sourceTableId = null;
      state.bannerMsg = 'Đã chuyển toàn bộ khách & order từ ' + srcTransfer.name + ' sang ' + tb.name + '.';
      renderAll();
      return;
    }

    if (mode === 'merge') {
      if (tb.status !== 'occupied') {
        state.bannerMsg = 'Gộp bàn: Vui lòng chọn các bàn ĐANG CÓ KHÁCH để gộp hóa đơn.';
        renderAll();
        return;
      }
      if (!srcId) {
        state.sourceTableId = tb.id;
        state.bannerMsg = 'Đã chọn ' + tb.name + '. Chọn thêm một bàn ĐANG CÓ KHÁCH khác để gộp hóa đơn vào bàn đích đó.';
        renderAll();
        return;
      }
      if (tb.id === srcId) {
        state.sourceTableId = null;
        state.bannerMsg = 'Đã bỏ chọn bàn nguồn. Vui lòng chọn bàn để gộp.';
        renderAll();
        return;
      }
      var srcMerge = findTable(srcId);
      tb.guestsCount += srcMerge.guestsCount;
      tb.bill += srcMerge.bill;
      tb.note = tb.note + ' + Gộp từ ' + srcMerge.name;
      srcMerge.status = 'empty';
      srcMerge.durationMin = 0;
      srcMerge.bill = 0;
      srcMerge.guestsCount = 0;
      srcMerge.staff = '';
      srcMerge.note = 'Đã gộp hóa đơn vào ' + tb.name;
      state.actionMode = null;
      state.sourceTableId = null;
      state.bannerMsg = 'Đã gộp ' + srcMerge.name + ' vào ' + tb.name + ' (Tổng mới: ' + formatVnd(tb.bill) + ').';
      renderAll();
      return;
    }

    if (mode === 'split') {
      if (!srcId) {
        if (tb.status !== 'occupied' || tb.guestsCount < 2) {
          state.bannerMsg = 'Tách bàn: Chọn một bàn ĐANG CÓ KHÁCH (từ 2 khách trở lên) để tách nhóm.';
          renderAll();
          return;
        }
        state.sourceTableId = tb.id;
        state.bannerMsg = 'Đã chọn tách ' + tb.name + '. Chọn một BÀN TRỐNG để đưa nửa nhóm khách & 50% hóa đơn sang.';
        renderAll();
        return;
      }
      if (tb.status !== 'empty') {
        state.bannerMsg = 'Tách bàn cần chọn một BÀN TRỐNG làm bàn mới cho nhóm vừa tách.';
        renderAll();
        return;
      }
      var srcSplit = findTable(srcId);
      var moveGuests = Math.max(1, Math.floor(srcSplit.guestsCount / 2));
      var keepGuests = srcSplit.guestsCount - moveGuests;
      var moveBill = Math.round((srcSplit.bill / 2) / 1000) * 1000;
      var keepBill = srcSplit.bill - moveBill;
      srcSplit.guestsCount = keepGuests;
      srcSplit.bill = keepBill;
      srcSplit.note = srcSplit.note + ' (Đã tách -> ' + tb.name + ')';
      tb.status = 'occupied';
      tb.durationMin = srcSplit.durationMin;
      tb.guestsCount = moveGuests;
      tb.bill = moveBill;
      tb.staff = srcSplit.staff;
      tb.note = 'Tách từ ' + srcSplit.name;
      state.actionMode = null;
      state.sourceTableId = null;
      state.bannerMsg = 'Đã tách ' + moveGuests + ' khách và ' + formatVnd(moveBill) + ' từ ' + srcSplit.name + ' sang ' + tb.name + '.';
      renderAll();
      return;
    }

    if (tb.status === 'empty' || tb.status === 'reserved') {
      openTableModal(tb);
    } else {
      openOrderModal(tb);
    }
  }

  function renderAll() {
    var countAll = state.tables.length;
    var countEmpty = 0;
    var countOccupied = 0;
    var countReserved = 0;
    var runningBill = 0;

    for (var i = 0; i < state.tables.length; i++) {
      var item = state.tables[i];
      if (item.status === 'empty') countEmpty++;
      else if (item.status === 'occupied') {
        countOccupied++;
        runningBill += item.bill;
      } else if (item.status === 'reserved') {
        countReserved++;
      }
    }

    var shiftRevenue = state.settledShiftRevenue + runningBill;
    var occupancyPct = Math.round((countOccupied / countAll) * 100);

    document.getElementById('pos-active-count').textContent = countOccupied + '/16';
    document.getElementById('count-all').textContent = countAll;
    document.getElementById('count-empty').textContent = countEmpty;
    document.getElementById('count-occupied').textContent = countOccupied;
    document.getElementById('count-reserved').textContent = countReserved;
    document.getElementById('stat-occupied').textContent = countOccupied;
    document.getElementById('stat-empty').textContent = countEmpty;
    document.getElementById('stat-reserved').textContent = countReserved;
    document.getElementById('pos-shift-revenue').textContent = formatVnd(shiftRevenue);
    document.getElementById('pos-running-bill-sub').textContent = 'Gồm ' + formatVnd(runningBill) + ' đang mở tại ' + countOccupied + ' bàn';
    document.getElementById('pos-occupancy-text').textContent = occupancyPct + '% (' + countOccupied + '/16)';
    document.getElementById('pos-occupancy-bar').style.width = occupancyPct + '%';

    // Banner
    var banner = document.getElementById('pos-banner');
    var cancelModeBtn = document.getElementById('pos-cancel-mode-btn');
    if (state.bannerMsg) {
      document.getElementById('pos-banner-text').textContent = state.bannerMsg;
      banner.classList.add('is-visible');
      banner.classList.toggle('is-mode', Boolean(state.actionMode));
      cancelModeBtn.style.display = state.actionMode ? 'inline-flex' : 'none';
    } else {
      banner.classList.remove('is-visible', 'is-mode');
    }

    // Sidebar mode buttons
    document.getElementById('btn-mode-transfer').classList.toggle('is-active', state.actionMode === 'transfer');
    document.getElementById('btn-mode-merge').classList.toggle('is-active', state.actionMode === 'merge');
    document.getElementById('btn-mode-split').classList.toggle('is-active', state.actionMode === 'split');
    document.getElementById('tag-mode-transfer').textContent = state.actionMode === 'transfer' ? 'Đang bật' : 'Chọn';
    document.getElementById('tag-mode-merge').textContent = state.actionMode === 'merge' ? 'Đang bật' : 'Chọn';
    document.getElementById('tag-mode-split').textContent = state.actionMode === 'split' ? 'Đang bật' : 'Chọn';

    // Top 3 Active Tables
    var occupiedList = state.tables
      .filter(function (t) { return t.status === 'occupied'; })
      .sort(function (a, b) { return b.durationMin - a.durationMin; })
      .slice(0, 3);
    var topHtml = '';
    for (var j = 0; j < occupiedList.length; j++) {
      var act = occupiedList[j];
      topHtml +=
        '<a href="' + POS_ORDER_URL + act.id + '" style="text-decoration: none; min-height: 44px; width: 100%; padding: 8px 12px; border-radius: 10px; background-color: #0F172A; border: 1px solid rgba(239, 68, 68, 0.3); color: #F8FAFC; cursor: pointer; display: flex; align-items: center; justify-content: space-between; gap: 8px; text-align: left;">' +
        '<div style="display: flex; flex-direction: column; gap: 1px;">' +
        '<span style="font-size: 13px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(act.name) + ' · ' + act.durationMin + ' phút</span>' +
        '<span style="font-size: 11.5px; color: #94A3B8;">' + act.guestsCount + ' khách · ' + escapeHtml(shortStaff(act.staff)) + '</span>' +
        '</div>' +
        '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 14px; font-weight: 800; color: #FBBF24;">' + formatVnd(act.bill) + '</span>' +
        '</a>';
    }
    document.getElementById('pos-top-active').innerHTML = topHtml || '<span style="font-size: 12px; color: #94A3B8;">Hiện chưa có bàn đang phục vụ.</span>';

    // Grid rendering
    var filtered = state.tables.filter(function (t) {
      if (state.floorFilter === '1' && t.floor !== 1) return false;
      if (state.floorFilter === '2' && t.floor !== 2) return false;
      if (state.statusFilter !== 'all' && t.status !== state.statusFilter) return false;
      return true;
    });

    var gridHtml = '';
    for (var k = 0; k < filtered.length; k++) {
      var tb = filtered[k];
      var isEmpty = tb.status === 'empty';
      var isOccupied = tb.status === 'occupied';
      var isReserved = tb.status === 'reserved';
      var isSource = state.sourceTableId === tb.id;

      var cardCls = 'pos-table-card ' + (isOccupied ? 'is-occupied' : (isReserved ? 'is-reserved' : 'is-empty')) + (isSource ? ' is-source' : '');
      var badgeCls = 'pos-badge ' + (isOccupied ? 'is-occupied' : (isReserved ? 'is-reserved' : 'is-empty'));
      var dotCol = isOccupied ? '#EF4444' : (isReserved ? '#F59E0B' : '#10B981');
      var badgeText = isOccupied ? 'Có khách' : (isReserved ? 'Đã đặt' : 'Trống');
      var zoneShort = tb.floor === 1 ? 'T1' : 'T2 VIP';

      var ctaCls = 'pos-card-cta ' + (isOccupied ? 'is-occupied' : (isReserved ? 'is-reserved' : 'is-empty'));
      var actionLabel = isOccupied ? 'Gọi món / Thanh toán' : (isReserved ? 'Nhận bàn' : 'Mở bàn');

      if (state.actionMode === 'transfer') {
        if (!state.sourceTableId && isOccupied) actionLabel = 'Chọn làm bàn nguồn';
        else if (state.sourceTableId && isEmpty) actionLabel = 'Chuyển khách vào đây';
        else if (isSource) actionLabel = 'Đang chọn (Bấm hủy)';
      } else if (state.actionMode === 'merge' && isOccupied) {
        actionLabel = isSource ? 'Nguồn gộp (Bấm hủy)' : (state.sourceTableId ? 'Gộp bill vào bàn này' : 'Chọn bàn để gộp');
      } else if (state.actionMode === 'split') {
        if (!state.sourceTableId && isOccupied) actionLabel = 'Chọn bàn cần tách';
        else if (state.sourceTableId && isEmpty) actionLabel = 'Tách sang bàn này';
      }

      var bodyHtml = '';
      if (isEmpty) {
        bodyHtml =
          '<div class="pos-card-body is-empty">' +
          '<div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">' +
          '<span style="display: inline-flex; align-items: center; gap: 6px; font-size: 14.5px; font-weight: 700; color: #E2E8F0;">' +
          '<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#6EE7B7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
          '<path d="M16 21V19A4 4 0 0 0 12 15H6A4 4 0 0 0 2 19V21"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21V19A4 4 0 0 0 19 15.13"></path>' +
          '</svg><span>' + tb.seats + ' Ghế</span></span>' +
          '<span style="font-size: 11px; font-weight: 600; color: #6EE7B7;">Sẵn sàng</span></div>' +
          '<span style="font-size: 12px; color: #94A3B8; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">' + escapeHtml(tb.note) + '</span>' +
          '</div>';
      } else if (isOccupied) {
        bodyHtml =
          '<div class="pos-card-body is-occupied">' +
          '<div style="display: flex; align-items: center; justify-content: space-between; gap: 6px; font-size: 12px; color: #94A3B8;">' +
          '<span style="white-space: nowrap;">' + tb.durationMin + ' phút · ' + tb.guestsCount + '/' + tb.seats + ' khách</span>' +
          '<span style="color: #94A3B8; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">' + escapeHtml(shortStaff(tb.staff)) + '</span></div>' +
          '<div style="display: flex; align-items: baseline; justify-content: space-between; gap: 8px; padding-top: 2px; border-top: 1px dashed rgba(148, 163, 184, 0.16);">' +
          '<span style="font-size: 11.5px; font-weight: 600; color: #94A3B8;">Tạm tính</span>' +
          '<span style="font-family: \'JetBrains Mono\', monospace; font-size: 18px; font-weight: 800; color: #FBBF24; white-space: nowrap;">' + formatVnd(tb.bill) + '</span>' +
          '</div></div>';
      } else {
        bodyHtml =
          '<div class="pos-card-body is-reserved">' +
          '<div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">' +
          '<span style="font-size: 13px; font-weight: 700; color: #FDE68A;">Đặt ' + escapeHtml(tb.reserveTime || '19:30') + ' · ' + tb.seats + ' Ghế</span>' +
          '<span style="font-size: 12px; font-weight: 600; color: #94A3B8;">' + tb.guestsCount + ' khách</span></div>' +
          '<span style="font-size: 12px; color: #94A3B8; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">' + escapeHtml(tb.note) + '</span>' +
          '</div>';
      }

      var ctaTagStart = (!state.actionMode && isOccupied)
        ? '<a href="' + POS_ORDER_URL + tb.id + '" class="' + ctaCls + '">'
        : '<button type="button" class="' + ctaCls + '" data-table-id="' + tb.id + '">';
      var ctaTagEnd = (!state.actionMode && isOccupied) ? '</a>' : '</button>';

      gridHtml +=
        '<article class="' + cardCls + '">' +
        '<div class="pos-card-head">' +
        '<div class="pos-card-title-wrap">' +
        '<span class="pos-table-name">' + escapeHtml(tb.name) + '</span>' +
        '<span class="pos-zone-chip">' + zoneShort + '</span>' +
        '</div>' +
        '<span class="' + badgeCls + '"><span class="pos-badge-dot" style="background-color: ' + dotCol + ';"></span><span>' + badgeText + '</span></span>' +
        '</div>' +
        bodyHtml +
        ctaTagStart +
        '<span>' + escapeHtml(actionLabel) + '</span>' +
        '<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
        '<path d="M5 12H19"></path><path d="M13 6L19 12L13 18"></path></svg>' +
        ctaTagEnd + '</article>';
    }

    document.getElementById('pos-table-grid').innerHTML = gridHtml;
  }

  // Event Bindings
  document.addEventListener('DOMContentLoaded', function () {
    if (window.location.search) {
      var params = new URLSearchParams(window.location.search);
      var paidId = parseInt(params.get('paidTableId') || '', 10);
      var paidAmount = parseInt(params.get('paidAmount') || '', 10);
      if (paidId) {
        var paidTb = findTable(paidId);
        if (paidTb) {
          var settledAmt = paidAmount > 0 ? paidAmount : paidTb.bill;
          state.settledShiftRevenue += settledAmt;
          paidTb.status = 'empty';
          paidTb.durationMin = 0;
          paidTb.bill = 0;
          paidTb.guestsCount = 0;
          paidTb.staff = '';
          paidTb.note = 'Vừa thanh toán · Đã dọn bàn';
          state.bannerMsg = 'Đã thanh toán ' + formatVnd(settledAmt) + ' và trả ' + paidTb.name + ' về trạng thái Trống.';
        }
        if (window.history && window.history.replaceState) {
          window.history.replaceState({}, document.title, window.location.pathname);
        }
      }
    }

    updateClock();
    setInterval(updateClock, 1000);
    renderAll();

    // Floor filter tabs
    var floorTabs = document.querySelectorAll('.pos-floor-tab');
    for (var i = 0; i < floorTabs.length; i++) {
      floorTabs[i].addEventListener('click', function () {
        for (var j = 0; j < floorTabs.length; j++) floorTabs[j].classList.remove('is-active');
        this.classList.add('is-active');
        state.floorFilter = this.getAttribute('data-floor');
        renderAll();
      });
    }

    // Status filter pills
    var statusPills = document.querySelectorAll('.pos-status-pill');
    for (var s = 0; s < statusPills.length; s++) {
      statusPills[s].addEventListener('click', function () {
        for (var j = 0; j < statusPills.length; j++) statusPills[j].classList.remove('is-active');
        this.classList.add('is-active');
        state.statusFilter = this.getAttribute('data-status');
        renderAll();
      });
    }

    // Grid card click delegation
    document.getElementById('pos-table-grid').addEventListener('click', function (e) {
      var btn = e.target.closest('[data-table-id]');
      if (!btn) return;
      handleCardClick(parseInt(btn.getAttribute('data-table-id'), 10));
    });

    // Top active tables click delegation
    document.getElementById('pos-top-active').addEventListener('click', function (e) {
      var btn = e.target.closest('[data-inspect-id]');
      if (!btn) return;
      var tb = findTable(parseInt(btn.getAttribute('data-inspect-id'), 10));
      if (tb) openOrderModal(tb);
    });

    // Banner buttons
    document.getElementById('pos-dismiss-banner-btn').addEventListener('click', function () {
      state.bannerMsg = '';
      state.actionMode = null;
      state.sourceTableId = null;
      renderAll();
    });
    document.getElementById('pos-cancel-mode-btn').addEventListener('click', function () {
      state.actionMode = null;
      state.sourceTableId = null;
      state.bannerMsg = '';
      renderAll();
    });

    // Sidebar 2.4 Mode toggles
    document.getElementById('btn-mode-transfer').addEventListener('click', function () {
      state.actionMode = state.actionMode === 'transfer' ? null : 'transfer';
      state.sourceTableId = null;
      state.bannerMsg = state.actionMode ? 'Chế độ Chuyển bàn: Chọn một bàn ĐANG CÓ KHÁCH làm nguồn, sau đó chọn BÀN TRỐNG đích.' : '';
      renderAll();
    });
    document.getElementById('btn-mode-merge').addEventListener('click', function () {
      state.actionMode = state.actionMode === 'merge' ? null : 'merge';
      state.sourceTableId = null;
      state.bannerMsg = state.actionMode ? 'Chế độ Gộp bàn: Chọn bàn thứ 1 rồi chọn bàn thứ 2 (cùng đang có khách) để gộp hóa đơn.' : '';
      renderAll();
    });
    document.getElementById('btn-mode-split').addEventListener('click', function () {
      state.actionMode = state.actionMode === 'split' ? null : 'split';
      state.sourceTableId = null;
      state.bannerMsg = state.actionMode ? 'Chế độ Tách bàn: Chọn bàn ĐANG CÓ KHÁCH (>= 2 người) rồi chọn BÀN TRỐNG để tách sang.' : '';
      renderAll();
    });

    // Open-table Modal controls
    var presetBtns = document.querySelectorAll('.pos-preset-btn');
    for (var p = 0; p < presetBtns.length; p++) {
      presetBtns[p].addEventListener('click', function () {
        state.openGuestsCount = parseInt(this.getAttribute('data-guests'), 10);
        syncGuestPresetUI();
      });
    }
    document.getElementById('open-guests-dec').addEventListener('click', function () {
      state.openGuestsCount = Math.max(1, state.openGuestsCount - 1);
      syncGuestPresetUI();
    });
    document.getElementById('open-guests-inc').addEventListener('click', function () {
      state.openGuestsCount = Math.min(16, state.openGuestsCount + 1);
      syncGuestPresetUI();
    });
    document.getElementById('open-modal-close-x').addEventListener('click', closeOpenModal);
    document.getElementById('open-modal-cancel').addEventListener('click', closeOpenModal);
    document.getElementById('pos-open-modal').addEventListener('click', function (e) {
      if (e.target === this) closeOpenModal();
    });

    document.getElementById('open-modal-confirm').addEventListener('click', function () {
      var tb = findTable(state.openModalTableId);
      if (!tb) return;
      var staff = document.getElementById('pos-staff-select').value;
      var note = document.getElementById('pos-open-note').value.trim();
      tb.status = 'occupied';
      tb.durationMin = 1;
      tb.bill = 0;
      tb.guestsCount = state.openGuestsCount;
      tb.staff = staff;
      tb.note = note || 'Mới mở bàn · Chờ gọi món';
      closeOpenModal();
      state.bannerMsg = 'Đã mở ' + tb.name + ' (' + tb.guestsCount + ' khách · NV: ' + staff + '). Sẵn sàng chuyển sang màn hình Gọi món.';
      renderAll();
    });

    // Order/Payment Modal controls
    document.getElementById('order-modal-close-x').addEventListener('click', closeOrderModal);
    document.getElementById('pos-order-modal').addEventListener('click', function (e) {
      if (e.target === this) closeOrderModal();
    });
    document.getElementById('order-add-dish-btn').addEventListener('click', function () {
      if (!state.orderModalTableId) return;
      window.location.href = POS_ORDER_URL + encodeURIComponent(state.orderModalTableId);
    });
    document.getElementById('order-settle-btn').addEventListener('click', function () {
      var tb = findTable(state.orderModalTableId);
      if (!tb) return;
      var paid = tb.bill;
      state.settledShiftRevenue += paid;
      tb.status = 'empty';
      tb.durationMin = 0;
      tb.bill = 0;
      tb.guestsCount = 0;
      tb.staff = '';
      tb.note = 'Vừa thanh toán · Đã dọn bàn';
      closeOrderModal();
      state.bannerMsg = 'Đã thanh toán ' + formatVnd(paid) + ' và trả ' + tb.name + ' về trạng thái Trống.';
      renderAll();
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        closeOpenModal();
        closeOrderModal();
      }
    });
  });
})();
</script>
</body>
</html>
