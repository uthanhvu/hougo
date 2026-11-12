<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HOUGO KITCHEN (KDT) — Điều Phối Bếp &amp; Báo Hết Món</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&amp;family=JetBrains+Mono:wght@500;700;800&amp;family=Playfair+Display:wght@600;700&amp;display=swap">
  <style>
    :root {
      --bg-canvas: #0B1120;
      --bg-surface: #111827;
      --bg-panel: #0F172A;
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
    select {
      font-family: inherit;
    }

    button,
    .kds-back-link {
      transition: transform 0.14s ease, filter 0.14s ease, background-color 0.14s ease, border-color 0.14s ease, box-shadow 0.14s ease;
    }

    button:hover:not(:disabled),
    .kds-back-link:hover {
      filter: brightness(1.08);
    }

    button:active:not(:disabled),
    .kds-back-link:active {
      transform: scale(0.985);
    }

    button:focus-visible,
    a:focus-visible,
    input:focus-visible {
      outline: 2px solid var(--gold);
      outline-offset: 2px;
    }

    input::placeholder {
      color: var(--text-muted);
    }

    @keyframes kdsUrgentPulse {
      0%, 100% {
        box-shadow: 0 0 0 1px rgba(239, 68, 68, 0.55), 0 12px 28px rgba(239, 68, 68, 0.18);
        border-color: rgba(239, 68, 68, 0.92);
      }
      50% {
        box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.25), 0 14px 34px rgba(239, 68, 68, 0.34);
        border-color: #FCA5A5;
      }
    }

    @keyframes kdsLiveDot {
      0%, 100% {
        opacity: 1;
        transform: scale(1);
      }
      50% {
        opacity: 0.4;
        transform: scale(1.25);
      }
    }

    .kds-shell {
      min-height: 100vh;
      width: 100%;
      background-color: var(--bg-canvas);
      display: flex;
      flex-direction: column;
    }

    .kds-topbar {
      background-color: var(--bg-surface);
      border-bottom: 1px solid rgba(245, 158, 11, 0.28);
      padding: 14px 22px;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .kds-topbar-row {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 14px;
    }

    .kds-back-link {
      min-height: 44px;
      padding: 0 15px;
      border-radius: 10px;
      background-color: var(--bg-elevated);
      border: 1px solid rgba(148, 163, 184, 0.3);
      color: #E2E8F0;
      font-size: 13px;
      font-weight: 700;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 7px;
      white-space: nowrap;
    }

    .kds-brand-icon {
      width: 42px;
      height: 42px;
      border-radius: 11px;
      background: linear-gradient(135deg, #B91C1C, #7F1D1D);
      border: 1px solid rgba(251, 191, 36, 0.55);
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .kds-kpi-strip {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      background-color: var(--bg-panel);
      border: 1px solid rgba(245, 158, 11, 0.3);
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-size: 13px;
      color: var(--text-secondary);
      white-space: nowrap;
    }

    .kds-live-dot {
      width: 8px;
      height: 8px;
      border-radius: 999px;
      background-color: var(--emerald);
      display: inline-block;
      animation: kdsLiveDot 1.6s ease-in-out infinite;
    }

    .kds-clock-pill {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      background-color: var(--bg-panel);
      border: 1px solid rgba(148, 163, 184, 0.25);
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }

    .kds-btn-86 {
      min-height: 44px;
      padding: 0 16px;
      border-radius: 10px;
      background-color: var(--crimson-deep);
      border: 1.5px solid rgba(251, 191, 36, 0.65);
      color: #FAF7F2;
      font-size: 13px;
      font-weight: 800;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      white-space: nowrap;
      box-shadow: 0 6px 18px rgba(153, 27, 27, 0.35);
    }

    .tab-scroll {
      display: flex;
      flex-wrap: nowrap;
      align-items: center;
      gap: 8px;
      background-color: var(--bg-panel);
      border: 1px solid rgba(148, 163, 184, 0.18);
      border-radius: 11px;
      padding: 5px;
      white-space: nowrap;
      overflow-x: auto;
      scrollbar-width: none;
    }

    .tab-scroll::-webkit-scrollbar {
      display: none;
    }

    .kds-station-tab {
      flex: 0 0 auto;
      min-height: 44px;
      padding: 0 15px;
      border-radius: 9px;
      font-size: 13px;
      font-weight: 700;
      cursor: pointer;
      white-space: nowrap;
      border: 1px solid transparent;
      background-color: transparent;
      color: var(--text-muted);
    }

    .kds-station-tab.is-active {
      border-color: rgba(245, 158, 11, 0.72);
      background-color: var(--crimson);
      color: var(--gold-soft);
    }

    .kds-sla-legend {
      display: inline-flex;
      align-items: center;
      gap: 12px;
      padding: 6px 12px;
      border-radius: 9px;
      background-color: var(--bg-panel);
      border: 1px solid rgba(148, 163, 184, 0.18);
      font-size: 12px;
      color: var(--text-secondary);
      min-height: 44px;
    }

    .kds-history-btn {
      min-height: 44px;
      padding: 0 14px;
      border-radius: 10px;
      font-size: 12.5px;
      font-weight: 700;
      cursor: pointer;
      white-space: nowrap;
      border: 1px solid rgba(16, 185, 129, 0.45);
      background-color: var(--bg-panel);
      color: #6EE7B7;
    }

    .kds-history-btn.is-active {
      border-color: var(--gold);
      background-color: var(--crimson-deep);
      color: var(--gold-soft);
    }

    .kds-batch-bar {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 8px;
      padding: 9px 13px;
      border-radius: 11px;
      background-color: var(--bg-panel);
      border: 1px solid rgba(245, 158, 11, 0.25);
    }

    .kds-batch-pills {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 8px;
      flex: 1;
      min-width: 0;
    }

    .kds-batch-pill {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      padding: 5px 10px;
      border-radius: 8px;
      background-color: var(--bg-surface);
      border: 1px solid rgba(148, 163, 184, 0.22);
      font-size: 12.5px;
      font-weight: 600;
      color: #E2E8F0;
      white-space: nowrap;
    }

    .kds-batch-qty {
      padding: 2px 7px;
      border-radius: 6px;
      font-family: 'JetBrains Mono', monospace;
      font-size: 13px;
      font-weight: 800;
      background-color: var(--bg-elevated);
      color: #E2E8F0;
      border: 1px solid rgba(148, 163, 184, 0.3);
    }

    .kds-batch-qty.is-multi {
      background-color: var(--gold);
      color: var(--bg-canvas);
      border-color: var(--gold-soft);
    }

    .kds-banner {
      margin: 12px 22px 0;
      padding: 10px 16px;
      border-radius: 10px;
      background-color: rgba(185, 28, 28, 0.25);
      border: 1px solid rgba(245, 158, 11, 0.55);
      display: none;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .kds-banner.is-visible {
      display: flex;
    }

    .kds-main {
      flex: 1;
      padding: 18px 22px 24px;
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    .kds-ticket-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(min(390px, 100%), 1fr));
      gap: 16px;
      align-items: stretch;
    }

    .kds-ticket-card {
      background-color: var(--bg-surface);
      border: 1.5px solid var(--emerald);
      border-radius: 15px;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      box-shadow: 0 12px 26px rgba(2, 6, 23, 0.45);
    }

    .kds-ticket-card.is-warning {
      border-color: var(--gold);
    }

    .kds-ticket-card.is-urgent {
      border-color: var(--red-live);
      animation: kdsUrgentPulse 2.1s ease-in-out infinite;
    }

    .kds-ticket-header {
      padding: 13px 14px;
      background-color: rgba(16, 185, 129, 0.12);
      border-bottom: 1px solid rgba(148, 163, 184, 0.16);
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 10px;
    }

    .kds-ticket-card.is-warning .kds-ticket-header {
      background-color: rgba(245, 158, 11, 0.14);
    }

    .kds-ticket-card.is-urgent .kds-ticket-header {
      background-color: rgba(153, 27, 27, 0.34);
    }

    .kds-sla-badge {
      padding: 3px 9px;
      border-radius: 999px;
      font-size: 11px;
      font-weight: 800;
      background-color: rgba(16, 185, 129, 0.2);
      color: #A7F3D0;
      border: 1px solid rgba(16, 185, 129, 0.55);
    }

    .kds-ticket-card.is-warning .kds-sla-badge {
      background-color: rgba(245, 158, 11, 0.22);
      color: var(--gold-soft);
      border-color: rgba(245, 158, 11, 0.55);
    }

    .kds-ticket-card.is-urgent .kds-sla-badge {
      background-color: rgba(239, 68, 68, 0.28);
      color: #FECACA;
      border-color: rgba(239, 68, 68, 0.65);
    }

    .kds-timer-text {
      font-family: 'JetBrains Mono', monospace;
      font-size: 20px;
      font-weight: 800;
      color: #6EE7B7;
    }

    .kds-ticket-card.is-warning .kds-timer-text {
      color: var(--gold-bright);
    }

    .kds-ticket-card.is-urgent .kds-timer-text {
      color: #FCA5A5;
    }

    .kds-ticket-items {
      flex: 1;
      padding: 12px 14px;
      display: flex;
      flex-direction: column;
      gap: 9px;
    }

    .kds-dish-row {
      width: 100%;
      padding: 10px 11px;
      border-radius: 11px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      cursor: pointer;
      background-color: var(--bg-panel);
      border: 1px solid rgba(148, 163, 184, 0.24);
      text-align: left;
    }

    .kds-dish-row.is-done {
      background-color: rgba(15, 23, 42, 0.5);
      border-color: rgba(148, 163, 184, 0.14);
    }

    .kds-dish-row.is-out86 {
      border-color: rgba(239, 68, 68, 0.55);
    }

    .kds-qty-badge {
      font-family: 'JetBrains Mono', monospace;
      min-width: 44px;
      min-height: 36px;
      padding: 0 7px;
      border-radius: 8px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      font-weight: 800;
      font-size: 15px;
      background-color: var(--bg-elevated);
      border: 1.5px solid #475569;
      color: var(--text-primary);
    }

    .kds-qty-badge.is-multi {
      font-size: 17px;
      background-color: var(--gold);
      border-color: var(--gold-soft);
      color: var(--bg-canvas);
      box-shadow: 0 4px 12px rgba(245, 158, 11, 0.28);
    }

    .kds-dish-row.is-done .kds-qty-badge {
      background-color: var(--bg-panel);
      border-color: rgba(148, 163, 184, 0.22);
      color: #64748B;
      box-shadow: none;
    }

    .kds-dish-name {
      font-size: 14px;
      font-weight: 700;
      line-height: 1.3;
      color: var(--text-primary);
    }

    .kds-dish-row.is-done .kds-dish-name {
      color: #64748B;
      text-decoration: line-through;
    }

    .kds-done-pill {
      min-height: 44px;
      min-width: 96px;
      padding: 0 16px;
      border-radius: 9px;
      font-size: 13px;
      font-weight: 800;
      white-space: nowrap;
      flex-shrink: 0;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border: 1.5px solid var(--emerald);
      background-color: #065F46;
      color: #ECFDF5;
    }

    .kds-dish-row.is-done .kds-done-pill {
      border-color: rgba(148, 163, 184, 0.28);
      background-color: var(--bg-elevated);
      color: var(--text-secondary);
    }

    .kds-ticket-footer {
      padding: 12px 14px 14px;
      border-top: 1px solid rgba(148, 163, 184, 0.16);
      background-color: var(--bg-panel);
      border-radius: 0 0 14px 14px;
      display: flex;
      flex-direction: column;
      gap: 9px;
    }

    .kds-bump-btn {
      min-height: 46px;
      width: 100%;
      padding: 0 16px;
      border-radius: 10px;
      font-size: 13.5px;
      font-weight: 800;
      letter-spacing: 0.03em;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      border: 1.5px solid #334155;
      background-color: var(--bg-elevated);
      color: var(--text-secondary);
    }

    .kds-bump-btn.is-ready {
      border-color: #34D399;
      background-color: var(--emerald);
      color: #022C22;
      box-shadow: 0 6px 18px rgba(16, 185, 129, 0.3);
    }

    .kds-history-panel {
      background-color: var(--bg-surface);
      border: 1px solid rgba(16, 185, 129, 0.35);
      border-radius: 16px;
      padding: 20px;
      display: flex;
      flex-direction: column;
      gap: 14px;
    }

    .kds-history-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(min(320px, 100%), 1fr));
      gap: 12px;
    }

    .kds-modal-backdrop {
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

    .kds-modal-backdrop.is-open {
      display: flex;
    }

    @media (max-width: 1060px) {
      .kds-topbar {
        padding: 12px 14px;
        gap: 10px;
      }
      .kds-main {
        padding: 14px 14px 20px;
      }
      .kds-ticket-grid {
        gap: 12px;
      }
      .kds-batch-bar {
        flex-wrap: nowrap;
      }
      .kds-batch-pills {
        flex-wrap: nowrap;
        overflow-x: auto;
        white-space: nowrap;
        scrollbar-width: none;
      }
      .kds-batch-pills::-webkit-scrollbar {
        display: none;
      }
    }
  </style>
</head>
<body>
<div class="kds-shell">

  <!-- TOPBAR -->
  <header class="kds-topbar">
    <div class="kds-topbar-row">
      <div style="display: flex; align-items: center; gap: 14px; flex-wrap: wrap;">
        <a href="${pageContext.request.contextPath}/pos" class="kds-back-link">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M19 12H5"></path>
            <path d="M12 19L5 12L12 5"></path>
          </svg>
          <span>Về Sơ đồ bàn POS</span>
        </a>

        <div style="display: flex; align-items: center; gap: 11px;">
          <div class="kds-brand-icon">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FDE68A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M12 2C12 2 17 6.5 17 11.5A5 5 0 1 1 7 11.5C7 9.5 8 7.5 9.5 6C9.5 6 10 8 11.5 8C11.5 6 12 2 12 2Z"></path>
            </svg>
          </div>
          <div style="display: flex; flex-direction: column; gap: 2px;">
            <span style="font-size: 17px; font-weight: 800; letter-spacing: 0.04em; color: #FAF7F2;">HOUGO KITCHEN <span style="color: #FBBF24;">(KDT)</span></span>
            <span style="font-size: 12px; color: #94A3B8;">Điều phối Bếp Nóng &amp; Quầy Bar theo SLA thực tế</span>
          </div>
        </div>
      </div>

      <!-- KPIs, Live Clock & 86 List Modal Trigger -->
      <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 10px;">
        <div class="kds-kpi-strip">
          <span class="kds-live-dot"></span>
          <span>Đang chờ: <strong id="kds-pending-count" style="font-family: 'JetBrains Mono', monospace; color: #FBBF24;">0 dòng món (0 phần)</strong></span>
          <span style="color: #475569;">|</span>
          <span>Thời gian ra món TB: <strong style="font-family: 'JetBrains Mono', monospace; color: #6EE7B7;">06:45</strong></span>
          <span style="color: #475569;">|</span>
          <span>Hết món hôm nay: <strong id="kds-86-count" style="font-family: 'JetBrains Mono', monospace; color: #FCA5A5;">0</strong></span>
        </div>

        <div class="kds-clock-pill">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <circle cx="12" cy="12" r="10"></circle>
            <path d="M12 6V12L16 14"></path>
          </svg>
          <span id="kds-live-clock" style="font-family: 'JetBrains Mono', monospace; font-size: 16px; font-weight: 800; color: #F8FAFC; letter-spacing: 0.04em;">--:--:--</span>
        </div>

        <button type="button" id="btn-open-86" class="kds-btn-86">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FDE68A" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M10.29 3.86L1.82 18A2 2 0 0 0 3.53 21H20.47A2 2 0 0 0 22.18 18L13.71 3.86A2 2 0 0 0 10.29 3.86Z"></path>
            <path d="M12 9V13"></path>
            <path d="M12 17H12.01"></path>
          </svg>
          <span>Quản lý Báo hết món (86 List)</span>
        </button>

        <a href="${pageContext.request.contextPath}/login" style="min-height: 44px; padding: 0 13px; border-radius: 10px; background-color: rgba(153, 27, 27, 0.35); border: 1px solid rgba(248, 113, 113, 0.55); color: #FECACA; font-size: 12.5px; font-weight: 700; display: inline-flex; align-items: center; gap: 6px; white-space: nowrap;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M9 21H5C3.9 21 3 20.1 3 19V5C3 3.9 3.9 3 5 3H9"></path>
            <polyline points="16 17 21 12 16 7"></polyline>
            <line x1="21" y1="12" x2="9" y2="12"></line>
          </svg>
          <span>Đăng xuất</span>
        </a>
      </div>
    </div>

    <!-- Station Tabs & SLA Legend Row -->
    <div class="kds-topbar-row">
      <nav id="kds-station-tabs" aria-label="Bộ lọc trạm chế biến" class="tab-scroll"></nav>

      <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 10px;">
        <div class="kds-sla-legend">
          <span style="display: inline-flex; align-items: center; gap: 5px;"><span style="width: 9px; height: 9px; border-radius: 999px; background-color: #10B981; display: inline-block;"></span>&lt; 5p Mới nhận</span>
          <span style="display: inline-flex; align-items: center; gap: 5px;"><span style="width: 9px; height: 9px; border-radius: 999px; background-color: #F59E0B; display: inline-block;"></span>5-12p Đang chuẩn bị</span>
          <span style="display: inline-flex; align-items: center; gap: 5px;"><span style="width: 9px; height: 9px; border-radius: 999px; background-color: #EF4444; display: inline-block;"></span>&gt; 12p Gấp / Trễ</span>
        </div>

        <button type="button" id="btn-toggle-history" class="kds-history-btn">Đã hoàn thành (0)</button>
      </div>
    </div>

    <!-- Batch Summary Bar -->
    <div class="kds-batch-bar">
      <span style="display: inline-flex; align-items: center; gap: 6px; font-size: 12px; font-weight: 800; color: #FDE68A; letter-spacing: 0.02em; white-space: nowrap; flex-shrink: 0;">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <path d="M4 6H20"></path>
          <path d="M4 12H16"></path>
          <path d="M4 18H12"></path>
        </svg>
        <span id="kds-batch-label">Tổng cần làm (0 phần):</span>
      </span>

      <div id="kds-batch-pills" class="kds-batch-pills"></div>
    </div>
  </header>

  <!-- Feedback Banner -->
  <div id="kds-banner" class="kds-banner" role="status" aria-live="polite">
    <div style="display: flex; align-items: center; gap: 9px; font-size: 13px; font-weight: 600; color: #F8FAFC;">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <circle cx="12" cy="12" r="10"></circle>
        <path d="M12 16V12"></path>
        <path d="M12 8H12.01"></path>
      </svg>
      <span id="kds-banner-msg"></span>
    </div>
    <button type="button" id="kds-banner-dismiss" style="min-height: 36px; padding: 0 12px; border-radius: 8px; background-color: #0F172A; border: 1px solid rgba(255, 255, 255, 0.2); color: #CBD5E1; font-size: 12px; font-weight: 600; cursor: pointer;">Đóng</button>
  </div>

  <!-- MAIN WORKSPACE -->
  <main class="kds-main">
    <div id="kds-ticket-grid" class="kds-ticket-grid"></div>

    <section id="kds-history-panel" class="kds-history-panel" style="display: none;">
      <div style="display: flex; align-items: center; justify-content: space-between; gap: 12px; flex-wrap: wrap;">
        <div>
          <h2 id="kds-history-title" style="margin: 0; font-size: 18px; font-weight: 800; color: #FAF7F2;">Lịch Sử Phiếu Đã Ra Món (0)</h2>
          <span style="font-size: 12.5px; color: #94A3B8;">Bấm "Khôi phục" nếu cần đưa phiếu quay lại màn hình bếp.</span>
        </div>
        <button type="button" id="btn-back-to-active" style="min-height: 44px; padding: 0 16px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(245, 158, 11, 0.45); color: #FDE68A; font-size: 13px; font-weight: 700; cursor: pointer;">Quay lại Phiếu Đang Chờ</button>
      </div>
      <div id="kds-history-grid" class="kds-history-grid"></div>
    </section>
  </main>

  <!-- 86 LIST MODAL (3.2) -->
  <div id="kds-86-modal" class="kds-modal-backdrop" role="dialog" aria-modal="true" aria-labelledby="kds-86-title">
    <div style="width: 100%; max-width: 620px; background-color: #111827; border: 1px solid rgba(251, 191, 36, 0.45); border-radius: 18px; padding: 24px; box-shadow: 0 28px 64px rgba(0, 0, 0, 0.7); display: flex; flex-direction: column; gap: 16px;">
      <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px;">
        <div style="display: flex; flex-direction: column; gap: 3px;">
          <span style="font-size: 11.5px; font-weight: 700; letter-spacing: 0.16em; color: #FCA5A5;">KIỂM SOÁT NGUYÊN LIỆU BẾP (3.2)</span>
          <h2 id="kds-86-title" style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 24px; font-weight: 700; color: #FAF7F2;">Quản Lý Báo Hết Món (86 List)</h2>
          <span style="font-size: 13px; color: #94A3B8;">Bật/tắt để khóa gọi món trên POS ngay khi hết nguyên liệu.</span>
        </div>
        <button type="button" id="btn-close-86-x" aria-label="Đóng quản lý báo hết món" style="min-width: 44px; min-height: 44px; border-radius: 10px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.25); color: #E2E8F0; cursor: pointer; display: inline-flex; align-items: center; justify-content: center;">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M18 6L6 18"></path>
            <path d="M6 6L18 18"></path>
          </svg>
        </button>
      </div>

      <input type="search" id="kds-86-search" aria-label="Tìm món cần khóa hoặc mở bán" placeholder="Tìm tên món hoặc nguyên liệu (Sò điệp, Wagyu, Tôm...)" style="min-height: 44px; width: 100%; padding: 0 14px; border-radius: 10px; border: 1px solid rgba(148, 163, 184, 0.28); background-color: #0F172A; color: #F8FAFC; font-size: 13.5px;">

      <div id="kds-86-list" style="max-height: 360px; overflow-y: auto; display: flex; flex-direction: column; gap: 8px;"></div>

      <div style="display: flex; align-items: center; justify-content: space-between; padding-top: 6px; border-top: 1px solid rgba(148, 163, 184, 0.16);">
        <span style="font-size: 13px; color: #CBD5E1;">Đang khóa hôm nay: <strong id="kds-86-modal-count" style="color: #FCA5A5;">0 món</strong></span>
        <button type="button" id="btn-close-86-done" style="min-height: 44px; padding: 0 22px; border-radius: 10px; background-color: #B91C1C; border: 1px solid rgba(251, 191, 36, 0.55); color: #FFFFFF; font-size: 14px; font-weight: 700; cursor: pointer;">Hoàn tất &amp; Đóng</button>
      </div>
    </div>
  </div>

</div>

<script>
(function () {
  function pad2(n) {
    return n < 10 ? '0' + n : String(n);
  }

  function formatTimer(totalSec) {
    var s = Math.max(0, Math.floor(totalSec));
    return pad2(Math.floor(s / 60)) + ':' + pad2(s % 60);
  }

  function formatClock(ms) {
    var d = new Date(ms);
    return pad2(d.getHours()) + ':' + pad2(d.getMinutes()) + ':' + pad2(d.getSeconds());
  }

  function escapeHtml(str) {
    return String(str || '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  var STATIONS = [
    { id: 'all', label: 'Tất cả phiếu' },
    { id: 'broth_meat', label: 'Bếp Nước Lẩu & Thịt' },
    { id: 'seafood_veg', label: 'Quầy Hải Sản & Rau' },
    { id: 'bar', label: 'Quầy Bar / Đồ Uống' }
  ];

  var INITIAL_TICKETS = [
    {
      id: 'ord-011',
      tableName: 'BÀN 11',
      zone: 'VIP - T2',
      orderCode: '#ORD-011',
      staff: 'Minh',
      baseSec: 14 * 60 + 32,
      items: [
        { id: 't11-1', name: 'Nước Lẩu Tứ Xuyên Mala', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Cay cấp 2, không hoa tiêu', done: false },
        { id: 't11-2', name: 'Bò Wagyu Nhật A5 (150g)', qty: 2, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Thái lát mỏng, tách 2 khay', done: false },
        { id: 't11-3', name: 'Tôm Sú & Mực Hoa Tươi', qty: 1, station: 'seafood_veg', stationShort: 'Hải sản & Rau', note: 'Ưu tiên lên trước', done: false }
      ]
    },
    {
      id: 'ord-009',
      tableName: 'BÀN 09',
      zone: 'VIP - T2',
      orderCode: '#ORD-009',
      staff: 'Linh',
      baseSec: 12 * 60 + 54,
      items: [
        { id: 't9-1', name: 'Bò Wagyu Nhật A5 (150g)', qty: 2, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Bàn VIP đang đợi', done: false },
        { id: 't9-2', name: 'Nước Lẩu Tứ Xuyên Mala', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Ít dầu ớt', done: false },
        { id: 't9-3', name: 'Tôm Sú & Mực Hoa Tươi', qty: 1, station: 'seafood_veg', stationShort: 'Hải sản & Rau', note: 'Bỏ đầu tôm', done: false }
      ]
    },
    {
      id: 'ord-002',
      tableName: 'BÀN 02',
      zone: 'T1',
      orderCode: '#ORD-002',
      staff: 'Minh',
      baseSec: 8 * 60 + 15,
      items: [
        { id: 't2-1', name: 'Nước Lẩu Tứ Xuyên Mala', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Ít cay', done: false },
        { id: 't2-2', name: 'Tháp Bò Mỹ Thượng Hạng', qty: 2, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Khay lớn', done: false },
        { id: 't2-3', name: 'Trà Đào Cam Sả', qty: 2, station: 'bar', stationShort: 'Quầy Bar', note: 'Ít đá, ít đường', done: false }
      ]
    },
    {
      id: 'ord-006',
      tableName: 'BÀN 06',
      zone: 'T1',
      orderCode: '#ORD-006',
      staff: 'Nam',
      baseSec: 6 * 60 + 40,
      items: [
        { id: 't6-1', name: 'Nước Lẩu Cà Chua Collagen', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Không hành', done: true },
        { id: 't6-2', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', qty: 2, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: '', done: true }
      ]
    },
    {
      id: 'ord-003',
      tableName: 'BÀN 03',
      zone: 'T1',
      orderCode: '#ORD-003',
      staff: 'Lan',
      baseSec: 4 * 60 + 18,
      items: [
        { id: 't3-1', name: 'Nước Lẩu Tomyum Hải Sản', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Ít cay', done: true },
        { id: 't3-2', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', qty: 3, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: 'Thái mỏng, ít mỡ', done: false },
        { id: 't3-3', name: 'Trà Bí Đao Hạt Chia (Bình)', qty: 1, station: 'bar', stationShort: 'Quầy Bar', note: 'Ít đá, thêm 4 ly', done: false }
      ]
    },
    {
      id: 'ord-013',
      tableName: 'BÀN 13',
      zone: 'T2',
      orderCode: '#ORD-013',
      staff: 'Lan',
      baseSec: 1 * 60 + 52,
      items: [
        { id: 't13-1', name: 'Tháp Rau Nấm & Váng Đậu', qty: 2, station: 'seafood_veg', stationShort: 'Hải sản & Rau', note: 'Rửa kỹ, làm sạch', done: false },
        { id: 't13-2', name: 'Tháp Bò Mỹ Thượng Hạng', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: '', done: false },
        { id: 't13-3', name: 'Trà Đào Cam Sả', qty: 2, station: 'bar', stationShort: 'Quầy Bar', note: 'Không đường', done: false }
      ]
    }
  ];

  var INITIAL_HISTORY = [
    {
      id: 'ord-008',
      tableName: 'BÀN 08',
      zone: 'T1',
      orderCode: '#ORD-008',
      staff: 'Nam',
      baseSec: 320,
      finishedAt: '10:02:14',
      summary: 'Combo 269K · Lẩu Nấm Dưỡng Sinh · Đã lên đủ 4 món',
      items: [
        { id: 'h8-1', name: 'Nước Lẩu Nấm Dưỡng Sinh', qty: 1, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: '', done: true }
      ]
    },
    {
      id: 'ord-001',
      tableName: 'BÀN 01',
      zone: 'T1',
      orderCode: '#ORD-001',
      staff: 'Minh',
      baseSec: 410,
      finishedAt: '09:54:08',
      summary: 'Thịt Bò Mỹ & Trà Bí Đao · Đã lên đủ 3 món',
      items: [
        { id: 'h1-1', name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', qty: 2, station: 'broth_meat', stationShort: 'Lẩu & Thịt', note: '', done: true }
      ]
    }
  ];

  var STORAGE_86_KEY = 'hougo_86_dishes_v1';
  var DEFAULT_KDS_86 = ['Đĩa Hải Sản Tươi Tổng Hợp', 'Sò điệp Nhật Hokkaido', 'Tôm càng xanh size lớn'];

  var BASE_86_CATALOG = [
    { name: 'Đĩa Hải Sản Tươi Tổng Hợp', stationLabel: 'Quầy Hải Sản & Rau' },
    { name: 'Tôm Sú & Mực Hoa Tươi', stationLabel: 'Quầy Hải Sản & Rau' },
    { name: 'Sò điệp Nhật Hokkaido', stationLabel: 'Quầy Hải Sản & Rau' },
    { name: 'Tôm càng xanh size lớn', stationLabel: 'Quầy Hải Sản & Rau' },
    { name: 'Bò Wagyu Nhật A5 (150g)', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Ba Chỉ Bò Mỹ Nhúng Lẩu', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Tháp Bò Mỹ Thượng Hạng', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Nước Lẩu Tứ Xuyên Mala', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Nước Lẩu Tomyum Hải Sản', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Nước Lẩu Nấm Dưỡng Sinh', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Nước Lẩu Cà Chua Collagen', stationLabel: 'Bếp Nước Lẩu & Thịt' },
    { name: 'Combo Buffet Hougo 269K', stationLabel: 'Bếp Tổng Hợp' },
    { name: 'Combo Buffet Thượng Hạng 329K', stationLabel: 'Bếp Tổng Hợp' },
    { name: 'Tháp Rau Nấm & Váng Đậu', stationLabel: 'Quầy Hải Sản & Rau' },
    { name: 'Trà Bí Đao Hạt Chia (Bình)', stationLabel: 'Quầy Bar / Đồ Uống' },
    { name: 'Trà Đào Cam Sả', stationLabel: 'Quầy Bar / Đồ Uống' }
  ];

  function loadInitialKds86() {
    try {
      var raw = window.localStorage.getItem(STORAGE_86_KEY);
      if (!raw) return DEFAULT_KDS_86.slice();
      var parsed = JSON.parse(raw);
      return Array.isArray(parsed) ? parsed : DEFAULT_KDS_86.slice();
    } catch (e) {
      return DEFAULT_KDS_86.slice();
    }
  }

  function saveKds86(names) {
    try {
      window.localStorage.setItem(STORAGE_86_KEY, JSON.stringify(names));
    } catch (e) {}
  }

  var state = {
    stationFilter: 'all',
    viewMode: 'active',
    tickets: INITIAL_TICKETS,
    completed: INITIAL_HISTORY,
    outOfStockNames: loadInitialKds86(),
    search86Query: '',
    tickOffset: 0,
    bannerMsg: ''
  };

  function getFilteredTickets() {
    if (state.stationFilter === 'all') return state.tickets;
    return state.tickets.filter(function (tk) {
      return tk.items.some(function (it) {
        return it.station === state.stationFilter;
      });
    });
  }

  function getSlaTier(elapsedSec) {
    var mins = elapsedSec / 60;
    if (mins >= 12) {
      return { tierClass: 'is-urgent', label: 'Gấp / Trễ' };
    }
    if (mins >= 5) {
      return { tierClass: 'is-warning', label: 'Đang chuẩn bị' };
    }
    return { tierClass: 'is-new', label: 'Mới nhận' };
  }

  function renderClockAndTimers() {
    document.getElementById('kds-live-clock').textContent = formatClock(Date.now());
    for (var i = 0; i < state.tickets.length; i++) {
      var tk = state.tickets[i];
      var elapsedSec = tk.baseSec + state.tickOffset;
      var sla = getSlaTier(elapsedSec);

      var card = document.querySelector('[data-ticket-card="' + tk.id + '"]');
      if (card) {
        card.classList.remove('is-new', 'is-warning', 'is-urgent');
        card.classList.add(sla.tierClass);
      }

      var badgeEl = document.querySelector('[data-ticket-badge="' + tk.id + '"]');
      if (badgeEl) badgeEl.textContent = sla.label;

      var timerEl = document.querySelector('[data-ticket-timer="' + tk.id + '"]');
      if (timerEl) timerEl.textContent = formatTimer(elapsedSec);
    }
  }

  function renderBanner() {
    var banner = document.getElementById('kds-banner');
    var msgEl = document.getElementById('kds-banner-msg');
    if (state.bannerMsg) {
      msgEl.textContent = state.bannerMsg;
      banner.classList.add('is-visible');
    } else {
      banner.classList.remove('is-visible');
    }
  }

  function computePendingSummary() {
    var filtered = getFilteredTickets();
    var lineCount = 0;
    var portionCount = 0;
    var map = {};
    for (var i = 0; i < filtered.length; i++) {
      var tk = filtered[i];
      for (var j = 0; j < tk.items.length; j++) {
        var it = tk.items[j];
        if (state.stationFilter !== 'all' && it.station !== state.stationFilter) continue;
        if (it.done) continue;
        lineCount += 1;
        portionCount += it.qty;
        if (!map[it.name]) {
          map[it.name] = { name: it.name, qty: 0 };
        }
        map[it.name].qty += it.qty;
      }
    }
    var list = Object.keys(map).map(function (k) { return map[k]; });
    list.sort(function (a, b) {
      if (b.qty !== a.qty) return b.qty - a.qty;
      return a.name.localeCompare(b.name);
    });
    return {
      lineCount: lineCount,
      portionCount: portionCount,
      list: list
    };
  }

  function renderHeaderStatsAndTabs() {
    var pending = computePendingSummary();
    document.getElementById('kds-pending-count').textContent = pending.lineCount + ' dòng món (' + pending.portionCount + ' phần)';
    document.getElementById('kds-86-count').textContent = String(state.outOfStockNames.length);
    document.getElementById('kds-86-modal-count').textContent = state.outOfStockNames.length + ' món';

    var tabsHtml = '';
    for (var sIdx = 0; sIdx < STATIONS.length; sIdx++) {
      var st = STATIONS[sIdx];
      var isSelected = state.stationFilter === st.id;
      var label = st.id === 'all' ? ('Tất cả phiếu (' + state.tickets.length + ')') : st.label;
      tabsHtml +=
        '<button type="button" class="kds-station-tab' + (isSelected ? ' is-active' : '') + '" data-station-id="' + escapeHtml(st.id) + '">' +
        escapeHtml(label) + '</button>';
    }
    document.getElementById('kds-station-tabs').innerHTML = tabsHtml;

    var histBtn = document.getElementById('btn-toggle-history');
    if (state.viewMode === 'history') {
      histBtn.classList.add('is-active');
      histBtn.textContent = 'Quay lại Bếp (' + state.tickets.length + ')';
    } else {
      histBtn.classList.remove('is-active');
      histBtn.textContent = 'Đã hoàn thành (' + state.completed.length + ')';
    }
  }

  function renderBatchSummary() {
    var pending = computePendingSummary();
    var batchLabelEl = document.getElementById('kds-batch-label');
    if (batchLabelEl) {
      batchLabelEl.textContent = 'Tổng cần làm (' + pending.portionCount + ' phần):';
    }

    var list = pending.list;
    var container = document.getElementById('kds-batch-pills');
    if (list.length === 0) {
      container.innerHTML = '<span style="font-size: 12.5px; font-weight: 600; color: #6EE7B7;">Đã hoàn tất toàn bộ món đang hiển thị (0 phần).</span>';
      return;
    }

    var html = '';
    for (var k = 0; k < list.length; k++) {
      var b = list[k];
      html +=
        '<span class="kds-batch-pill">' +
        '<span>' + escapeHtml(b.name) + '</span>' +
        '<span class="kds-batch-qty' + (b.qty >= 2 ? ' is-multi' : '') + '">&#215;' + b.qty + '</span>' +
        '</span>';
    }
    container.innerHTML = html;
  }

  function renderWorkspace() {
    var gridEl = document.getElementById('kds-ticket-grid');
    var histPanel = document.getElementById('kds-history-panel');

    if (state.viewMode === 'history') {
      gridEl.style.display = 'none';
      histPanel.style.display = 'flex';
      document.getElementById('kds-history-title').textContent = 'Lịch Sử Phiếu Đã Ra Món (' + state.completed.length + ')';

      var histHtml = '';
      for (var cIdx = 0; cIdx < state.completed.length; cIdx++) {
        var ct = state.completed[cIdx];
        histHtml +=
          '<div style="padding: 14px; border-radius: 12px; background-color: #0F172A; border: 1px solid rgba(16, 185, 129, 0.3); display: flex; flex-direction: column; gap: 8px;">' +
            '<div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">' +
              '<span style="font-size: 16px; font-weight: 800; color: #F8FAFC;">' + escapeHtml(ct.tableName) + ' &middot; ' + escapeHtml(ct.orderCode) + '</span>' +
              '<span style="padding: 3px 9px; border-radius: 999px; background-color: rgba(16, 185, 129, 0.2); color: #6EE7B7; font-size: 11px; font-weight: 700;">Đã ra hết (' + escapeHtml(ct.finishedAt) + ')</span>' +
            '</div>' +
            '<span style="font-size: 12.5px; color: #94A3B8;">' + escapeHtml(ct.summary) + '</span>' +
            '<button type="button" data-recall-id="' + escapeHtml(ct.id) + '" style="min-height: 44px; padding: 0 12px; border-radius: 9px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.3); color: #E2E8F0; font-size: 12.5px; font-weight: 700; cursor: pointer;">Khôi phục lên Bếp</button>' +
          '</div>';
      }
      if (!histHtml) {
        histHtml = '<span style="font-size: 13px; color: #94A3B8;">Chưa có phiếu nào hoàn thành trong ca này.</span>';
      }
      document.getElementById('kds-history-grid').innerHTML = histHtml;
      return;
    }

    histPanel.style.display = 'none';
    gridEl.style.display = 'grid';

    var filtered = getFilteredTickets();
    if (filtered.length === 0) {
      gridEl.innerHTML =
        '<div style="grid-column: 1 / -1; padding: 48px 20px; border-radius: 16px; background-color: #111827; border: 1px dashed rgba(148, 163, 184, 0.3); text-align: center; color: #94A3B8; font-size: 14px;">' +
        'Hiện chưa có phiếu đang chờ cho trạm chế biến này.</div>';
      return;
    }

    var cardsHtml = '';
    for (var i = 0; i < filtered.length; i++) {
      var tk = filtered[i];
      var elapsedSec = tk.baseSec + state.tickOffset;
      var sla = getSlaTier(elapsedSec);
      var scopedItems = state.stationFilter === 'all'
        ? tk.items
        : tk.items.filter(function (it) { return it.station === state.stationFilter; });

      var doneCount = 0;
      for (var d = 0; d < scopedItems.length; d++) {
        if (scopedItems[d].done) doneCount++;
      }
      var totalCount = scopedItems.length;
      var allDone = totalCount > 0 && doneCount === totalCount;
      var statusHint = allDone ? 'Sẵn sàng đóng phiếu' : ((totalCount - doneCount) + ' món đang làm');

      var rowsHtml = '';
      for (var j = 0; j < scopedItems.length; j++) {
        var it = scopedItems[j];
        var isMulti = it.qty >= 2;
        var isOutStock = state.outOfStockNames.indexOf(it.name) !== -1;

        var rowCls = 'kds-dish-row' + (it.done ? ' is-done' : '') + (isOutStock ? ' is-out86' : '');
        var noteHtml = (it.note && it.note.trim())
          ? '<span style="font-size: 12px; font-weight: 700; color: #FBBF24; background-color: rgba(245, 158, 11, 0.14); border: 1px solid rgba(245, 158, 11, 0.32); padding: 2px 8px; border-radius: 6px; align-self: flex-start;">Ghi chú: ' + escapeHtml(it.note) + '</span>'
          : '';
        var warn86Html = isOutStock
          ? '<span style="font-size: 11px; font-weight: 700; color: #FECACA;">Cảnh báo: Đang báo hết (86) trên POS</span>'
          : '';

        rowsHtml +=
          '<button type="button" class="' + rowCls + '" data-toggle-ticket="' + escapeHtml(tk.id) + '" data-toggle-item="' + escapeHtml(it.id) + '" aria-pressed="' + (it.done ? 'true' : 'false') + '">' +
            '<span style="display: flex; align-items: flex-start; gap: 11px; flex: 1; min-width: 0; text-align: left;">' +
              '<span class="kds-qty-badge' + (isMulti ? ' is-multi' : '') + '">' + it.qty + 'x</span>' +
              '<span style="display: flex; flex-direction: column; gap: 4px; min-width: 0; flex: 1;">' +
                '<span style="display: flex; align-items: center; gap: 6px; flex-wrap: wrap;">' +
                  '<span class="kds-dish-name">' + escapeHtml(it.name) + '</span>' +
                  '<span style="padding: 2px 6px; border-radius: 5px; background-color: rgba(30, 41, 59, 0.9); border: 1px solid rgba(148, 163, 184, 0.2); font-size: 10.5px; font-weight: 600; color: #94A3B8;">' + escapeHtml(it.stationShort) + '</span>' +
                '</span>' +
                noteHtml +
                warn86Html +
              '</span>' +
            '</span>' +
            '<span class="kds-done-pill">' + (it.done ? '&#10003; Đã ra' : 'Ra món') + '</span>' +
          '</button>';
      }

      cardsHtml +=
        '<article class="kds-ticket-card ' + sla.tierClass + '" data-ticket-card="' + escapeHtml(tk.id) + '">' +
          '<div class="kds-ticket-header">' +
            '<div style="display: flex; flex-direction: column; gap: 3px;">' +
              '<div style="display: flex; align-items: center; gap: 8px;">' +
                '<span style="font-size: 20px; font-weight: 800; color: #F8FAFC; white-space: nowrap;">' + escapeHtml(tk.tableName) + '</span>' +
                '<span style="padding: 3px 8px; border-radius: 6px; background-color: #1E293B; border: 1px solid rgba(148, 163, 184, 0.25); font-size: 11px; font-weight: 700; color: #CBD5E1;">' + escapeHtml(tk.zone) + '</span>' +
              '</div>' +
              '<div style="display: flex; align-items: center; gap: 8px; font-size: 12px; color: #94A3B8;">' +
                '<span style="font-family: \'JetBrains Mono\', monospace; font-weight: 700; color: #E2E8F0;">' + escapeHtml(tk.orderCode) + '</span>' +
                '<span>&middot;</span>' +
                '<span>NV: ' + escapeHtml(tk.staff) + '</span>' +
              '</div>' +
            '</div>' +
            '<div style="display: flex; flex-direction: column; align-items: flex-end; gap: 5px;">' +
              '<span class="kds-sla-badge" data-ticket-badge="' + escapeHtml(tk.id) + '">' + escapeHtml(sla.label) + '</span>' +
              '<span class="kds-timer-text" data-ticket-timer="' + escapeHtml(tk.id) + '">' + formatTimer(elapsedSec) + '</span>' +
            '</div>' +
          '</div>' +
          '<div class="kds-ticket-items">' + rowsHtml + '</div>' +
          '<div class="kds-ticket-footer">' +
            '<div style="display: flex; align-items: center; justify-content: space-between; font-size: 12px; color: #94A3B8;">' +
              '<span>Tiến độ bàn: <strong style="color: #E2E8F0;">' + doneCount + '/' + totalCount + ' món đã ra</strong></span>' +
              '<span style="color: #CBD5E1;">' + escapeHtml(statusHint) + '</span>' +
            '</div>' +
            '<button type="button" class="kds-bump-btn' + (allDone ? ' is-ready' : '') + '" data-bump-id="' + escapeHtml(tk.id) + '">' +
              '<svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">' +
                '<path d="M20 6L9 17L4 12"></path>' +
              '</svg>' +
              '<span>HOÀN THÀNH TOÀN BỘ BÀN</span>' +
            '</button>' +
          '</div>' +
        '</article>';
    }

    gridEl.innerHTML = cardsHtml;
  }

  function render86ModalList() {
    var q = (state.search86Query || '').trim().toLowerCase();
    var filtered = BASE_86_CATALOG.filter(function (x) {
      if (!q) return true;
      return x.name.toLowerCase().indexOf(q) !== -1 || x.stationLabel.toLowerCase().indexOf(q) !== -1;
    });

    var html = '';
    for (var i = 0; i < filtered.length; i++) {
      var x = filtered[i];
      var isOut = state.outOfStockNames.indexOf(x.name) !== -1;
      var statusText = isOut ? 'Đang báo hết (Khóa POS)' : 'Còn hàng phục vụ';
      var rowBg = isOut ? 'rgba(153, 27, 27, 0.25)' : '#0F172A';
      var rowBdr = isOut ? 'rgba(239, 68, 68, 0.55)' : 'rgba(148, 163, 184, 0.2)';
      var btnBg = isOut ? '#065F46' : '#991B1B';
      var btnBdr = isOut ? '#10B981' : 'rgba(239, 68, 68, 0.65)';

      html +=
        '<div style="padding: 11px 14px; border-radius: 11px; display: flex; align-items: center; justify-content: space-between; gap: 12px; background-color: ' + rowBg + '; border: 1px solid ' + rowBdr + ';">' +
          '<div style="display: flex; flex-direction: column; gap: 2px;">' +
            '<span style="font-size: 14px; font-weight: 700; color: #F8FAFC;">' + escapeHtml(x.name) + '</span>' +
            '<span style="font-size: 12px; color: #94A3B8;">Trạm: ' + escapeHtml(x.stationLabel) + ' &middot; ' + statusText + '</span>' +
          '</div>' +
          '<button type="button" data-toggle-86="' + escapeHtml(x.name) + '" style="min-height: 44px; padding: 0 14px; border-radius: 9px; font-size: 12.5px; font-weight: 700; cursor: pointer; white-space: nowrap; border: 1px solid ' + btnBdr + '; background-color: ' + btnBg + '; color: #FFFFFF;">' +
            (isOut ? 'Mở bán lại' : 'Báo hết (86)') +
          '</button>' +
        '</div>';
    }
    if (!html) {
      html = '<span style="font-size: 13px; color: #94A3B8; padding: 12px;">Không tìm thấy món phù hợp.</span>';
    }
    document.getElementById('kds-86-list').innerHTML = html;
  }

  function renderAll() {
    renderHeaderStatsAndTabs();
    renderBatchSummary();
    renderBanner();
    renderWorkspace();
    render86ModalList();
    renderClockAndTimers();
  }

  function toggleItemDone(ticketId, itemId) {
    for (var i = 0; i < state.tickets.length; i++) {
      if (state.tickets[i].id !== ticketId) continue;
      for (var j = 0; j < state.tickets[i].items.length; j++) {
        if (state.tickets[i].items[j].id === itemId) {
          state.tickets[i].items[j].done = !state.tickets[i].items[j].done;
          break;
        }
      }
      break;
    }
    renderAll();
  }

  function bumpTicket(ticketId) {
    var stamp = formatClock(Date.now());
    var targetIndex = -1;
    for (var i = 0; i < state.tickets.length; i++) {
      if (state.tickets[i].id === ticketId) {
        targetIndex = i;
        break;
      }
    }
    if (targetIndex === -1) return;
    var target = state.tickets.splice(targetIndex, 1)[0];
    var doneItems = target.items.map(function (it) {
      return {
        id: it.id,
        name: it.name,
        qty: it.qty,
        station: it.station,
        stationShort: it.stationShort,
        note: it.note,
        done: true
      };
    });
    state.completed.unshift({
      id: target.id,
      tableName: target.tableName,
      zone: target.zone,
      orderCode: target.orderCode,
      staff: target.staff,
      baseSec: target.baseSec,
      finishedAt: stamp,
      summary: 'Đã lên đủ ' + target.items.length + ' món · NV: ' + target.staff,
      items: doneItems
    });
    state.bannerMsg = 'Đã hoàn thành toàn bộ phiếu ' + target.tableName + ' (' + target.orderCode + ') và chuyển sang Lịch sử.';
    renderAll();
  }

  function recallTicket(ticketId) {
    var targetIndex = -1;
    for (var i = 0; i < state.completed.length; i++) {
      if (state.completed[i].id === ticketId) {
        targetIndex = i;
        break;
      }
    }
    if (targetIndex === -1) return;
    var target = state.completed.splice(targetIndex, 1)[0];
    state.tickets.unshift(target);
    state.viewMode = 'active';
    state.bannerMsg = 'Đã khôi phục ' + target.tableName + ' (' + target.orderCode + ') quay lại điều phối bếp.';
    renderAll();
  }

  function toggle86Dish(dishName) {
    var idx = state.outOfStockNames.indexOf(dishName);
    if (idx !== -1) {
      state.outOfStockNames.splice(idx, 1);
      state.bannerMsg = 'Đã mở bán lại "' + dishName + '" trên POS & Bếp.';
    } else {
      state.outOfStockNames.push(dishName);
      state.bannerMsg = 'Đã báo Hết (86): "' + dishName + '" — đồng bộ khóa gọi món trên POS.';
    }
    saveKds86(state.outOfStockNames);
    renderAll();
  }

  document.addEventListener('DOMContentLoaded', function () {
    renderAll();

    setInterval(function () {
      state.tickOffset += 1;
      renderClockAndTimers();
    }, 1000);

    document.getElementById('kds-station-tabs').addEventListener('click', function (e) {
      var tab = e.target.closest('[data-station-id]');
      if (!tab) return;
      state.stationFilter = tab.getAttribute('data-station-id');
      state.viewMode = 'active';
      renderAll();
    });

    document.getElementById('btn-toggle-history').addEventListener('click', function () {
      state.viewMode = state.viewMode === 'history' ? 'active' : 'history';
      renderAll();
    });

    document.getElementById('btn-back-to-active').addEventListener('click', function () {
      state.viewMode = 'active';
      renderAll();
    });

    document.getElementById('kds-banner-dismiss').addEventListener('click', function () {
      state.bannerMsg = '';
      renderBanner();
    });

    document.getElementById('kds-ticket-grid').addEventListener('click', function (e) {
      var bumpBtn = e.target.closest('[data-bump-id]');
      if (bumpBtn) {
        bumpTicket(bumpBtn.getAttribute('data-bump-id'));
        return;
      }
      var rowBtn = e.target.closest('[data-toggle-ticket]');
      if (rowBtn) {
        toggleItemDone(rowBtn.getAttribute('data-toggle-ticket'), rowBtn.getAttribute('data-toggle-item'));
      }
    });

    document.getElementById('kds-history-grid').addEventListener('click', function (e) {
      var recallBtn = e.target.closest('[data-recall-id]');
      if (recallBtn) {
        recallTicket(recallBtn.getAttribute('data-recall-id'));
      }
    });

    var modal86 = document.getElementById('kds-86-modal');
    function open86Modal() {
      modal86.classList.add('is-open');
    }
    function close86Modal() {
      modal86.classList.remove('is-open');
    }

    document.getElementById('btn-open-86').addEventListener('click', open86Modal);
    document.getElementById('btn-close-86-x').addEventListener('click', close86Modal);
    document.getElementById('btn-close-86-done').addEventListener('click', close86Modal);
    modal86.addEventListener('click', function (e) {
      if (e.target === modal86) close86Modal();
    });

    document.getElementById('kds-86-search').addEventListener('input', function () {
      state.search86Query = this.value;
      render86ModalList();
    });

    document.getElementById('kds-86-list').addEventListener('click', function (e) {
      var btn = e.target.closest('[data-toggle-86]');
      if (btn) {
        toggle86Dish(btn.getAttribute('data-toggle-86'));
      }
    });

    window.addEventListener('storage', function (e) {
      if (e.key === STORAGE_86_KEY) {
        state.outOfStockNames = loadInitialKds86();
        renderAll();
      }
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') close86Modal();
    });
  });
})();
</script>
</body>
</html>

