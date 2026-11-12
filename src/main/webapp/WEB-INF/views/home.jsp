<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hougo Hotpot — Tinh Hoa Lẩu Trung Hoa &amp; Đài Loan</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&amp;family=Playfair+Display:ital,wght@0,500;0,600;0,700;1,500&amp;display=swap">
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
  <style>
    :root {
      --crimson: #B91C1C;
      --crimson-deep: #991B1B;
      --gold: #F59E0B;
      --gold-light: #FDE68A;
      --gold-bright: #FBBF24;
      --bg-base: #111827;
      --bg-band: #0D131F;
      --bg-card: #171F2E;
      --bg-card-featured: #1B2336;
      --bg-footer: #0A0E17;
      --text-primary: #FAF7F2;
      --text-secondary: #D1D5DB;
      --text-muted: #9CA3AF;
    }

    * {
      box-sizing: border-box;
    }

    html {
      scroll-behavior: smooth;
    }

    section[id],
    #dat-ban {
      scroll-margin-top: 84px;
    }

    body {
      margin: 0;
      background-color: var(--bg-base);
      color: var(--text-primary);
      font-family: 'Be Vietnam Pro', system-ui, -apple-system, sans-serif;
      color-scheme: dark;
      overflow-x: hidden;
    }

    a {
      color: #E5E0D8;
      text-decoration: none;
      transition: color 0.2s ease, background-color 0.2s ease, border-color 0.2s ease, transform 0.2s ease;
    }

    a:hover {
      color: var(--gold-bright);
    }

    button {
      font-family: inherit;
      transition: background-color 0.2s ease, border-color 0.2s ease, transform 0.15s ease;
    }

    input::placeholder,
    textarea::placeholder {
      color: var(--text-muted);
    }

    input:focus,
    select:focus,
    textarea:focus {
      outline: 2px solid var(--gold);
      outline-offset: 1px;
      border-color: var(--gold);
    }

    .container {
      width: 100%;
      max-width: 1280px;
      margin-left: auto !important;
      margin-right: auto !important;
      padding-left: 24px;
      padding-right: 24px;
      box-sizing: border-box;
    }

    /* Header & Navbar */
    .site-header {
      width: 100%;
      background-color: var(--bg-band);
      border-bottom: 1px solid rgba(245, 158, 11, 0.2);
      position: sticky;
      top: 0;
      z-index: 50;
      display: flex;
      flex-direction: column;
      align-items: center;
      transition: background-color 0.35s ease, border-color 0.35s ease, box-shadow 0.35s ease, backdrop-filter 0.35s ease;
    }

    .site-header.is-scrolled {
      background-color: rgba(13, 19, 31, 0.82);
      -webkit-backdrop-filter: blur(10px);
      backdrop-filter: blur(10px);
      border-bottom-color: rgba(245, 158, 11, 0.36);
      box-shadow: 0 14px 36px rgba(0, 0, 0, 0.58);
    }

    .nav-bar {
      padding-top: 16px;
      padding-bottom: 16px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 24px;
    }

    .brand-link {
      display: flex;
      align-items: center;
      gap: 14px;
      color: var(--text-primary);
    }

    .brand-text {
      display: flex;
      flex-direction: column;
      gap: 2px;
    }

    .brand-title {
      font-family: 'Playfair Display', Georgia, serif;
      font-size: 20px;
      font-weight: 700;
      letter-spacing: 0.12em;
      color: var(--text-primary);
      line-height: 1.1;
    }

    .brand-sub {
      font-size: 10px;
      font-weight: 600;
      letter-spacing: 0.22em;
      color: var(--gold);
      line-height: 1.2;
    }

    .nav-links {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 32px;
    }

    .nav-links a {
      font-size: 14px;
      font-weight: 500;
      color: var(--text-secondary);
      padding: 8px 0;
    }

    .nav-links a.active,
    .nav-links a:hover {
      color: var(--gold-bright);
    }

    .nav-actions {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 12px;
    }

    .btn-pos {
      min-height: 44px;
      padding: 10px 16px;
      border-radius: 8px;
      border: 1px solid rgba(245, 158, 11, 0.45);
      background-color: rgba(245, 158, 11, 0.08);
      color: var(--gold-light);
      font-size: 13px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      transition: all 0.35s ease;
    }

    .btn-pos:hover {
      background-color: rgba(245, 158, 11, 0.18);
      border-color: var(--gold);
      color: var(--text-primary);
      transform: translateY(-2px);
    }

    @keyframes btnShimmer {
      0% {
        transform: translateX(-140%) skewX(-22deg);
      }
      45%, 100% {
        transform: translateX(240%) skewX(-22deg);
      }
    }

    @keyframes ctaPulse {
      0%, 100% {
        box-shadow: 0 8px 24px rgba(185, 28, 28, 0.38), 0 0 0 0 rgba(245, 158, 11, 0.38);
      }
      50% {
        box-shadow: 0 12px 28px rgba(185, 28, 28, 0.56), 0 0 0 8px rgba(245, 158, 11, 0);
      }
    }

    .btn-primary {
      position: relative;
      overflow: hidden;
      min-height: 44px;
      padding: 10px 22px;
      border-radius: 8px;
      background-color: var(--crimson);
      color: var(--text-primary);
      font-size: 14px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      box-shadow: 0 8px 24px rgba(185, 28, 28, 0.38);
      border: none;
      cursor: pointer;
      transition: all 0.35s ease;
    }

    .btn-primary::after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 48%;
      height: 100%;
      background: linear-gradient(90deg, transparent 0%, rgba(255, 255, 255, 0.28) 50%, transparent 100%);
      transform: translateX(-140%) skewX(-22deg);
      animation: btnShimmer 4s ease-in-out infinite;
      pointer-events: none;
    }

    .btn-primary:hover {
      background-color: var(--crimson-deep);
      color: var(--text-primary);
      transform: translateY(-2px);
      box-shadow: 0 12px 30px rgba(185, 28, 28, 0.52), 0 0 20px rgba(245, 158, 11, 0.28);
    }

    .btn-primary:hover::after {
      animation: btnShimmer 1.4s ease-in-out infinite;
    }

    .btn-cta-pulse {
      animation: ctaPulse 2.8s ease-in-out infinite;
    }

    .btn-outline-gold {
      min-height: 50px;
      padding: 14px 26px;
      border-radius: 8px;
      border: 1px solid rgba(245, 158, 11, 0.55);
      background-color: rgba(17, 24, 39, 0.65);
      color: var(--gold-light);
      font-size: 15px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      transition: all 0.35s ease;
    }

    .btn-outline-gold:hover {
      background-color: rgba(245, 158, 11, 0.14);
      border-color: var(--gold);
      color: var(--text-primary);
      transform: translateY(-2px);
      box-shadow: 0 10px 24px rgba(245, 158, 11, 0.18);
    }

    .mobile-menu-toggle {
      display: none;
      width: 44px;
      height: 44px;
      border-radius: 8px;
      border: 1px solid rgba(245, 158, 11, 0.35);
      background-color: var(--bg-card);
      color: var(--text-primary);
      align-items: center;
      justify-content: center;
      cursor: pointer;
    }

    .mobile-drawer {
      width: 100%;
      display: none;
      padding: 10px 16px 18px;
      border-top: 1px solid rgba(255, 255, 255, 0.08);
      background-color: #0E1525;
      flex-direction: column;
      gap: 6px;
    }

    .mobile-drawer.is-open {
      display: flex;
    }

    .mobile-drawer a {
      min-height: 44px;
      padding: 10px 12px;
      border-radius: 8px;
      font-size: 15px;
      font-weight: 500;
      display: flex;
      align-items: center;
    }

    /* Hero */
    .hero-section {
      width: 100%;
      min-height: calc(100vh - 80px);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px 0;
      margin-top: 0;
      margin-bottom: 0;
      position: relative;
      z-index: 1;
      background-color: var(--bg-base);
      background-image:
        linear-gradient(to bottom, rgba(13, 19, 31, 0) 66%, var(--bg-band) 100%),
        radial-gradient(circle at 76% 42%, rgba(185, 28, 28, 0.22), transparent 52%),
        radial-gradient(circle at 18% 82%, rgba(245, 158, 11, 0.08), transparent 45%);
    }

    .hero-inner {
      width: 100%;
      padding-top: 0;
      padding-bottom: 0;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 56px;
    }

    .hero-copy {
      flex: 1 1 480px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      gap: 24px;
    }

    .hero-badge {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      padding: 8px 16px;
      border-radius: 999px;
      background-color: rgba(153, 27, 27, 0.35);
      border: 1px solid rgba(245, 158, 11, 0.5);
    }

    .hero-title {
      margin: 0;
      font-family: 'Playfair Display', Georgia, serif;
      font-size: 56px;
      font-weight: 700;
      line-height: 1.14;
      letter-spacing: -0.01em;
      color: var(--text-primary);
    }

    .hero-title .accent {
      color: var(--gold);
      font-style: italic;
    }

    .hero-desc {
      margin: 0;
      font-size: 17px;
      line-height: 1.72;
      color: var(--text-secondary);
      max-width: 540px;
    }

    .hero-ctas {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 16px;
      padding-top: 4px;
    }

    .hero-ctas .btn-primary {
      min-height: 50px;
      padding: 14px 28px;
      font-size: 15px;
    }

    .hero-metrics {
      width: 100%;
      padding-top: 24px;
      margin-top: 8px;
      border-top: 1px solid rgba(255, 255, 255, 0.1);
      display: flex;
      flex-wrap: wrap;
      gap: 28px;
    }

    .hero-metric {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }

    .hero-metric-val {
      font-family: 'Playfair Display', Georgia, serif;
      font-size: 24px;
      font-weight: 700;
      color: var(--gold);
    }

    .hero-metric-label {
      font-size: 13px;
      color: var(--text-muted);
    }

    .hero-visual {
      flex: 1 1 540px;
      min-width: 0;
    }

    @keyframes heroLevitate {
      0%, 100% {
        transform: translateY(0px);
        box-shadow: 0 28px 64px rgba(0, 0, 0, 0.55), 0 0 36px rgba(185, 28, 28, 0.18);
      }
      50% {
        transform: translateY(-10px);
        box-shadow: 0 38px 72px rgba(0, 0, 0, 0.64), 0 0 48px rgba(245, 158, 11, 0.22);
      }
    }

    @keyframes heroSimmer {
      0%, 100% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.025);
      }
    }

    .hero-frame {
      border-radius: 16px;
      overflow: hidden;
      border: 1px solid rgba(245, 158, 11, 0.32);
      background-color: #0B0F19;
      box-shadow: 0 28px 64px rgba(0, 0, 0, 0.55);
      animation: heroLevitate 5.5s ease-in-out infinite;
      will-change: transform;
    }

    .hero-frame img {
      width: 100%;
      height: 460px;
      object-fit: cover;
      display: block;
      animation: heroSimmer 8s ease-in-out infinite;
    }

    .hero-caption {
      padding: 18px 24px;
      background-color: #0E1525;
      border-top: 1px solid rgba(245, 158, 11, 0.2);
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    /* Sections */
    section {
      width: 100%;
    }

    .band-section {
      width: 100%;
      margin: 0;
      display: flex;
      justify-content: center;
      background-color: var(--bg-band);
      border-top: 1px solid rgba(245, 158, 11, 0.14);
      border-bottom: 1px solid rgba(245, 158, 11, 0.14);
    }

    .features-section {
      margin-top: 0;
      border-top: none;
    }

    .base-section {
      width: 100%;
      margin: 0;
      display: flex;
      justify-content: center;
      background-color: var(--bg-base);
    }

    .site-footer {
      width: 100%;
      display: flex;
      justify-content: center;
      background-color: var(--bg-footer);
      border-top: 1px solid rgba(245, 158, 11, 0.2);
    }

    .section-pad {
      margin-top: 0;
      margin-bottom: 0;
      padding-top: 84px;
      padding-bottom: 84px;
      display: flex;
      flex-direction: column;
      gap: 44px;
    }

    .section-head {
      display: flex;
      flex-wrap: wrap;
      align-items: flex-end;
      justify-content: space-between;
      gap: 20px;
    }

    .section-eyebrow {
      font-size: 12px;
      font-weight: 600;
      letter-spacing: 0.2em;
      color: var(--gold);
    }

    .section-title {
      margin: 0;
      font-family: 'Playfair Display', Georgia, serif;
      font-size: 38px;
      font-weight: 700;
      color: var(--text-primary);
      line-height: 1.2;
    }

    /* Core Features */
    .features-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(min(280px, 100%), 1fr));
      gap: 24px;
    }

    .features-grid .feature-card {
      background-color: var(--bg-card);
      border: 1px solid rgba(245, 158, 11, 0.2);
      border-radius: 14px;
      padding: 32px;
      display: flex;
      flex-direction: column;
      gap: 18px;
      transition: all 0.4s ease;
    }

    .features-grid .feature-card.is-revealed,
    .features-grid .feature-card.aos-animate:hover {
      transition: all 0.4s ease;
    }

    .features-grid .feature-card:hover,
    .features-grid .feature-card.aos-animate:hover {
      transform: translateY(-6px);
      border-color: rgba(245, 158, 11, 0.48);
      box-shadow: 0 18px 42px rgba(0, 0, 0, 0.46), 0 0 22px rgba(245, 158, 11, 0.16);
    }

    .feature-icon-box {
      width: 52px;
      height: 52px;
      border-radius: 12px;
      background-color: rgba(153, 27, 27, 0.35);
      border: 1px solid rgba(245, 158, 11, 0.35);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    /* Signature Menu */
    .menu-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(min(265px, 100%), 1fr));
      gap: 24px;
      align-items: stretch;
    }

    .menu-grid .dish-card {
      background-color: var(--bg-card);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 14px;
      overflow: hidden;
      display: flex;
      flex-direction: column;
      height: 100%;
      transition: all 0.4s ease;
    }

    .menu-grid .dish-card.is-revealed,
    .menu-grid .dish-card.aos-animate:hover {
      transition: all 0.4s ease;
    }

    .menu-grid .dish-card:hover,
    .menu-grid .dish-card.aos-animate:hover {
      transform: translateY(-8px);
      border-color: rgba(245, 158, 11, 0.55);
      box-shadow: 0 22px 48px rgba(0, 0, 0, 0.55), 0 0 28px rgba(185, 28, 28, 0.4), 0 0 18px rgba(245, 158, 11, 0.24);
    }

    .dish-thumb {
      width: 100%;
      height: 220px;
      overflow: hidden;
      flex-shrink: 0;
    }

    .dish-thumb img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
      transition: all 0.4s ease;
    }

    .menu-grid .dish-card:hover .dish-thumb img {
      transform: scale(1.05);
    }

    .dish-body {
      padding: 22px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      gap: 18px;
      flex: 1;
    }

    .dish-top {
      display: flex;
      flex-direction: column;
    }

    .dish-meta {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
      min-height: 38px;
      margin-bottom: 12px;
    }

    .dish-tag {
      white-space: nowrap;
      height: 28px;
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 0 10px;
      font-size: 0.75rem;
      font-weight: 600;
      line-height: 1;
      border-radius: 6px;
      flex-shrink: 0;
    }

    .dish-tag--hot {
      background-color: rgba(185, 28, 28, 0.28);
      border: 1px solid #DC2626;
      color: #FCA5A5;
    }

    .dish-tag--medium {
      background-color: rgba(245, 158, 11, 0.2);
      border: 1px solid #D97706;
      color: #FCD34D;
    }

    .dish-tag--mild-herbal {
      background-color: rgba(148, 163, 184, 0.16);
      border: 1px solid #64748B;
      color: #E2E8F0;
    }

    .dish-tag--mild-gold {
      background-color: rgba(253, 230, 138, 0.12);
      border: 1px solid rgba(245, 158, 11, 0.45);
      color: #FDE68A;
    }

    .dish-price {
      white-space: nowrap;
      font-weight: 700;
      font-size: 1.15rem;
      color: var(--gold);
      font-variant-numeric: tabular-nums;
      margin-left: auto;
      text-align: right;
      flex-shrink: 0;
      line-height: 1;
    }

    .dish-title {
      margin: 0 0 10px 0;
      font-family: 'Playfair Display', Georgia, serif;
      font-size: 20px;
      font-weight: 700;
      line-height: 1.35;
      min-height: 27px;
      color: #FAF7F2;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .dish-desc {
      margin: 0;
      font-size: 14px;
      line-height: 1.65;
      color: #D1D5DB;
    }

    .dish-cta {
      min-height: 44px;
      padding: 10px 14px;
      border-radius: 8px;
      border: 1px solid rgba(245, 158, 11, 0.35);
      background-color: rgba(245, 158, 11, 0.08);
      color: var(--gold-light);
      font-size: 13px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      transition: all 0.35s ease;
    }

    .dish-cta:hover {
      background-color: rgba(245, 158, 11, 0.18);
      border-color: var(--gold);
      color: var(--text-primary);
    }

    /* Buffet & Combo Packages */
    .combo-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(min(300px, 100%), 1fr));
      gap: 24px;
      align-items: stretch;
    }

    .combo-grid .combo-card {
      background-color: var(--bg-card);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 16px;
      padding: 34px 30px;
      display: flex;
      flex-direction: column;
      gap: 22px;
      transition: all 0.4s ease;
    }

    .combo-grid .combo-card.is-revealed,
    .combo-grid .combo-card.aos-animate:hover {
      transition: all 0.4s ease;
    }

    .combo-grid .combo-card.featured {
      background-color: var(--bg-card-featured);
      border-color: rgba(245, 158, 11, 0.45);
      box-shadow: 0 24px 48px rgba(0, 0, 0, 0.4);
    }

    .combo-grid .combo-card.is-selected {
      border: 2px solid var(--gold);
      box-shadow: 0 24px 52px rgba(245, 158, 11, 0.14);
    }

    .combo-grid .combo-card:hover,
    .combo-grid .combo-card.aos-animate:hover {
      transform: translateY(-8px);
      border-color: rgba(245, 158, 11, 0.58);
      box-shadow: 0 24px 52px rgba(0, 0, 0, 0.56), 0 0 30px rgba(185, 28, 28, 0.38), 0 0 20px rgba(245, 158, 11, 0.26);
    }

    .combo-grid .combo-card.is-selected:hover,
    .combo-grid .combo-card.is-selected.aos-animate:hover {
      border-color: var(--gold);
      box-shadow: 0 26px 56px rgba(0, 0, 0, 0.58), 0 0 34px rgba(245, 158, 11, 0.32), 0 0 24px rgba(185, 28, 28, 0.3);
    }

    .combo-btn {
      min-height: 46px;
      padding: 12px 18px;
      border-radius: 8px;
      border: 1px solid rgba(245, 158, 11, 0.45);
      background-color: rgba(245, 158, 11, 0.08);
      color: var(--text-primary);
      font-size: 14px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.35s ease;
    }

    .combo-btn:hover {
      background-color: rgba(245, 158, 11, 0.18);
      border-color: var(--gold);
    }

    .combo-card.is-selected .combo-btn,
    .combo-card.featured .combo-btn.is-active-crimson {
      border-color: var(--crimson);
      background-color: var(--crimson);
      box-shadow: 0 10px 24px rgba(185, 28, 28, 0.35);
    }

    .space-img-frame {
      border-radius: 14px;
      overflow: hidden;
      border: 1px solid rgba(245, 158, 11, 0.26);
      background-color: #0B0F19;
    }

    .space-img-frame img {
      width: 100%;
      height: 280px;
      object-fit: cover;
      display: block;
      transition: all 0.4s ease;
    }

    .space-img-frame:hover img {
      transform: scale(1.05);
    }

    /* Space & Booking */
    .booking-split {
      display: flex;
      flex-wrap: wrap;
      gap: 44px;
      align-items: stretch;
    }

    .space-col {
      flex: 1 1 480px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      gap: 24px;
    }

    .booking-col {
      flex: 1 1 500px;
      background-color: var(--bg-card);
      border: 1px solid rgba(245, 158, 11, 0.3);
      border-radius: 16px;
      padding: 36px;
      display: flex;
      flex-direction: column;
      gap: 24px;
      box-shadow: 0 24px 56px rgba(0, 0, 0, 0.45);
      scroll-margin-top: 96px;
    }

    .field-input {
      min-height: 46px;
      width: 100%;
      padding: 10px 14px;
      border-radius: 8px;
      border: 1px solid rgba(255, 255, 255, 0.16);
      background-color: var(--bg-band);
      color: var(--text-primary);
      font-family: inherit;
      font-size: 14px;
    }

    .field-textarea {
      width: 100%;
      padding: 12px 14px;
      border-radius: 8px;
      border: 1px solid rgba(255, 255, 255, 0.16);
      background-color: var(--bg-band);
      color: var(--text-primary);
      font-family: inherit;
      font-size: 14px;
      resize: vertical;
    }

    /* Footer (layout properties defined in Sections) */

    .social-btn {
      width: 44px;
      height: 44px;
      border-radius: 10px;
      background-color: var(--bg-card);
      border: 1px solid rgba(255, 255, 255, 0.12);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      color: #E5E7EB;
    }

    .social-btn:hover {
      border-color: var(--gold);
      color: var(--gold-bright);
    }

    @media (max-width: 960px) {
      .container {
        padding-left: 20px;
        padding-right: 20px;
      }
      .nav-links,
      .nav-actions .btn-pos {
        display: none;
      }
      .mobile-menu-toggle {
        display: inline-flex;
      }
      .hero-section {
        min-height: calc(100vh - 80px);
        padding: 28px 0;
      }
      .hero-inner {
        padding-top: 0;
        padding-bottom: 0;
        gap: 32px;
      }
      .hero-title {
        font-size: 36px;
      }
      .hero-frame img {
        height: 260px;
      }
      .section-pad {
        padding-top: 52px;
        padding-bottom: 52px;
        gap: 28px;
      }
      .section-title {
        font-size: 28px;
      }
      .booking-col {
        padding: 24px 18px;
      }
    }
  </style>
</head>
<body>

  <!-- Header / Navbar -->
  <header class="site-header">
    <div class="container nav-bar">
      <a href="#trang-chu" class="brand-link">
        <svg width="42" height="42" viewBox="0 0 42 42" fill="none" aria-hidden="true">
          <circle cx="21" cy="21" r="19.5" fill="#991B1B" stroke="#F59E0B" stroke-width="1.5"></circle>
          <circle cx="21" cy="21" r="15.5" stroke="rgba(253, 230, 138, 0.35)" stroke-width="1"></circle>
          <path d="M12 22.5H30C29.5 27.2 25.8 30 21 30C16.2 30 12.5 27.2 12 22.5Z" stroke="#FDE68A" stroke-width="1.6" stroke-linejoin="round"></path>
          <path d="M10.5 22.5H31.5" stroke="#F59E0B" stroke-width="1.8" stroke-linecap="round"></path>
          <path d="M17 17.5C17 15.8 18.2 15.2 18.2 13.5" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
          <path d="M21 17.5C21 15.5 22.4 14.8 22.4 12.8" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
          <path d="M25 17.5C25 15.8 26.2 15.2 26.2 13.5" stroke="#FDE68A" stroke-width="1.5" stroke-linecap="round"></path>
        </svg>
        <div class="brand-text">
          <span class="brand-title">HOUGO HOTPOT</span>
          <span class="brand-sub">TINH HOA LẨU TRUNG HOA</span>
        </div>
      </a>

      <nav aria-label="Điều hướng chính" class="nav-links">
        <a href="#trang-chu" class="active">Trang chủ</a>
        <a href="#menu-lau">Menu Lẩu</a>
        <a href="#combo">Combo</a>
        <a href="#khong-gian">Không gian</a>
        <a href="#dat-ban">Đặt bàn</a>
      </nav>

      <div class="nav-actions">
        <a href="${pageContext.request.contextPath}/pos" class="btn-pos">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <rect x="3" y="4" width="18" height="12" rx="2"></rect>
            <path d="M8 20H16"></path>
            <path d="M12 16V20"></path>
          </svg>
          <span>POS Nhân Viên</span>
        </a>
        <a href="#dat-ban" class="btn-primary btn-cta-pulse">
          <span>Đặt Bàn Ngay</span>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M5 12H19"></path>
            <path d="M13 6L19 12L13 18"></path>
          </svg>
        </a>
        <button type="button" id="mobileMenuBtn" class="mobile-menu-toggle" aria-label="Mở menu điều hướng" aria-expanded="false" aria-controls="mobileMenuDrawer">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M4 7H20"></path>
            <path d="M4 12H20"></path>
            <path d="M4 17H20"></path>
          </svg>
        </button>
      </div>
    </div>

    <nav id="mobileMenuDrawer" class="mobile-drawer" aria-label="Menu di động">
      <a href="#trang-chu">Trang chủ</a>
      <a href="#menu-lau">Menu Lẩu</a>
      <a href="#combo">Combo</a>
      <a href="#khong-gian">Không gian</a>
      <a href="#dat-ban">Đặt bàn</a>
      <div style="padding-top: 8px; display: flex; flex-direction: column; gap: 10px;">
        <a href="${pageContext.request.contextPath}/pos" class="btn-pos" style="justify-content: center;">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <rect x="3" y="4" width="18" height="12" rx="2"></rect>
            <path d="M8 20H16"></path>
            <path d="M12 16V20"></path>
          </svg>
          <span>POS Nhân Viên</span>
        </a>
        <a href="#dat-ban" class="btn-primary btn-cta-pulse">Đặt Bàn Ngay</a>
      </div>
    </nav>
  </header>

  <!-- Hero Section -->
  <section id="trang-chu" class="hero-section">
    <div class="container hero-inner">
      <div class="hero-copy">
        <div class="hero-badge">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M12 2L14.9 8.6L22 9.3L16.6 14L18.2 21L12 17.3L5.8 21L7.4 14L2 9.3L9.1 8.6L12 2Z"></path>
          </svg>
          <span style="font-size: 13px; font-weight: 600; letter-spacing: 0.04em; color: #FDE68A;">Best Hotpot 2026</span>
        </div>

        <h1 class="hero-title">
          Tinh Hoa Nước Lẩu Trăm Giờ — <span class="accent">Ấm Nồng Vị Trung Hoa</span>
        </h1>

        <p class="hero-desc">
          Nồi lẩu 2 ngăn và 4 ngăn nghi ngút khói, ninh chậm 12 giờ cùng thảo mộc quý, phục vụ bên bò nhập khẩu thái lát tươi và quầy gia vị hơn 20 loại pha chế độc bản.
        </p>

        <div class="hero-ctas">
          <a href="#dat-ban" class="btn-primary btn-cta-pulse">
            <span>Đặt Bàn Ngay</span>
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M5 12H19"></path>
              <path d="M13 6L19 12L13 18"></path>
            </svg>
          </a>
          <a href="#menu-lau" class="btn-outline-gold">
            <span>Khám Phá Thực Đơn</span>
          </a>
        </div>

        <div class="hero-metrics">
          <div class="hero-metric">
            <span class="hero-metric-val">12 Giờ</span>
            <span class="hero-metric-label">Nước lẩu hầm thảo mộc</span>
          </div>
          <div class="hero-metric">
            <span class="hero-metric-val">20+ Vị</span>
            <span class="hero-metric-label">Quầy nước chấm tự chọn</span>
          </div>
          <div class="hero-metric">
            <span class="hero-metric-val">4 Ngăn</span>
            <span class="hero-metric-label">Nồi đồng đa vị đặc trưng</span>
          </div>
        </div>
      </div>

      <div class="hero-visual">
        <div class="hero-frame">
          <img src="${pageContext.request.contextPath}/assets/images/hotpot/hero-hotpot.jpg" alt="Nồi lẩu 4 ngăn Hougo Hotpot bốc khói với 4 vị nước lẩu đặc trưng và thịt bò Wagyu">
          <div class="hero-caption">
            <div style="display: flex; flex-direction: column; gap: 4px;">
              <span style="font-size: 15px; font-weight: 600; color: #FAF7F2;">Nồi Lẩu Tứ Vị Thượng Hạng</span>
              <span style="font-size: 13px; color: #9CA3AF;">Tứ Xuyên Mala · Tomyum Hải Sản · Nấm Dưỡng Sinh · Cà Chua Collagen</span>
            </div>
            <span style="padding: 6px 14px; border-radius: 6px; background-color: rgba(185, 28, 28, 0.28); border: 1px solid rgba(185, 28, 28, 0.65); color: #FCA5A5; font-size: 13px; font-weight: 600; font-variant-numeric: tabular-nums;">Buffet từ 199K</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Core Features Section -->
  <section class="band-section features-section">
    <div class="container section-pad">
      <div class="section-head" data-aos="fade-up">
        <div style="display: flex; flex-direction: column; gap: 10px;">
          <span class="section-eyebrow">CAM KẾT CHẤT LƯỢNG</span>
          <h2 class="section-title">Ba Trụ Cột Tạo Nên Vị Lẩu Hougo</h2>
        </div>
        <p style="margin: 0; font-size: 15px; color: #9CA3AF; max-width: 420px; line-height: 1.65;">
          Mỗi nồi lẩu tại Hougo đều giữ trọn kỹ nghệ chế biến truyền thống kết hợp tiêu chuẩn phục vụ hiện đại.
        </p>
      </div>

      <div class="features-grid">
        <div class="feature-card" data-aos="fade-up" data-aos-delay="100">
          <div style="display: flex; align-items: center; justify-content: space-between;">
            <div class="feature-icon-box">
              <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M12 3C10.5 5 10 6.5 10 8C10 9.1 10.9 10 12 10C13.1 10 14 9.1 14 8C14 6.5 13.5 5 12 3Z"></path>
                <path d="M5 13H19C19 17.5 15.9 20.5 12 20.5C8.1 20.5 5 17.5 5 13Z"></path>
                <path d="M3 13H21"></path>
              </svg>
            </div>
            <span style="font-family: 'Playfair Display', Georgia, serif; font-size: 20px; font-weight: 600; color: rgba(245, 158, 11, 0.45);">01</span>
          </div>
          <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2; line-height: 1.3;">Nước Lẩu Hầm 12h Với Thảo Mộc</h3>
          <p style="margin: 0; font-size: 15px; line-height: 1.7; color: #D1D5DB;">
            Ninh chậm liên tục 12 giờ từ xương ống, táo đỏ Tân Cương, kỷ tử, đẳng sâm và thảo quả, chắt lọc vị ngọt thanh sâu lắng.
          </p>
        </div>

        <div class="feature-card" data-aos="fade-up" data-aos-delay="200">
          <div style="display: flex; align-items: center; justify-content: space-between;">
            <div class="feature-icon-box">
              <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M4 16C4 11 8 6 14 6C18.5 6 20 8.5 20 11.5C20 16 15.5 19 10 19C6.5 19 4 18 4 16Z"></path>
                <path d="M9 12.5C11 11 13.5 10.5 16 11"></path>
                <path d="M8.5 15.5C10.8 14.2 13.2 14 15.5 14.5"></path>
              </svg>
            </div>
            <span style="font-family: 'Playfair Display', Georgia, serif; font-size: 20px; font-weight: 600; color: rgba(245, 158, 11, 0.45);">02</span>
          </div>
          <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2; line-height: 1.3;">Bò Nhập Khẩu Thái Lát Tươi</h3>
          <p style="margin: 0; font-size: 15px; line-height: 1.7; color: #D1D5DB;">
            Bò Mỹ, bò Úc và Wagyu vân mỡ cẩm thạch được bảo quản chuẩn lạnh và thái lát mỏng ngay khi khách gọi, mềm mọng từng thớ thịt.
          </p>
        </div>

        <div class="feature-card" data-aos="fade-up" data-aos-delay="300">
          <div style="display: flex; align-items: center; justify-content: space-between;">
            <div class="feature-icon-box">
              <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M4 12H20C19.5 16.5 16.2 19.5 12 19.5C7.8 19.5 4.5 16.5 4 12Z"></path>
                <path d="M9 21H15"></path>
                <path d="M14 5L19 10"></path>
                <circle cx="9.5" cy="8" r="1.5"></circle>
              </svg>
            </div>
            <span style="font-family: 'Playfair Display', Georgia, serif; font-size: 20px; font-weight: 600; color: rgba(245, 158, 11, 0.45);">03</span>
          </div>
          <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 22px; font-weight: 700; color: #FAF7F2; line-height: 1.3;">Quầy Line Gia Vị Hơn 20 Loại</h3>
          <p style="margin: 0; font-size: 15px; line-height: 1.7; color: #D1D5DB;">
            Tự do pha chế nước chấm từ hơn 20 loại sốt đặc trưng: tương mè Đài Loan, sốt XO hải sản, sa tế Triều Châu và hướng dẫn phối vị chuẩn gu.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- Signature Menu (4 Best-Sellers) -->
  <section id="menu-lau" class="base-section">
    <div class="container section-pad">
      <div class="section-head" data-aos="fade-up">
        <div style="display: flex; flex-direction: column; gap: 10px;">
          <span class="section-eyebrow">SIGNATURE BROTHS</span>
          <h2 class="section-title">4 Set Nước Lẩu Best-Seller</h2>
        </div>
        <p style="margin: 0; font-size: 15px; color: #9CA3AF; max-width: 440px; line-height: 1.65;">
          Phục vụ linh hoạt dạng nồi 2 ngăn hoặc 4 ngăn để cả bàn cùng thưởng thức từ vị tê cay nồng nàn đến thanh ngọt dưỡng sinh.
        </p>
      </div>

      <div class="menu-grid">
        <!-- Dish 1: Lẩu Tứ Xuyên Mala -->
        <article class="dish-card" data-aos="fade-up" data-aos-delay="100">
          <div class="dish-thumb">
            <img src="${pageContext.request.contextPath}/assets/images/hotpot/dish-mala.jpg" alt="Lẩu Tứ Xuyên Mala đỏ rực với ớt khô và hoa tiêu">
          </div>
          <div class="dish-body">
            <div class="dish-top">
              <div class="dish-meta">
                <span class="dish-tag dish-tag--hot">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M12 2C12 2 17 7.5 17 13C17 16.5 14.8 19.5 12 21C9.2 19.5 7 16.5 7 13C7 10.5 8.5 8 10 6.5C10 9 11.5 10 12 10C12 7 12 2 12 2Z"></path>
                  </svg>
                  <span>Cay cấp 3</span>
                </span>
                <span class="dish-price">199.000đ</span>
              </div>
              <h3 class="dish-title">Lẩu Tứ Xuyên Mala</h3>
              <p class="dish-desc">
                Hòa quyện ớt Tứ Xuyên, hoa tiêu xanh đỏ, hồi quế và dầu bò chưng cất tạo vị tê cay bùng nổ chuẩn Trùng Khánh.
              </p>
            </div>
            <a href="#dat-ban" class="dish-cta" data-broth="Lẩu Tứ Xuyên Mala">Đặt bàn thử vị này</a>
          </div>
        </article>

        <!-- Dish 2: Lẩu Tomyum Hải Sản -->
        <article class="dish-card" data-aos="fade-up" data-aos-delay="200">
          <div class="dish-thumb">
            <img src="${pageContext.request.contextPath}/assets/images/hotpot/dish-tomyum.jpg" alt="Lẩu Tomyum Hải Sản với tôm sú, mực ống, vẹm xanh và sả chanh">
          </div>
          <div class="dish-body">
            <div class="dish-top">
              <div class="dish-meta">
                <span class="dish-tag dish-tag--medium">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M12 2C12 2 17 7.5 17 13C17 16.5 14.8 19.5 12 21C9.2 19.5 7 16.5 7 13C7 10.5 8.5 8 10 6.5C10 9 11.5 10 12 10C12 7 12 2 12 2Z"></path>
                  </svg>
                  <span>Cay cấp 2</span>
                </span>
                <span class="dish-price">219.000đ</span>
              </div>
              <h3 class="dish-title">Lẩu Tomyum Hải Sản</h3>
              <p class="dish-desc">
                Sả cây đập dập, riềng non, lá chanh kaffir và cốt dừa sánh quyện cùng vị chua cay kích thích, cực hợp hải sản tươi.
              </p>
            </div>
            <a href="#dat-ban" class="dish-cta" data-broth="Lẩu Tomyum Hải Sản">Đặt bàn thử vị này</a>
          </div>
        </article>

        <!-- Dish 3: Lẩu Nấm Dưỡng Sinh -->
        <article class="dish-card" data-aos="fade-up" data-aos-delay="300">
          <div class="dish-thumb">
            <img src="${pageContext.request.contextPath}/assets/images/hotpot/dish-mushroom.jpg" alt="Lẩu Nấm Dưỡng Sinh với nấm đông cô, nấm kim châm, táo đỏ và kỷ tử">
          </div>
          <div class="dish-body">
            <div class="dish-top">
              <div class="dish-meta">
                <span class="dish-tag dish-tag--mild-herbal">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <path d="M12 22V12"></path>
                    <path d="M12 12C7 12 4 8 4 4C9 4 12 7 12 12Z"></path>
                    <path d="M12 12C17 12 20 8 20 4C15 4 12 7 12 12Z"></path>
                  </svg>
                  <span>Không cay</span>
                </span>
                <span class="dish-price">179.000đ</span>
              </div>
              <h3 class="dish-title">Lẩu Nấm Dưỡng Sinh</h3>
              <p class="dish-desc">
                Tinh chất từ 8 loại nấm rừng, nhân sâm lát, kỷ tử và táo đỏ giúp nước dùng thanh khiết, bồi bổ và dễ dùng cho cả gia đình.
              </p>
            </div>
            <a href="#dat-ban" class="dish-cta" data-broth="Lẩu Nấm Dưỡng Sinh">Đặt bàn thử vị này</a>
          </div>
        </article>

        <!-- Dish 4: Lẩu Cà Chua Collagen -->
        <article class="dish-card" data-aos="fade-up" data-aos-delay="400">
          <div class="dish-thumb">
            <img src="${pageContext.request.contextPath}/assets/images/hotpot/dish-tomato.jpg" alt="Lẩu Cà Chua Collagen sóng sánh cùng cà chua nướng, bắp ngọt và thịt bò">
          </div>
          <div class="dish-body">
            <div class="dish-top">
              <div class="dish-meta">
                <span class="dish-tag dish-tag--mild-gold">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                    <circle cx="12" cy="12" r="8"></circle>
                    <path d="M9 10L12 13L15 10"></path>
                  </svg>
                  <span>Không cay</span>
                </span>
                <span class="dish-price">179.000đ</span>
              </div>
              <h3 class="dish-title">Lẩu Cà Chua Collagen</h3>
              <p class="dish-desc">
                Cà chua chín cây hầm nhuyễn hòa cùng nước cốt xương giàu collagen, vị chua ngọt dịu nhẹ bắt miệng khi nhúng thịt bò và đậu hũ non.
              </p>
            </div>
            <a href="#dat-ban" class="dish-cta" data-broth="Lẩu Cà Chua Collagen">Đặt bàn thử vị này</a>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- Buffet & Combo Packages Section -->
  <section id="combo" class="band-section">
    <div class="container section-pad">
      <div data-aos="fade-up" style="display: flex; flex-direction: column; align-items: center; text-align: center; gap: 12px;">
        <span class="section-eyebrow">BUFFET &amp; COMBO PACKAGES</span>
        <h2 class="section-title">Bảng Giá Buffet Lẩu Trọn Gói</h2>
        <p style="margin: 0; font-size: 15px; color: #9CA3AF; max-width: 580px; line-height: 1.65;">
          Lựa chọn gói buffet phù hợp cho bữa trưa nhanh gọn, buổi hẹn hò ấm áp hay tiệc tiếp khách thượng hạng.
        </p>
      </div>

      <div class="combo-grid">
        <!-- Combo 199K -->
        <div class="combo-card" data-combo="199K" data-aos="fade-up" data-aos-delay="100">
          <div style="display: flex; flex-direction: column; gap: 8px;">
            <span style="font-size: 12px; font-weight: 600; letter-spacing: 0.14em; color: #9CA3AF;">GÓI TIÊU CHUẨN</span>
            <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 26px; font-weight: 700; color: #FAF7F2;">Combo 199K</h3>
            <div style="display: flex; align-items: baseline; gap: 6px; padding-top: 4px;">
              <span style="font-size: 38px; font-weight: 700; color: #F59E0B; font-variant-numeric: tabular-nums;">199.000đ</span>
              <span style="font-size: 14px; color: #9CA3AF;">/ khách</span>
            </div>
            <p style="margin: 0; font-size: 14px; color: #D1D5DB; line-height: 1.6;">Trọn vị lẩu truyền thống cùng các món thịt và rau nấm tươi mỗi ngày.</p>
          </div>

          <div style="height: 1px; background-color: rgba(255, 255, 255, 0.1);"></div>

          <ul style="margin: 0; padding: 0; list-style: none; display: flex; flex-direction: column; gap: 12px; flex: 1;">
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Nồi lẩu 2 ngăn uyên ương tự chọn vị</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Ba chỉ bò Mỹ thái lát, nạc vai heo &amp; gà cuộn</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Viên thả lẩu Đài Loan, đậu hũ ky &amp; 12 loại rau nấm</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Quầy line gia vị pha chế hơn 20 loại</span>
            </li>
          </ul>

          <button type="button" class="combo-btn" data-select-combo="Combo 199K">Chọn Combo 199K</button>
        </div>

        <!-- Combo 269K (Featured) -->
        <div class="combo-card featured is-selected" data-combo="269K" data-aos="fade-up" data-aos-delay="200">
          <div style="display: flex; flex-direction: column; gap: 8px;">
            <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px;">
              <span style="font-size: 12px; font-weight: 600; letter-spacing: 0.14em; color: #F59E0B;">BEST SELLER</span>
              <span style="padding: 4px 10px; border-radius: 999px; background-color: #F59E0B; color: #111827; font-size: 11px; font-weight: 700;">PHỔ BIẾN NHẤT</span>
            </div>
            <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 26px; font-weight: 700; color: #FAF7F2;">Combo 269K</h3>
            <div style="display: flex; align-items: baseline; gap: 6px; padding-top: 4px;">
              <span style="font-size: 38px; font-weight: 700; color: #F59E0B; font-variant-numeric: tabular-nums;">269.000đ</span>
              <span style="font-size: 14px; color: #D1D5DB;">/ khách</span>
            </div>
            <p style="margin: 0; font-size: 14px; color: #E5E7EB; line-height: 1.6;">Cân bằng hoàn hảo giữa bò Mỹ – Úc nhập khẩu, hải sản tươi và dimsum nóng hổi.</p>
          </div>

          <div style="height: 1px; background-color: rgba(245, 158, 11, 0.25);"></div>

          <ul style="margin: 0; padding: 0; list-style: none; display: flex; flex-direction: column; gap: 12px; flex: 1;">
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #FAF7F2;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Nồi lẩu 2 ngăn hoặc 4 ngăn tự chọn</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #FAF7F2;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Gầu bò Mỹ, lõi vai bò Úc &amp; bò cuộn nấm kim châm</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #FAF7F2;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Hải sản tươi: tôm sú, mực ống cắt khoanh &amp; vẹm xanh</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #FAF7F2;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FBBF24" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Trọn gói quầy gia vị 20+ vị, dimsum &amp; chè dưỡng nhan</span>
            </li>
          </ul>

          <button type="button" class="combo-btn is-active-crimson" data-select-combo="Combo 269K">Đã Chọn Combo 269K</button>
        </div>

        <!-- Combo 329K -->
        <div class="combo-card" data-combo="329K" data-aos="fade-up" data-aos-delay="300">
          <div style="display: flex; flex-direction: column; gap: 8px;">
            <span style="font-size: 12px; font-weight: 600; letter-spacing: 0.14em; color: #9CA3AF;">GÓI THƯỢNG HẠNG</span>
            <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 26px; font-weight: 700; color: #FAF7F2;">Combo 329K</h3>
            <div style="display: flex; align-items: baseline; gap: 6px; padding-top: 4px;">
              <span style="font-size: 38px; font-weight: 700; color: #F59E0B; font-variant-numeric: tabular-nums;">329.000đ</span>
              <span style="font-size: 14px; color: #9CA3AF;">/ khách</span>
            </div>
            <p style="margin: 0; font-size: 14px; color: #D1D5DB; line-height: 1.6;">Trải nghiệm mỹ vị Wagyu thượng hạng, bào ngư và đồ uống thảo mộc không giới hạn.</p>
          </div>

          <div style="height: 1px; background-color: rgba(255, 255, 255, 0.1);"></div>

          <ul style="margin: 0; padding: 0; list-style: none; display: flex; flex-direction: column; gap: 12px; flex: 1;">
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Trọn bộ 4 ngăn với tất cả vị nước lẩu đặc biệt</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Bò Wagyu vân cẩm thạch &amp; dẻ sườn bò Mỹ không xương</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Bào ngư, sò điệp Nhật, chả tôm trúc ống làm tay</span>
            </li>
            <li style="display: flex; align-items: center; gap: 10px; font-size: 14px; color: #E5E7EB;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 13L9 17L19 7"></path></svg>
              <span>Không giới hạn trà thảo mộc &amp; kem tráng miệng cao cấp</span>
            </li>
          </ul>

          <button type="button" class="combo-btn" data-select-combo="Combo 329K">Chọn Combo 329K</button>
        </div>
      </div>
    </div>
  </section>

  <!-- Space Ambiance & Online Booking Section -->
  <section id="khong-gian" class="base-section">
    <div class="container section-pad">
      <div class="booking-split">
        <!-- Left: Dining Space Spotlight -->
        <div class="space-col" data-aos="fade-up" data-aos-delay="100">
          <div style="display: flex; flex-direction: column; gap: 12px;">
            <span class="section-eyebrow">KHÔNG GIAN ĐƯƠNG ĐẠI</span>
            <h2 class="section-title">Ánh Đèn Lồng Ấm Áp Cho Mọi Buổi Hội Ngộ</h2>
            <p style="margin: 0; font-size: 15px; color: #D1D5DB; line-height: 1.7;">
              Lấy cảm hứng từ trà quán Đài Loan giao hòa kiến trúc gỗ trầm và sơn mài đỏ thẫm, Hougo mang lại sự riêng tư êm ái cho bữa tối gia đình lẫn tiệc tiếp đãi đối tác.
            </p>
          </div>

          <div class="space-img-frame">
            <img src="${pageContext.request.contextPath}/assets/images/hotpot/space-interior.jpg" alt="Không gian nhà hàng Hougo Hotpot với vách gỗ tối màu, đèn lồng ấm và bàn đá cẩm thạch">
          </div>

          <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(min(210px, 100%), 1fr)); gap: 16px;">
            <div style="padding: 16px 18px; border-radius: 10px; background-color: #171F2E; border: 1px solid rgba(255, 255, 255, 0.08); display: flex; flex-direction: column; gap: 6px;">
              <span style="font-size: 14px; font-weight: 600; color: #FDE68A;">Phòng VIP Cách Âm</span>
              <span style="font-size: 13px; color: #9CA3AF; line-height: 1.55;">Phục vụ nhóm 8–20 khách với lối đi và nhân viên phục vụ riêng.</span>
            </div>
            <div style="padding: 16px 18px; border-radius: 10px; background-color: #171F2E; border: 1px solid rgba(255, 255, 255, 0.08); display: flex; flex-direction: column; gap: 6px;">
              <span style="font-size: 14px; font-weight: 600; color: #FDE68A;">Hệ Thống Hút Khói Âm Bàn</span>
              <span style="font-size: 13px; color: #9CA3AF; line-height: 1.55;">Giữ hương thơm dễ chịu, không ám mùi lên trang phục sau bữa ăn.</span>
            </div>
          </div>
        </div>

        <!-- Right: Online Booking Form -->
        <div id="dat-ban" class="booking-col" data-aos="fade-up" data-aos-delay="200">
          <div style="display: flex; flex-direction: column; gap: 8px;">
            <span class="section-eyebrow">ĐẶT BÀN TRỰC TUYẾN</span>
            <h3 style="margin: 0; font-family: 'Playfair Display', Georgia, serif; font-size: 30px; font-weight: 700; color: #FAF7F2;">Giữ Bàn Ngay Hôm Nay</h3>
            <p style="margin: 0; font-size: 14px; color: #9CA3AF;">Điền thông tin để Hougo chuẩn bị sẵn nồi lẩu và vị trí đẹp nhất cho bạn.</p>
          </div>

          <div id="bookingSuccessBanner" style="display: ${param.datBanThanhCong eq 'true' ? 'flex' : 'none'}; padding: 20px; border-radius: 12px; background-color: rgba(153, 27, 27, 0.25); border: 1px solid rgba(245, 158, 11, 0.5); flex-direction: column; gap: 10px;">
            <div style="display: flex; align-items: center; gap: 10px; color: #FDE68A; font-size: 16px; font-weight: 700;">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"></circle><path d="M8 12L11 15L16 9"></path></svg>
              <span>Đã Tiếp Nhận Yêu Cầu Đặt Bàn</span>
            </div>
            <p style="margin: 0; font-size: 14px; line-height: 1.6; color: #E5E7EB;">
              Cảm ơn quý khách! Lễ tân Hougo đã nhận được thông tin đặt bàn và sẽ gọi xác nhận qua số điện thoại trong ít phút.
            </p>
          </div>

          <form id="bookingForm" action="${pageContext.request.contextPath}/dat-ban" method="POST" style="display: flex; flex-direction: column; gap: 18px;">
            <input type="hidden" id="bk-combo" name="selectedCombo" value="Combo 269K">

            <div style="display: flex; flex-wrap: wrap; gap: 16px;">
              <div style="flex: 1 1 200px; display: flex; flex-direction: column; gap: 8px;">
                <label for="bk-name" style="font-size: 13px; font-weight: 600; color: #E5E7EB;">Họ và tên</label>
                <input id="bk-name" name="hoTen" type="text" placeholder="Nguyễn Minh Anh" required class="field-input">
              </div>
              <div style="flex: 1 1 200px; display: flex; flex-direction: column; gap: 8px;">
                <label for="bk-phone" style="font-size: 13px; font-weight: 600; color: #E5E7EB;">Số điện thoại</label>
                <input id="bk-phone" name="soDienThoai" type="tel" placeholder="090x xxx xxx" required class="field-input">
              </div>
            </div>

            <div style="display: flex; flex-wrap: wrap; gap: 16px;">
              <div style="flex: 1 1 180px; display: flex; flex-direction: column; gap: 8px;">
                <label for="bk-guests" style="font-size: 13px; font-weight: 600; color: #E5E7EB;">Số khách</label>
                <select id="bk-guests" name="soKhach" class="field-input">
                  <option value="2">2 khách</option>
                  <option value="4" selected>4 khách</option>
                  <option value="6">6 khách</option>
                  <option value="8-12">8–12 khách (Bàn lớn)</option>
                  <option value="12-20">12–20 khách (Phòng VIP)</option>
                </select>
              </div>
              <div style="flex: 1 1 220px; display: flex; flex-direction: column; gap: 8px;">
                <label for="bk-datetime" style="font-size: 13px; font-weight: 600; color: #E5E7EB;">Ngày &amp; giờ</label>
                <input id="bk-datetime" name="ngayGio" type="datetime-local" required class="field-input">
              </div>
            </div>

            <div style="display: flex; flex-direction: column; gap: 8px;">
              <label for="bk-branch" style="font-size: 13px; font-weight: 600; color: #E5E7EB;">Chi nhánh</label>
              <select id="bk-branch" name="chiNhanh" class="field-input">
                <option value="Chi nhánh Quận 1 — TP.HCM">Chi nhánh Quận 1 — [Địa chỉ Quận 1, TP.HCM]</option>
                <option value="Chi nhánh Quận 3 — TP.HCM">Chi nhánh Quận 3 — [Địa chỉ Quận 3, TP.HCM]</option>
                <option value="Chi nhánh Hoàn Kiếm — Hà Nội">Chi nhánh Hoàn Kiếm — [Địa chỉ Hoàn Kiếm, Hà Nội]</option>
              </select>
            </div>

            <div style="display: flex; flex-direction: column; gap: 8px;">
              <label for="bk-note" style="font-size: 13px; font-weight: 600; color: #E5E7EB;">Ghi chú</label>
              <textarea id="bk-note" name="ghiChu" rows="3" placeholder="Ví dụ: Combo 269K, lẩu 4 ngăn, bàn yên tĩnh hoặc ghế trẻ em..." class="field-textarea">Combo 269K — Yêu cầu giữ bàn</textarea>
            </div>

            <button type="submit" class="btn-primary" style="min-height: 50px; width: 100%; font-size: 15px;">
              <span>Xác Nhận Đặt Bàn</span>
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M5 12H19"></path>
                <path d="M13 6L19 12L13 18"></path>
              </svg>
            </button>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="site-footer">
    <div class="container" style="padding-top: 64px; padding-bottom: 40px; display: flex; flex-direction: column; gap: 44px;">
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(min(240px, 100%), 1fr)); gap: 36px;">
        <div style="display: flex; flex-direction: column; gap: 14px;">
          <div style="display: flex; align-items: center; gap: 12px;">
            <svg width="34" height="34" viewBox="0 0 42 42" fill="none" aria-hidden="true">
              <circle cx="21" cy="21" r="19.5" fill="#991B1B" stroke="#F59E0B" stroke-width="1.5"></circle>
              <path d="M12 22.5H30C29.5 27.2 25.8 30 21 30C16.2 30 12.5 27.2 12 22.5Z" stroke="#FDE68A" stroke-width="1.6" stroke-linejoin="round"></path>
              <path d="M10.5 22.5H31.5" stroke="#F59E0B" stroke-width="1.8" stroke-linecap="round"></path>
            </svg>
            <span style="font-family: 'Playfair Display', Georgia, serif; font-size: 20px; font-weight: 700; letter-spacing: 0.1em; color: #FAF7F2;">HOUGO HOTPOT</span>
          </div>
          <p style="margin: 0; font-size: 14px; line-height: 1.7; color: #9CA3AF;">
            Nhà hàng lẩu Trung Hoa &amp; Đài Loan hiện đại. Chuyên phục vụ nước lẩu hầm thảo mộc 12 giờ, thịt bò nhập khẩu tươi và phòng tiệc ấm cúng.
          </p>
        </div>

        <div style="display: flex; flex-direction: column; gap: 12px;">
          <h4 style="margin: 0; font-size: 13px; font-weight: 700; letter-spacing: 0.14em; color: #F59E0B;">HỆ THỐNG CHI NHÁNH</h4>
          <div style="display: flex; flex-direction: column; gap: 10px; font-size: 14px; color: #D1D5DB; line-height: 1.6;">
            <div><strong style="color: #FAF7F2;">Quận 1:</strong> [Số nhà, Đường, Quận 1, TP.HCM]</div>
            <div><strong style="color: #FAF7F2;">Quận 3:</strong> [Số nhà, Đường, Quận 3, TP.HCM]</div>
            <div><strong style="color: #FAF7F2;">Hà Nội:</strong> [Số nhà, Đường, Hoàn Kiếm, Hà Nội]</div>
          </div>
        </div>

        <div style="display: flex; flex-direction: column; gap: 12px;">
          <h4 style="margin: 0; font-size: 13px; font-weight: 700; letter-spacing: 0.14em; color: #F59E0B;">GIỜ MỞ CỬA &amp; HOTLINE</h4>
          <div style="display: flex; flex-direction: column; gap: 10px; font-size: 14px; color: #D1D5DB; line-height: 1.6;">
            <div>Thứ 2 – Chủ Nhật: <strong style="color: #FAF7F2;">10:30 – 22:30</strong></div>
            <div>Nhận khách cuối: 21:45</div>
            <div>Hotline đặt bàn: <strong style="color: #FDE68A; font-size: 16px;">[1900 xxxx]</strong></div>
            <div>Email: [contact@hougohotpot.vn]</div>
          </div>
        </div>

        <div style="display: flex; flex-direction: column; gap: 14px;">
          <h4 style="margin: 0; font-size: 13px; font-weight: 700; letter-spacing: 0.14em; color: #F59E0B;">MẠNG XÃ HỘI</h4>
          <p style="margin: 0; font-size: 14px; color: #9CA3AF; line-height: 1.6;">
            Theo dõi Hougo để cập nhật thực đơn theo mùa và ưu đãi hội viên.
          </p>
          <div style="display: flex; align-items: center; gap: 12px;">
            <a href="#trang-chu" aria-label="Facebook Hougo Hotpot" class="social-btn">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M18 2H15C12.2 2 10 4.2 10 7V10H7V14H10V22H14V14H17L18 10H14V7C14 6.4 14.4 6 15 6H18V2Z"></path>
              </svg>
            </a>
            <a href="#trang-chu" aria-label="Instagram Hougo Hotpot" class="social-btn">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <rect x="2" y="2" width="20" height="20" rx="5"></rect>
                <circle cx="12" cy="12" r="4"></circle>
                <circle cx="17.5" cy="6.5" r="0.8"></circle>
              </svg>
            </a>
            <a href="#trang-chu" aria-label="TikTok Hougo Hotpot" class="social-btn">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M9 12A4 4 0 1 0 13 16V4C14 6.5 16.5 8 19 8"></path>
              </svg>
            </a>
          </div>
        </div>
      </div>

      <div style="padding-top: 24px; border-top: 1px solid rgba(255, 255, 255, 0.08); display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between; gap: 16px; font-size: 13px; color: #9CA3AF;">
        <span>© 2026 HOUGO HOTPOT. Bảo lưu mọi quyền.</span>
        <a href="${pageContext.request.contextPath}/pos" style="color: #9CA3AF; font-size: 13px;">Truy cập Cổng POS Nhân Viên</a>
      </div>
    </div>
  </footer>

  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    (function () {
      if (typeof AOS !== 'undefined') {
        AOS.init({ duration: 800, once: true });
        window.addEventListener('load', function () {
          AOS.refresh();
        });
      } else {
        document.querySelectorAll('[data-aos]').forEach(function (el) {
          el.style.opacity = '1';
          el.style.transform = 'none';
        });
      }
    })();
  </script>
  <script>
    (function () {
      var siteHeader = document.querySelector('.site-header');
      var navLinks = document.querySelectorAll('.nav-links a');
      var mobileMenuBtn = document.getElementById('mobileMenuBtn');
      var mobileMenuDrawer = document.getElementById('mobileMenuDrawer');
      var comboCards = document.querySelectorAll('.combo-card');
      var comboHiddenInput = document.getElementById('bk-combo');
      var noteField = document.getElementById('bk-note');
      var datetimeInput = document.getElementById('bk-datetime');
      var brothButtons = document.querySelectorAll('[data-broth]');

      function updateHeaderOnScroll() {
        if (!siteHeader) return;
        var scrollTop = window.scrollY || window.pageYOffset || 0;
        siteHeader.classList.toggle('is-scrolled', scrollTop > 50);
      }

      updateHeaderOnScroll();
      window.addEventListener('scroll', updateHeaderOnScroll, { passive: true });

      function resolveTargetSection(hash) {
        if (!hash || hash === '#') return null;
        if (hash === '#menu') {
          return document.getElementById('menu-lau') || document.getElementById('menu');
        }
        return document.querySelector(hash);
      }

      function scrollToTarget(targetEl) {
        if (!targetEl) return;
        var headerHeight = siteHeader ? siteHeader.offsetHeight : 0;
        var targetTop = targetEl.getBoundingClientRect().top + (window.scrollY || window.pageYOffset || 0);
        var destination = Math.max(0, targetTop - headerHeight - 12);
        window.scrollTo({ top: destination, behavior: 'smooth' });
      }

      function setActiveNavLink(hash) {
        var normalized = hash === '#menu' ? '#menu-lau' : hash;
        navLinks.forEach(function (item) {
          item.classList.toggle('active', item.getAttribute('href') === normalized);
        });
      }

      document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener('click', function (e) {
          var href = anchor.getAttribute('href');
          var targetEl = resolveTargetSection(href);
          if (!targetEl) return;
          e.preventDefault();
          scrollToTarget(targetEl);
          setActiveNavLink(href);
          if (mobileMenuDrawer && mobileMenuDrawer.classList.contains('is-open')) {
            mobileMenuDrawer.classList.remove('is-open');
            if (mobileMenuBtn) mobileMenuBtn.setAttribute('aria-expanded', 'false');
          }
          if (window.history && window.history.replaceState) {
            window.history.replaceState(null, '', href === '#menu' ? '#menu-lau' : href);
          }
        });
      });

      document.querySelectorAll('.feature-card[data-aos], .dish-card[data-aos], .combo-card[data-aos]').forEach(function (card) {
        card.addEventListener('transitionend', function (e) {
          if (e.target === card && card.classList.contains('aos-animate') && (e.propertyName === 'transform' || e.propertyName === 'opacity')) {
            card.classList.add('is-revealed');
          }
        });
      });

      if (mobileMenuBtn && mobileMenuDrawer) {
        mobileMenuBtn.addEventListener('click', function () {
          var isOpen = mobileMenuDrawer.classList.toggle('is-open');
          mobileMenuBtn.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
        });
      }

      if (datetimeInput && !datetimeInput.value) {
        var now = new Date();
        now.setMinutes(0, 0, 0);
        now.setHours(19);
        var pad = function (n) { return n < 10 ? '0' + n : String(n); };
        datetimeInput.value =
          now.getFullYear() + '-' +
          pad(now.getMonth() + 1) + '-' +
          pad(now.getDate()) + 'T' +
          pad(now.getHours()) + ':' +
          pad(now.getMinutes());
      }

      function selectCombo(comboLabel) {
        comboCards.forEach(function (card) {
          var btn = card.querySelector('[data-select-combo]');
          var label = btn ? btn.getAttribute('data-select-combo') : '';
          var active = label === comboLabel;
          card.classList.toggle('is-selected', active);
          if (btn) {
            btn.classList.toggle('is-active-crimson', active);
            btn.textContent = active ? ('Đã Chọn ' + label) : ('Chọn ' + label);
          }
        });

        if (comboHiddenInput) {
          comboHiddenInput.value = comboLabel;
        }
        if (noteField) {
          noteField.value = comboLabel + ' — Yêu cầu giữ bàn';
        }
      }

      comboCards.forEach(function (card) {
        var btn = card.querySelector('[data-select-combo]');
        if (!btn) return;
        btn.addEventListener('click', function () {
          selectCombo(btn.getAttribute('data-select-combo'));
        });
      });

      brothButtons.forEach(function (link) {
        link.addEventListener('click', function () {
          var broth = link.getAttribute('data-broth');
          if (!noteField || !broth) return;
          var current = (noteField.value || '').trim();
          if (current.indexOf(broth) === -1) {
            noteField.value = current ? (current + ' | Thử vị: ' + broth) : ('Thử vị: ' + broth);
          }
        });
      });

      if (window.location.search.indexOf('datBanThanhCong=true') !== -1) {
        var bookingSection = document.getElementById('dat-ban');
        if (bookingSection) {
          scrollToTarget(bookingSection);
          setActiveNavLink('#dat-ban');
        }
      }
    })();
  </script>
</body>
</html>

