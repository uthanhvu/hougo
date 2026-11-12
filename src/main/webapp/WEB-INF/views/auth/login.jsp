<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng Nhập &amp; Chọn Ca Trực — HOUGO HOTPOT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@600;700;800&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg-canvas: #0B1120;
      --bg-surface: #111827;
      --bg-card: #1E293B;
      --border-subtle: #334155;
      --crimson-deep: #991B1B;
      --crimson: #B91C1C;
      --gold: #F59E0B;
      --gold-bright: #FBBF24;
      --gold-soft: #FDE68A;
      --emerald: #10B981;
      --cream: #FAF7F2;
      --text-primary: #F8FAFC;
      --text-secondary: #CBD5E1;
      --text-muted: #94A3B8;
    }

    * { box-sizing: border-box; }

    html, body {
      margin: 0;
      padding: 0;
      min-height: 100%;
      background-color: var(--bg-canvas);
      color: var(--text-primary);
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      -webkit-font-smoothing: antialiased;
    }

    a { color: inherit; text-decoration: none; }
    button, input { font-family: inherit; }

    button, .auth-back-link, .auth-demo-card {
      transition: transform 0.14s ease, filter 0.14s ease, border-color 0.14s ease, background-color 0.14s ease;
    }

    button:hover, .auth-back-link:hover, .auth-demo-card:hover {
      filter: brightness(1.08);
    }

    button:active, .auth-back-link:active, .auth-demo-card:active {
      transform: scale(0.985);
    }

    button:focus-visible, input:focus-visible, a:focus-visible {
      outline: 2px solid var(--gold);
      outline-offset: 2px;
    }

    .auth-page {
      min-height: 100vh;
      width: 100%;
      padding: 24px 18px;
      display: flex;
      align-items: center;
      justify-content: center;
      background-image:
        radial-gradient(circle at 18% 18%, rgba(185, 28, 28, 0.22), transparent 44%),
        radial-gradient(circle at 82% 80%, rgba(245, 158, 11, 0.14), transparent 42%);
    }

    .auth-shell {
      width: 100%;
      max-width: 1020px;
      background-color: var(--bg-surface);
      border: 1px solid rgba(245, 158, 11, 0.34);
      border-radius: 22px;
      overflow: hidden;
      display: grid;
      grid-template-columns: 1fr 1.15fr;
      box-shadow: 0 32px 72px rgba(0, 0, 0, 0.65);
    }

    .auth-brand-pane {
      position: relative;
      padding: 34px 30px;
      background: linear-gradient(165deg, rgba(153, 27, 27, 0.36) 0%, #0F172A 65%, #0B1120 100%);
      border-right: 1px solid var(--border-subtle);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      gap: 24px;
    }

    .auth-form-pane {
      padding: 34px 32px;
      display: flex;
      flex-direction: column;
      gap: 20px;
      background-color: var(--bg-surface);
    }

    .shift-pill {
      flex: 1 1 110px;
      min-height: 48px;
      padding: 8px 10px;
      border-radius: 11px;
      border: 1px solid var(--border-subtle);
      background-color: #0F172A;
      color: var(--text-secondary);
      cursor: pointer;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      justify-content: center;
      gap: 2px;
      text-align: left;
    }

    .shift-pill.is-active {
      border: 1.5px solid var(--gold-bright);
      background-color: var(--crimson-deep);
      color: var(--gold-soft);
      box-shadow: 0 6px 18px rgba(153, 27, 27, 0.38);
    }

    .auth-demo-card {
      width: 100%;
      min-height: 58px;
      padding: 10px 14px;
      border-radius: 12px;
      background-color: var(--bg-card);
      border: 1px solid var(--border-subtle);
      color: var(--text-primary);
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      text-align: left;
    }

    .auth-demo-card.role-admin {
      border-color: rgba(245, 158, 11, 0.5);
      background: linear-gradient(90deg, rgba(153, 27, 27, 0.34), #1E293B);
    }

    .auth-demo-card.role-pos {
      border-color: rgba(56, 189, 248, 0.45);
      background: linear-gradient(90deg, rgba(14, 116, 144, 0.25), #1E293B);
    }

    .auth-demo-card.role-kds {
      border-color: rgba(16, 185, 129, 0.48);
      background: linear-gradient(90deg, rgba(6, 95, 70, 0.3), #1E293B);
    }

    @media (max-width: 860px) {
      .auth-shell {
        grid-template-columns: 1fr;
        max-width: 560px;
      }
      .auth-brand-pane {
        border-right: none;
        border-bottom: 1px solid var(--border-subtle);
        padding: 24px 22px;
      }
      .auth-form-pane {
        padding: 24px 22px;
      }
    }
  </style>
</head>
<body>
<div class="auth-page">
  <div class="auth-shell">

    <!-- LEFT BRAND & OPERATION OVERVIEW -->
    <aside class="auth-brand-pane">
      <div style="display: flex; flex-direction: column; gap: 22px;">
        <div style="display: flex; align-items: center; justify-content: space-between; gap: 12px; flex-wrap: wrap;">
          <a href="${pageContext.request.contextPath}/home" class="auth-back-link" style="min-height: 40px; padding: 0 12px; border-radius: 9px; background-color: rgba(15, 23, 42, 0.85); border: 1px solid #334155; color: #CBD5E1; font-size: 12.5px; font-weight: 600; display: inline-flex; align-items: center; gap: 6px;">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M19 12H5"></path>
              <path d="M12 19L5 12L12 5"></path>
            </svg>
            <span>Về Trang Chủ</span>
          </a>

          <span style="padding: 4px 10px; border-radius: 999px; background-color: rgba(16, 185, 129, 0.16); border: 1px solid rgba(16, 185, 129, 0.4); color: #6EE7B7; font-size: 11px; font-weight: 700;">HỆ THỐNG NỘI BỘ</span>
        </div>

        <div style="display: flex; align-items: center; gap: 14px;">
          <svg width="48" height="48" viewBox="0 0 42 42" fill="none" aria-hidden="true">
            <rect x="1" y="1" width="40" height="40" rx="11" fill="#991B1B" stroke="#F59E0B" stroke-width="1.5"></rect>
            <path d="M12 22.5H30C29.5 27.2 25.8 30 21 30C16.2 30 12.5 27.2 12 22.5Z" stroke="#FDE68A" stroke-width="1.6" stroke-linejoin="round"></path>
            <path d="M10.5 22.5H31.5" stroke="#F59E0B" stroke-width="1.8" stroke-linecap="round"></path>
            <path d="M17 17C17 15.3 18.2 14.7 18.2 13" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
            <path d="M21 17C21 15 22.4 14.3 22.4 12.3" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
            <path d="M25 17C25 15.3 26.2 14.7 26.2 13" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
          </svg>
          <div style="display: flex; flex-direction: column; gap: 2px;">
            <span style="font-family: 'Playfair Display', Georgia, serif; font-size: 24px; font-weight: 700; letter-spacing: 0.08em; color: #FAF7F2;">HOUGO HOTPOT</span>
            <span style="font-size: 12px; font-weight: 700; letter-spacing: 0.12em; color: #FBBF24;">QUẢN TRỊ · POS THU NGÂN · BẾP KDT</span>
          </div>
        </div>

        <div style="border-radius: 14px; overflow: hidden; border: 1px solid rgba(251, 191, 36, 0.28); height: 158px; position: relative; background-color: #0B1120;">
          <img src="${pageContext.request.contextPath}/assets/images/hotpot/space-interior.jpg" alt="Không gian Nhà hàng Lẩu Hougo" style="width: 100%; height: 100%; object-fit: cover; display: block; opacity: 0.72;">
          <div style="position: absolute; inset: 0; background: linear-gradient(180deg, rgba(11, 17, 32, 0.1) 20%, rgba(11, 17, 32, 0.92) 100%);"></div>
          <div style="position: absolute; left: 14px; right: 14px; bottom: 12px; display: flex; flex-direction: column; gap: 2px;">
            <span style="font-size: 13.5px; font-weight: 800; color: #FAF7F2;">Chi nhánh Trung tâm · 16 Bàn (Sảnh &amp; VIP)</span>
            <span style="font-size: 12px; color: #CBD5E1;">Đồng bộ đơn gọi món, 86-List và doanh thu ca làm việc theo thời gian thực.</span>
          </div>
        </div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 10px; padding: 14px; border-radius: 14px; background-color: rgba(15, 23, 42, 0.78); border: 1px solid #334155;">
        <span style="font-size: 11px; font-weight: 800; letter-spacing: 0.12em; color: #F59E0B; text-transform: uppercase;">Luồng phân quyền theo vai trò</span>
        <div style="display: grid; grid-template-columns: 1fr; gap: 6px; font-size: 12.5px; color: #CBD5E1;">
          <span>&bull; <strong style="color: #FDE68A;">Quản trị viên</strong> &rarr; Điều hành báo cáo, đặt bàn, thực đơn &amp; nhân sự (<code style="color: #FBBF24;">/admin</code>)</span>
          <span>&bull; <strong style="color: #BAE6FD;">Thu ngân POS</strong> &rarr; Sơ đồ 16 bàn, gọi món tại bàn &amp; thanh toán (<code style="color: #7DD3FC;">/pos</code>)</span>
          <span>&bull; <strong style="color: #6EE7B7;">Điều phối Bếp</strong> &rarr; Màn hình Bếp KDT theo SLA &amp; báo hết 86 (<code style="color: #34D399;">/kitchen</code>)</span>
        </div>
      </div>
    </aside>

    <!-- RIGHT LOGIN & SHIFT SELECTION FORM -->
    <main class="auth-form-pane">
      <div style="display: flex; flex-direction: column; gap: 4px;">
        <span style="font-size: 11.5px; font-weight: 800; letter-spacing: 0.14em; color: #F59E0B;">XÁC THỰC CA LÀM VIỆC</span>
        <h1 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 27px; font-weight: 700; color: #FAF7F2;">Đăng Nhập Cổng Nghiệp Vụ</h1>
        <span style="font-size: 13px; color: #94A3B8;">Chọn ca trực hiện tại và đăng nhập tài khoản nhân sự được cấp phép.</span>
      </div>

      <% if (Boolean.TRUE.equals(request.getAttribute("loggedOut"))) { %>
      <div role="status" style="padding: 11px 14px; border-radius: 10px; background-color: rgba(16, 185, 129, 0.16); border: 1px solid rgba(16, 185, 129, 0.45); color: #A7F3D0; font-size: 13px; font-weight: 600;">
        Bạn đã đăng xuất an toàn khỏi ca làm việc trước. Vui lòng chọn ca mới để tiếp tục.
      </div>
      <% } %>

      <% if (request.getAttribute("errorMsg") != null) { %>
      <div role="alert" style="padding: 11px 14px; border-radius: 10px; background-color: rgba(185, 28, 28, 0.25); border: 1px solid rgba(248, 113, 113, 0.6); color: #FECACA; font-size: 13px; font-weight: 600;">
        <%= String.valueOf(request.getAttribute("errorMsg")) %>
      </div>
      <% } %>

      <form id="auth-login-form" method="post" action="${pageContext.request.contextPath}/login" style="display: flex; flex-direction: column; gap: 16px;">
        <input type="hidden" id="input-shift" name="shift" value="${not empty selectedShift ? selectedShift : 'Ca Tối'}">
        <input type="hidden" id="input-quick-demo" name="quickDemoUser" value="">

        <!-- Shift Selection -->
        <div style="display: flex; flex-direction: column; gap: 7px;">
          <span style="font-size: 12px; font-weight: 700; color: #CBD5E1;">1. Chọn Ca làm việc hôm nay (12/11/2026)</span>
          <div id="shift-picker" style="display: flex; flex-wrap: wrap; gap: 8px;">
            <button type="button" class="shift-pill" data-shift="Ca Sáng">
              <span style="font-size: 13px; font-weight: 800;">Ca Sáng</span>
              <span style="font-family: 'JetBrains Mono', monospace; font-size: 11px; opacity: 0.85;">09:00 – 14:00</span>
            </button>
            <button type="button" class="shift-pill" data-shift="Ca Chiều">
              <span style="font-size: 13px; font-weight: 800;">Ca Chiều</span>
              <span style="font-family: 'JetBrains Mono', monospace; font-size: 11px; opacity: 0.85;">14:00 – 18:00</span>
            </button>
            <button type="button" class="shift-pill is-active" data-shift="Ca Tối">
              <span style="font-size: 13px; font-weight: 800;">Ca Tối</span>
              <span style="font-family: 'JetBrains Mono', monospace; font-size: 11px; opacity: 0.85;">18:00 – 23:00</span>
            </button>
          </div>
        </div>

        <!-- Credentials -->
        <div style="display: flex; flex-direction: column; gap: 12px;">
          <label style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
            <span>2. Tên đăng nhập</span>
            <input type="text" id="input-username" name="username" value="${not empty enteredUser ? enteredUser : 'pos.linh'}" autocomplete="username" placeholder="Ví dụ: admin.hai, pos.linh, kds.nam" style="min-height: 46px; padding: 0 14px; border-radius: 10px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-family: 'JetBrains Mono', monospace; font-size: 13.5px; font-weight: 600;">
          </label>

          <label style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; font-weight: 700; color: #CBD5E1;">
            <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">
              <span>Mật khẩu</span>
              <span style="font-size: 11px; font-weight: 500; color: #94A3B8;">Mật khẩu demo mặc định: <strong style="font-family: 'JetBrains Mono', monospace; color: #FBBF24;">123456</strong></span>
            </div>
            <div style="position: relative; display: flex; align-items: center;">
              <input type="password" id="input-password" name="password" value="123456" autocomplete="current-password" placeholder="Nhập mật khẩu nhân sự" style="min-height: 46px; width: 100%; padding: 0 58px 0 14px; border-radius: 10px; border: 1px solid #334155; background-color: #0F172A; color: #F8FAFC; font-size: 13.5px;">
              <button type="button" id="btn-toggle-pass" style="position: absolute; right: 6px; min-height: 36px; padding: 0 10px; border-radius: 7px; border: 1px solid #334155; background-color: #1E293B; color: #CBD5E1; font-size: 11.5px; font-weight: 700; cursor: pointer;">Hiện</button>
            </div>
          </label>
        </div>

        <button type="submit" style="min-height: 48px; width: 100%; padding: 0 20px; border-radius: 11px; background-color: #B91C1C; border: 1.5px solid rgba(251, 191, 36, 0.72); color: #FFFFFF; font-size: 14.5px; font-weight: 800; letter-spacing: 0.04em; text-transform: uppercase; cursor: pointer; box-shadow: 0 10px 24px rgba(185, 28, 28, 0.42);">
          Đăng nhập &amp; Mở ca trực
        </button>
      </form>

      <!-- Divider -->
      <div style="display: flex; align-items: center; gap: 10px; padding-top: 2px;">
        <div style="flex: 1; height: 1px; background-color: #334155;"></div>
        <span style="font-size: 11px; font-weight: 700; letter-spacing: 0.1em; color: #94A3B8; text-transform: uppercase; white-space: nowrap;">Đăng nhập nhanh Demo (1-Click)</span>
        <div style="flex: 1; height: 1px; background-color: #334155;"></div>
      </div>

      <!-- 3 Quick Demo Buttons -->
      <div style="display: flex; flex-direction: column; gap: 9px;">
        <button type="button" class="auth-demo-card role-admin" data-demo-user="admin.hai">
          <div style="display: flex; align-items: center; gap: 11px;">
            <span style="width: 36px; height: 36px; border-radius: 10px; background-color: #991B1B; border: 1px solid #FBBF24; color: #FDE68A; font-size: 12.5px; font-weight: 800; display: inline-flex; align-items: center; justify-content: center;">QT</span>
            <div style="display: flex; flex-direction: column; gap: 2px;">
              <span style="font-size: 13.5px; font-weight: 800; color: #FAF7F2;">1. Quản trị viên · Nguyễn Hoàng Hải</span>
              <span style="font-family: 'JetBrains Mono', monospace; font-size: 11.5px; color: #FDE68A;">admin.hai &rarr; Vào thẳng /admin</span>
            </div>
          </div>
          <span style="padding: 5px 11px; border-radius: 8px; background-color: rgba(251, 191, 36, 0.16); border: 1px solid rgba(251, 191, 36, 0.45); color: #FDE68A; font-size: 12px; font-weight: 700; white-space: nowrap;">Vào ngay &rarr;</span>
        </button>

        <button type="button" class="auth-demo-card role-pos" data-demo-user="pos.linh">
          <div style="display: flex; align-items: center; gap: 11px;">
            <span style="width: 36px; height: 36px; border-radius: 10px; background-color: #0369A1; border: 1px solid #7DD3FC; color: #E0F2FE; font-size: 12.5px; font-weight: 800; display: inline-flex; align-items: center; justify-content: center;">TN</span>
            <div style="display: flex; flex-direction: column; gap: 2px;">
              <span style="font-size: 13.5px; font-weight: 800; color: #FAF7F2;">2. Thu ngân POS · Phạm Thùy Linh</span>
              <span style="font-family: 'JetBrains Mono', monospace; font-size: 11.5px; color: #BAE6FD;">pos.linh &rarr; Vào thẳng /pos</span>
            </div>
          </div>
          <span style="padding: 5px 11px; border-radius: 8px; background-color: rgba(56, 189, 248, 0.16); border: 1px solid rgba(56, 189, 248, 0.45); color: #BAE6FD; font-size: 12px; font-weight: 700; white-space: nowrap;">Vào ngay &rarr;</span>
        </button>

        <button type="button" class="auth-demo-card role-kds" data-demo-user="kds.nam">
          <div style="display: flex; align-items: center; gap: 11px;">
            <span style="width: 36px; height: 36px; border-radius: 10px; background-color: #047857; border: 1px solid #34D399; color: #ECFDF5; font-size: 12.5px; font-weight: 800; display: inline-flex; align-items: center; justify-content: center;">BP</span>
            <div style="display: flex; flex-direction: column; gap: 2px;">
              <span style="font-size: 13.5px; font-weight: 800; color: #FAF7F2;">3. Điều phối Bếp · Lê Hoàng Nam</span>
              <span style="font-family: 'JetBrains Mono', monospace; font-size: 11.5px; color: #6EE7B7;">kds.nam &rarr; Vào thẳng /kitchen</span>
            </div>
          </div>
          <span style="padding: 5px 11px; border-radius: 8px; background-color: rgba(16, 185, 129, 0.18); border: 1px solid rgba(16, 185, 129, 0.45); color: #6EE7B7; font-size: 12px; font-weight: 700; white-space: nowrap;">Vào ngay &rarr;</span>
        </button>
      </div>
    </main>

  </div>
</div>

<script>
(function () {
  var shiftInput = document.getElementById('input-shift');
  var quickInput = document.getElementById('input-quick-demo');
  var userInput = document.getElementById('input-username');
  var passInput = document.getElementById('input-password');
  var form = document.getElementById('auth-login-form');

  function syncShiftPills(val) {
    var btns = document.querySelectorAll('[data-shift]');
    for (var i = 0; i < btns.length; i++) {
      btns[i].classList.toggle('is-active', btns[i].getAttribute('data-shift') === val);
    }
  }

  syncShiftPills(shiftInput.value || 'Ca Tối');

  document.getElementById('shift-picker').addEventListener('click', function (e) {
    var btn = e.target.closest('[data-shift]');
    if (!btn) return;
    var val = btn.getAttribute('data-shift');
    shiftInput.value = val;
    syncShiftPills(val);
  });

  document.getElementById('btn-toggle-pass').addEventListener('click', function () {
    var isHidden = passInput.type === 'password';
    passInput.type = isHidden ? 'text' : 'password';
    this.textContent = isHidden ? 'Ẩn' : 'Hiện';
  });

  var demoBtns = document.querySelectorAll('[data-demo-user]');
  for (var i = 0; i < demoBtns.length; i++) {
    demoBtns[i].addEventListener('click', function () {
      var u = this.getAttribute('data-demo-user');
      userInput.value = u;
      passInput.value = '123456';
      quickInput.value = u;
      form.submit();
    });
  }

  form.addEventListener('submit', function () {
    if (!document.activeElement || !document.activeElement.getAttribute('data-demo-user')) {
      quickInput.value = '';
    }
  });
})();
</script>
</body>
</html>

