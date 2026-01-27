# Contraintes Techniques - Circle.so

## Environnement cible

### Plateforme
- **Systeme :** Website Builder de Circle.so
- **Bloc utilise :** Bloc HTML personnalise (Custom HTML Block)
- **Format :** Fichier unique contenant HTML + CSS + JavaScript

### Capacites du bloc HTML

**Supporte**
- HTML5 complet
- CSS3 inline (balises `<style>`)
- JavaScript moderne inline (balises `<script>`)
- Acces a `window.circleUser` (donnees utilisateur)
- Media queries pour responsive
- CSS Variables
- Flexbox et Grid

**NON supporte**
- Code backend (PHP, Python, Node.js)
- Modules ES6 (import/export)
- Fichiers CSS/JS externes separes
- Acces filesystem
- WebSockets
- Service Workers
- Bases de donnees

### Objet window.circleUser

**Structure**
```javascript
window.circleUser = {
  id: "user_abc123",
  name: "Marie Dubois",
  email: "marie@example.com"
  // Autres proprietes possibles (non documentees)
}
```

**Utilisation**
```javascript
if (window.circleUser) {
  // Utilisateur connecte
  const userName = window.circleUser.name;
} else {
  // Visiteur
}
```

---

## Regles CRITIQUES

### 1. Tout dans un seul bloc

**Structure OBLIGATOIRE**
```html
<!-- HTML -->
<div class="mlp-container">
  <!-- Contenu -->
</div>

<!-- CSS -->
<style>
  /* Tous les styles */
</style>

<!-- JavaScript -->
<script>
  /* Tout le JS */
</script>
```

### 2. Responsive OBLIGATOIRE

Circle ne gere PAS le responsive automatiquement.

**Approche mobile-first OBLIGATOIRE**
```css
/* Mobile par defaut */
.mlp-element {
  width: 100%;
  padding: 16px;
  font-size: 16px;
}

/* Tablette (>=768px) */
@media (min-width: 768px) {
  .mlp-element {
    width: 80%;
    padding: 24px;
    font-size: 18px;
  }
}

/* Desktop (>=1024px) */
@media (min-width: 1024px) {
  .mlp-element {
    width: 60%;
    padding: 32px;
    font-size: 18px;
  }
}
```

### 3. Prefixage des classes CSS

**CRITIQUE :** Prefixer TOUTES les classes pour eviter conflits.

```css
/* INTERDIT */
.hero { }
.button { }
.container { }

/* OBLIGATOIRE */
.mlp-hero { }
.mlp-button { }
.mlp-container { }
```

**Prefixe recommande :** `mlp-` (my landing page)

### 4. Isolation JavaScript

**TOUJOURS utiliser une IIFE**
```javascript
<script>
(function() {
  'use strict';

  // Tout ton code ici
  // Pas de variables globales

})();
</script>
```

### 5. Compatibilite navigateurs

Doit fonctionner sur :
- Chrome (derniere version)
- Safari (derniere version)
- Firefox (derniere version)
- Edge (derniere version)

---

## Template de base complet

```html
<!-- ========================================== -->
<!-- LANDING PAGE - Avancer Simplement -->
<!-- Version: 1.0.0 -->
<!-- Date: 2026-01-18 -->
<!-- ========================================== -->

<!-- ==================== HTML ==================== -->
<div class="mlp-root">

  <!-- Branding Header -->
  <header class="mlp-header">
    <div class="mlp-brand">
      <h1 class="mlp-brand-title">AVANCER SIMPLEMENT</h1>
      <p class="mlp-brand-subtitle">Presente</p>
    </div>
  </header>

  <!-- Hero Section -->
  <section class="mlp-hero">
    <div class="mlp-container">
      <h2 class="mlp-hero-title">Titre Principal</h2>
      <p class="mlp-hero-subtitle">Sous-titre accrocheur qui explique la valeur</p>
      <button class="mlp-btn-primary mlp-cta">
        Commencer maintenant
      </button>
    </div>
  </section>

  <!-- Features Section -->
  <section class="mlp-features">
    <div class="mlp-container">
      <h3 class="mlp-section-title">Pourquoi nous choisir</h3>
      <div class="mlp-features-grid">
        <!-- Feature cards -->
      </div>
    </div>
  </section>

</div>

<!-- ==================== CSS ==================== -->
<style>
  /* ===== FONTS ===== */
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');
  @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap');

  /* ===== CSS VARIABLES ===== */
  :root {
    /* Polices */
    --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    --font-brand: 'Montserrat', sans-serif;

    /* Couleurs - Theme sombre */
    --brand-primary: #3085F5;
    --brand-link: #539DFF;
    --bg-primary: #2B2E33;
    --bg-secondary: #42464D;
    --text-primary: #FFFFFF;
    --text-secondary: #E4E7EB;
    --btn-primary-bg: #3085F5;
    --btn-primary-text: #202226;
    --btn-primary-hover: #539DFF;

    /* Espacement */
    --spacing-4: 16px;
    --spacing-6: 24px;
    --spacing-8: 32px;
    --spacing-12: 48px;

    /* Transitions */
    --transition-base: 200ms ease;
  }

  /* ===== RESET ===== */
  .mlp-root {
    box-sizing: border-box;
    font-family: var(--font-sans);
    color: var(--text-primary);
    background: var(--bg-primary);
  }

  .mlp-root *,
  .mlp-root *::before,
  .mlp-root *::after {
    box-sizing: inherit;
  }

  /* ===== BRANDING ===== */
  .mlp-brand-title {
    font-family: var(--font-brand);
    font-weight: 900;
    font-style: italic;
    text-transform: uppercase;
    letter-spacing: 0.02em;
    color: var(--brand-primary);
    font-size: 28px;
    margin: 0 0 8px 0;
  }

  .mlp-brand-subtitle {
    font-family: var(--font-sans);
    font-weight: 400;
    font-style: italic;
    letter-spacing: 0.05em;
    color: var(--text-secondary);
    font-size: 14px;
    margin: 0;
  }

  /* ===== CONTAINER ===== */
  .mlp-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 16px;
  }

  /* ===== HERO ===== */
  .mlp-hero {
    padding: 60px 0;
    text-align: center;
    background: linear-gradient(135deg, var(--brand-primary) 0%, #2563EB 100%);
  }

  .mlp-hero-title {
    color: white;
    font-size: 32px;
    font-weight: 700;
    line-height: 1.2;
    margin: 0 0 16px 0;
  }

  .mlp-hero-subtitle {
    color: rgba(255, 255, 255, 0.9);
    font-size: 16px;
    line-height: 1.6;
    margin: 0 0 32px 0;
  }

  /* ===== BUTTONS ===== */
  .mlp-btn-primary {
    background: var(--btn-primary-bg);
    color: var(--btn-primary-text);
    font-weight: 600;
    padding: 12px 24px;
    border-radius: 8px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    font-family: var(--font-sans);
    transition: all var(--transition-base);
    min-height: 48px;
    min-width: 44px;
  }

  .mlp-btn-primary:hover {
    background: var(--btn-primary-hover);
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  }

  .mlp-btn-primary:active {
    transform: translateY(0);
  }

  /* ===== RESPONSIVE ===== */
  @media (min-width: 768px) {
    .mlp-container {
      padding: 0 40px;
    }

    .mlp-hero {
      padding: 80px 0;
    }

    .mlp-hero-title {
      font-size: 48px;
    }

    .mlp-hero-subtitle {
      font-size: 18px;
    }

    .mlp-brand-title {
      font-size: 36px;
    }
  }

  @media (min-width: 1024px) {
    .mlp-hero {
      padding: 100px 0;
    }

    .mlp-hero-title {
      font-size: 56px;
    }
  }
</style>

<!-- ==================== JAVASCRIPT ==================== -->
<script>
(function() {
  'use strict';

  // Configuration
  const CONFIG = {
    // Valeurs modifiables
  };

  // Initialize
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  function init() {
    setupEventListeners();
    personalize();
  }

  function setupEventListeners() {
    const cta = document.querySelector('.mlp-cta');
    if (cta) {
      cta.addEventListener('click', handleCTA);
    }
  }

  function handleCTA(event) {
    event.preventDefault();
    // Action du CTA
    console.log('CTA clicked');
  }

  function personalize() {
    if (window.circleUser) {
      // Personnalisation pour utilisateur connecte
      const userName = window.circleUser.name;
      // Update UI
    }
  }

})();
</script>
```
