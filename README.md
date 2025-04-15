# CompactUI Dashboard

A modern, elegant, and space-efficient CSS framework for creating compact dashboards.
This framework reduces UI element footprint by approximately 30% compared to typical
dashboards while maintaining readability and aesthetics.

![CompactUI Dashboard Preview](docs/preview.png)

## Features

- **Space Efficiency**: Uses ~70% of the space of standard UI dashboards
- **Variable-Based Design**: Fully customizable through CSS variables
- **Responsive Layout**: Works seamlessly across desktop and mobile devices
- **Dark Mode Support**: Built-in dark theme with easy toggle
- **Minimal Dependencies**: No JavaScript frameworks required
- **Small Footprint**: Lightweight CSS with no bloat
- **Modern Aesthetics**: Clean, elegant design language

## Getting Started

### Installation

Using npm:
  ```bash
  npm install compact-ui-css
  ```

Using yarn:
  ```bash
  yarn add compact-ui-css
  ```

Then import in your project:
  ```js
  // ES Module syntax
  import 'compact-ui-css';

  // CommonJS syntax
  require('compact-ui-css');
  ```

Or use directly in HTML:
  ```html
  <link rel="stylesheet" href="node_modules/compact-ui-css/dist/compact-ui.min.css">
  ```

Optional: include Font Awesome for icons:
   ```html
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
   ```

Use the HTML structure from the example in `examples/index.html`

### Direct Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/panta/compact-ui.git
   ```

2. Include the CSS in your HTML:
   ```html
   <link rel="stylesheet" href="path/to/compact-ui.css">
   ```

3. Optional: include Font Awesome for icons:
   ```html
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
   ```

4. Use the HTML structure from the example in `examples/index.html`

### Using with a Framework

#### React

```bash
npm install compact-ui-css
```

```jsx
import 'compact-ui-css/dist/compact-ui.css';

function Dashboard() {
  return (
    <div className="dashboard">
      {/* Dashboard content */}
    </div>
  );
}
```

#### Vue

```bash
npm install compact-ui-css
```

```vue
<template>
  <div class="dashboard">
    <!-- Dashboard content -->
  </div>
</template>

<script>
import 'compact-ui-css/dist/compact-ui.css';

export default {
  name: 'Dashboard'
}
</script>
```

## Customization

### Theme Colors

CompactUI uses CSS variables for easy customization. Override these in your CSS:

```css
:root {
  --color-primary: #10b981; /* Changes primary color to green */
  --color-bg: #f0f4f8;      /* Changes background color */
  /* Other overrides */
}
```

### Using Predefined Themes

Add these classes to the `<body>` element:

```html
<!-- Blue theme -->
<body class="theme-blue">

<!-- Green theme -->
<body class="theme-green">

<!-- Purple theme -->
<body class="theme-purple">
```

### Toggle Dark Mode

```javascript
// Toggle dark mode
document.body.classList.toggle('dark-mode');

// Check if dark mode is enabled
const isDarkMode = document.body.classList.contains('dark-mode');
```

### Adjusting Font Sizes

```css
:root {
  --font-size-base: 0.625rem;  /* Increase base font size to 10px */
  /* Other font size adjustments */
}
```

## Components

### Dashboard Layout

#### Dashboard Layout - Sidebar

```html
<div class="dashboard sidebar-layout">
  <!-- Sidebar -->
  <aside class="sidebar">
    <div class="sidebar-header">
      <div class="sidebar-logo">CompactUI</div>
    </div>
    <ul class="sidebar-menu">
      <li class="sidebar-menu-item">
        <a href="#" class="sidebar-menu-link active">
          <i class="sidebar-menu-icon fas fa-home"></i>
          Dashboard
        </a>
      </li>
      <!-- More menu items -->
    </ul>
  </aside>

  <!-- Header -->
  <header class="header">
    <!-- Header content -->
  </header>

  <!-- Main Content -->
  <main class="main">
    <!-- Main content -->
  </main>
</div>
```

#### Dashboard Layout - Top Navigation

```html
<div class="dashboard topnav-layout">
  <!-- Top Navigation -->
  <nav class="topnav">
    <div class="topnav-logo">
      <div class="topnav-logo-text">CompactUI</div>
    </div>
    <ul class="topnav-menu">
      <li class="topnav-menu-item">
        <a href="#" class="topnav-menu-link active">
          <i class="topnav-menu-icon fas fa-home"></i>
          Dashboard
        </a>
      </li>
      <!-- More menu items -->
    </ul>
    <button class="topnav-toggle">
      <i class="fas fa-bars"></i>
    </button>
  </nav>

  <!-- Header -->
  <header class="header">
    <!-- Header content -->
  </header>

  <!-- Main Content -->
  <main class="main">
    <!-- Main content -->
  </main>
</div>
```

#### Switching Between Layouts

##### JavaScript for Layout Switching

```javascript
// Function to switch layouts
function switchLayout(layoutType) {
  const dashboard = document.querySelector('.dashboard');
  
  // Remove existing layout classes
  dashboard.classList.remove('sidebar-layout', 'topnav-layout');
  
  // Add the selected layout class
  dashboard.classList.add(`${layoutType}-layout`);
  
  // Save preference to localStorage
  localStorage.setItem('preferredLayout', layoutType);
}

// Load user's preferred layout
document.addEventListener('DOMContentLoaded', () => {
  const preferredLayout = localStorage.getItem('preferredLayout') || 'sidebar';
  switchLayout(preferredLayout);
  
  // Add event listeners to layout toggle buttons
  document.getElementById('sidebar-layout-toggle').addEventListener('click', () => {
    switchLayout('sidebar');
  });
  
  document.getElementById('topnav-layout-toggle').addEventListener('click', () => {
    switchLayout('topnav');
  });
});
```

##### Adding Layout Toggle UI

Add these buttons to your settings or preferences section:

```html
<div class="layout-toggles">
  <button id="sidebar-layout-toggle" class="button button-secondary">
    <i class="fas fa-columns button-icon"></i>
    Sidebar Layout
  </button>
  <button id="topnav-layout-toggle" class="button button-secondary">
    <i class="fas fa-bars button-icon"></i>
    Top Navigation Layout
  </button>
</div>
```

#### Mobile Menu Implementations

##### Mobile Toggle for Sidebar Layout

```javascript
// Toggle mobile sidebar
document.querySelector('.sidebar-toggle').addEventListener('click', () => {
  document.querySelector('.sidebar').classList.toggle('open');
});
```

##### Mobile Toggle for Top Navigation Layout

```javascript
// Toggle mobile top navigation menu
document.querySelector('.topnav-toggle').addEventListener('click', () => {
  document.querySelector('.topnav-menu').classList.toggle('open');
});
```

#### Dark Mode Integration

Dark mode works with both layouts:

```javascript
// Toggle dark mode
document.getElementById('theme-toggle').addEventListener('change', function() {
  document.body.classList.toggle('dark-mode');
  localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
});

// Load user's dark mode preference
document.addEventListener('DOMContentLoaded', () => {
  if (localStorage.getItem('darkMode') === 'true') {
    document.body.classList.add('dark-mode');
    document.getElementById('theme-toggle').checked = true;
  }
});
```

### Cards

```html
<div class="card">
  <div class="card-header">
    <div class="card-title">Card Title</div>
    <button class="card-menu">
      <i class="fas fa-ellipsis-v"></i>
    </button>
  </div>
  <div class="card-value">42</div>
  <div class="card-label">Label text</div>
  <div class="card-trend up">
    <i class="card-trend-icon fas fa-arrow-up"></i>
    12% increase
  </div>
</div>
```

### Data Tables

```html
<div class="table-container">
  <table class="table">
    <thead>
      <tr>
        <th>Header 1</th>
        <th>Header 2</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Data 1</td>
        <td>Data 2</td>
      </tr>
    </tbody>
  </table>
</div>
```

### Status Badges

```html
<span class="table-status success">Success</span>
<span class="table-status warning">Warning</span>
<span class="table-status danger">Danger</span>
```

### Form Elements

```html
<div class="form-group">
  <label class="form-label">Input Label</label>
  <input type="text" class="input">
</div>

<button class="button button-primary">Primary Button</button>
<button class="button button-secondary">Secondary Button</button>
```

## CSS Variables Reference

### Colors

| Variable               | Default Value | Description          |
|------------------------|---------------|----------------------|
| `--color-primary`      | `#3a6df0`     | Primary brand color  |
| `--color-primary-light`| `#5683f7`     | Lighter primary      |
| `--color-primary-dark` | `#2954c8`     | Darker primary       |
| `--color-bg`           | `#f9fafb`     | Background color     |
| `--color-nav-bg`       | `#ffffff`     | Sidebar/Navbar bg    |
| `--color-card`         | `#ffffff`     | Card background      |
| `--color-text-primary` | `#1f2937`     | Primary text color   |
| `--color-success`      | `#10b981`     | Success color        |
| `--color-warning`      | `#f59e0b`     | Warning color        |
| `--color-danger`       | `#ef4444`     | Danger/error color   |

### Typography

| Variable                 | Default Value | Description         |
|--------------------------|---------------|---------------------|
| `--font-family`          | `'Inter',...` | Font stack          |
| `--font-size-base`       | `0.5625rem`   | Base font (9px)     |
| `--font-size-xs`         | `0.5rem`      | Extra small (8px)   |
| `--font-size-sm`         | `0.625rem`    | Small (10px)        |
| `--font-size-md`         | `0.6875rem`   | Medium (11px)       |
| `--font-size-lg`         | `0.75rem`     | Large (12px)        |
| `--font-size-xl`         | `0.875rem`    | Extra large (14px)  |
| `--font-size-xxl`        | `1rem`        | Double XL (16px)    |

### Spacing

| Variable       | Default Value | Description     |
|----------------|---------------|-----------------|
| `--space-xxs`  | `0.125rem`    | 2px spacing     |
| `--space-xs`   | `0.25rem`     | 4px spacing     |
| `--space-sm`   | `0.375rem`    | 6px spacing     |
| `--space-md`   | `0.5rem`      | 8px spacing     |
| `--space-lg`   | `0.75rem`     | 12px spacing    |
| `--space-xl`   | `1rem`        | 16px spacing    |

## Browser Support

CompactUI is designed to work with all modern browsers:

- Chrome
- Firefox
- Safari
- Edge

## Performance Considerations

- The CSS is under 9KB minified and gzipped
- No JavaScript dependencies required for basic functionality
- Progressive enhancement for older browsers

## Accessibility

While CompactUI uses smaller font sizes by default, we recommend:

- Testing with users who have vision impairments
- Potentially increasing font size for accessibility needs
- Ensuring sufficient color contrast (WCAG AA compliance)
- Providing keyboard navigation support

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

Copyright 2025 Marco Pantaleoni.

This project is licensed under the GNU General Public License v2.0.
See the LICENSE file for more details.

## Acknowledgements

- [Font Awesome](https://fontawesome.com/) for icons
- [Inter Font](https://rsms.me/inter/) for typography

---

Made with ❤️ for designers and developers who appreciate compact, efficient interfaces.
