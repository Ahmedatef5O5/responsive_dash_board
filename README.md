<div align="center">

# 💰 FinDash

<img src="assets/banner.svg" alt="FinDash Banner" width="100%"/>

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![fl_chart](https://img.shields.io/badge/fl__chart-latest-FF6384?style=for-the-badge)](https://pub.dev/packages/fl_chart)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Mobile%20%7C%20Tablet%20%7C%20Desktop-brightgreen?style=for-the-badge)](https://flutter.dev/multi-platform)

**A modern, fully responsive Admin Dashboard built with Flutter.**  
Dynamically adapts across mobile, tablet, and desktop using custom `AdaptiveLayout` and `SizeConfig` utilities.

[Getting Started](#-getting-started) · [Features](#-features) · [Architecture](#-architecture) · [Screenshots](#-screenshots) · [Roadmap](#%EF%B8%8F-roadmap)

</div>

---

## 📖 About

**FinDash** is a production-ready financial admin dashboard built entirely with Flutter. It demonstrates a clean, scalable architecture that elegantly handles layout adaptation across all screen sizes — from compact mobile viewports to wide desktop monitors — without a single line of platform-specific code.

The dashboard gives users a real-time financial overview, including balance tracking, income & expenses breakdown, transaction history, quick invoice creation, and interactive pie charts — all rendered beautifully across every device class.

> Built as a showcase of Flutter's power for adaptive UI development, FinDash proves that a single codebase can deliver a pixel-perfect experience on every platform.

---

## ✨ Features

| Feature | Description |
|---|---|
| 📐 **Adaptive Layouts** | Three dedicated layouts (`DashboardMobileLayout`, `DashboardTabletLayout`, `DashboardDesktopLayout`) selected automatically at runtime via `AdaptiveLayout` + `LayoutBuilder` using breakpoints: `< 800px` → Mobile, `< 1300px` → Tablet, `≥ 1300px` → Desktop |
| 🗂️ **Custom Drawer** | Fully functional side navigation with user profile (`UserInfoListtile`), active/inactive navigation items with visual indicator, and bottom actions (Settings & Logout) — slides in as a drawer on mobile |
| 📊 **Interactive Pie Chart (FL Charts)** | Touch-responsive donut chart with animated segment expansion showing income breakdown: Design Service (40%), Design Product (25%), Product Royalties (20%), Other (22%) |
| 💳 **My Cards Section** | `ExpandablePageView`-powered card carousel with animated dot indicators (`CustomDotIndicator`) for smooth swipe-through navigation between multiple cards |
| 📋 **All Expenses Panel** | Three selectable expense categories (Balance, Income, Expenses) with active/inactive visual states and range filter options |
| ⚡ **Quick Invoice** | Inline invoice creation form with Recipient, Amount, and Bank Name fields plus Cancel and Send Payment action buttons |
| 🔄 **Transaction History** | Color-coded transaction list distinguishing withdrawals (`#f3735e`) from deposits (`#7cd87a`) with title, subtitle, and amount displayed in `TransactionItem` cards |
| 🔤 **Responsive Typography** | Custom `getResponsiveFontSize()` utility scales all text with `clamp(min, scaleFactor × baseSize, max)` based on the current viewport width |
| 🎨 **Consistent App Styles** | Centralized `AppStyles` class with Montserrat font definitions (`styleRegular12` → `styleSemiBold24`) ensuring visual cohesion throughout the app |

---

## 🏗️ Architecture

FinDash follows a clean UI architecture that clearly separates concerns:

```
responsive_dash_board/
│
├── main.dart                          # App entry point (DevicePreview enabled)
│
├── views/
│   └── dash_board_view.dart           # Root view — orchestrates layout switching via AdaptiveLayout
│
├── layouts/
│   ├── dashboard_desktop_layout.dart  # Desktop: Drawer + two-column content area
│   ├── dashboard_tablet_layout.dart   # Tablet: Drawer + single-column scrollable content
│   └── dashboard_mobile_layout.dart   # Mobile: Stacked vertical scroll, no persistent drawer
│
├── widgets/
│   ├── adaptive_layout.dart           # Core layout switcher using LayoutBuilder + breakpoints
│   ├── custom_drawer.dart             # Sidebar navigation (user info + nav items + settings/logout)
│   ├── active&inActive_drawer_item.dart   # Active (highlighted) and inactive drawer list tiles
│   ├── drawer_items_list_view.dart    # ListView of all drawer nav items
│   ├── user_info_list_tile.dart       # User profile tile (avatar SVG + name + email)
│   │
│   ├── all_expenses_and_quick_invoice_section.dart  # Composite section (Expenses + Invoice)
│   ├── all_expenses.dart              # All Expenses card container
│   ├── all_expenses_header.dart       # Header row (title + RangeOptions)
│   ├── all_expenses_item.dart         # Single selectable expense item (active/inactive)
│   ├── all_expenses_item_list_view.dart   # Stateful row of 3 selectable expense items
│   ├── all_expenses_item_header.dart  # Icon circle + directional arrow per item
│   ├── inactive&active_all_expenses_item.dart  # Two visual states for expense items
│   ├── range_options.dart             # Date/range filter selector
│   │
│   ├── my_cards_and_transaction_history.dart  # Composite section (Cards + Transactions)
│   ├── my_cards_section.dart          # ExpandablePageView card carousel
│   ├── custom_dot_indicator.dart      # Animated dot indicator (active = wide pill)
│   ├── dots_indicator.dart            # Row of 3 animated dot indicators
│   ├── transaction_item.dart          # Single transaction Card (title + subtitle + colored amount)
│   ├── transaction_item_list.dart     # Column of TransactionModel items
│   │
│   ├── income_section.dart            # Income section container
│   ├── detailed_income_chart.dart     # Interactive PieChart (fl_chart) with touch response
│   ├── income_details.dart            # Income legend/detail section
│   ├── item_details.dart              # Single colored legend row
│   │
│   ├── quick_invoice_widget.dart      # Quick invoice form with CustomTextField + CustomButton
│   ├── custom_text_field.dart         # Styled TextField with rounded border
│   ├── custom_button.dart             # Reusable button with color + text props
│   └── custom_background_container.dart  # White rounded container used across sections
│
├── models/
│   ├── all_expenses_item_model.dart   # { image, title, date, price }
│   ├── drawer_item_model.dart         # { image, title }
│   ├── item_details_model.dart        # { color, title, value }
│   ├── transaction_model.dart         # { title, subTitle, amount, isWithdrawal }
│   └── user_info_model.dart           # { image, title, subTitle }
│
└── utils/
    ├── app_styles.dart                # Centralized TextStyle definitions (Montserrat)
    ├── app_images.dart                # Assets constants class (all SVG/PNG paths)
    ├── responsive_font_size.dart      # getResponsiveFontSize() + getScaleFactor()
    └── size_config.dart               # SizeConfig (tablet: 900, desktop: 1300 breakpoints)
```

---

## 📸 Screenshots

<table>
  <tr>
    <th align="center">🖥️ Desktop</th>
    <th align="center">📱 Tablet</th>
    <th align="center">📲 Mobile</th>
  </tr>
  <tr>
    <td align="center">
      <img src="screenshots/desktop.png" alt="Desktop Layout" width="420"/>
      <br/><sub>Full two-column layout with persistent sidebar</sub>
    </td>
    <td align="center">
      <img src="screenshots/tablet.png" alt="Tablet Layout" width="280"/>
      <br/><sub>Sidebar + single-column scrollable content</sub>
    </td>
    <td align="center">
      <img src="screenshots/mobile.png" alt="Mobile Layout" width="180"/>
      <br/><sub>Stacked vertical layout with hamburger drawer</sub>
    </td>
  </tr>
</table>

> 📌 **Note:** Screenshots folder (`/screenshots`) not included in the repo yet. Run the app with `device_preview` enabled to preview all breakpoints in one window.

---

## 🛠️ Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| [Flutter](https://flutter.dev) | `^3.x` | Cross-platform UI framework |
| [Dart](https://dart.dev) | `^3.x` | Programming language |
| [fl_chart](https://pub.dev/packages/fl_chart) | latest | Interactive `PieChart` for income visualization |
| [expandable_page_view](https://pub.dev/packages/expandable_page_view) | latest | Adaptive-height `PageView` for the cards carousel |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | latest | SVG asset rendering for all icons and avatars |
| [device_preview](https://pub.dev/packages/device_preview) | latest | Multi-device testing and layout verification in development |

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed before running the project:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `3.x` or higher
- [Dart SDK](https://dart.dev/get-dart) `3.x` or higher
- A connected device, simulator, or web browser
- `flutter doctor` passing with no critical errors

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/AbdElhameidKhaled/responsive-admin-dashboard.git
cd responsive-admin-dashboard
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Run the app**

```bash
# Run on the default connected device (with DevicePreview)
flutter run

# Run specifically on Chrome (web)
flutter run -d chrome

# Run on macOS desktop
flutter run -d macos
```

**4. Test responsiveness**

The app launches with `device_preview` enabled by default. Use the DevicePreview toolbar to switch between device frames and verify all three layout breakpoints:

| Breakpoint | Condition | Layout Used |
|---|---|---|
| Mobile | `width < 800px` | `DashboardMobileLayout` |
| Tablet | `800px ≤ width < 1300px` | `DashboardTabletLayout` |
| Desktop | `width ≥ 1300px` | `DashboardDesktopLayout` |

> **Tip:** To disable `DevicePreview` for a production build, set `enabled: false` in `main.dart`:
> ```dart
> DevicePreview(enabled: false, builder: (context) => const DashBoardApp())
> ```

---

## 🗺️ Roadmap

The following improvements are planned for future versions of FinDash:

- [ ] **BLoC / Cubit State Management** — Migrate from stateful widgets to BLoC pattern for scalable, testable state across all sections
- [ ] **Dark Mode Support** — Implement a full `ThemeData` dark theme toggled via a persistent user preference
- [ ] **REST API Integration** — Connect to a real financial backend API to replace all hardcoded mock data
- [ ] **Authentication Flow** — Add Login / Sign-up screens and route guarding
- [ ] **Localization (i18n)** — Multi-language support using Flutter's `intl` package
- [ ] **Unit & Widget Tests** — Full test coverage for models, utils, and key widgets
- [ ] **Animations** — Add page transition animations and subtle micro-interactions on dashboard load

---

## 👤 Author

<div align="center">

**Ahmed Atef**

[![GitHub](https://img.shields.io/badge/GitHub-AhmedAtef-181717?style=for-the-badge&logo=github)](https://github.com/AbdElhameidKhaled)

</div>

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ and Flutter

<sub>⭐ If this project helped you, consider giving it a star on GitHub!</sub>

</div>