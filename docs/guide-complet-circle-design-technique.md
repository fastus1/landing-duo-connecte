# Guide complet : Générer du code HTML pour Circle.so
## Design System + Contraintes Techniques

**Destinataire :** Claude Code (assistant IA)  
**Objectif :** Générer du code HTML/CSS/JavaScript optimisé pour le bloc HTML de Circle.so  
**Workflow :** Développement local → Test → Copy-paste dans Circle.so  

---

## 📋 Table des matières

1. [Design System](#design-system)
2. [Environnement cible Circle.so](#environnement-cible-circleso)
3. [Contraintes techniques CRITIQUES](#contraintes-techniques-critiques)
4. [Structure de code](#structure-de-code-recommandée)
5. [Composants réutilisables](#composants-réutilisables)
6. [Instructions pour Claude Code](#instructions-pour-claude-code)
7. [Testing et déploiement](#testing-avant-déploiement)

---

## Design System

### 🎨 Identité visuelle : Avancer Simplement

#### Branding principal

**Logo**
- Mode clair : Logo bleu
- Mode sombre : Logo blanc
- Format : PNG 320px de large recommandé

**Nom de la communauté : "AVANCER SIMPLEMENT"**
```css
font-family: 'Montserrat', sans-serif;
font-weight: 900;              /* Black */
font-style: italic;
text-transform: uppercase;
letter-spacing: 0.02em;
```

**Sous-titre : "Présente"**
```css
font-family: 'Inter', sans-serif;
font-weight: 400;              /* Normal */
font-style: italic;
letter-spacing: 0.05em;        /* tracking-wide */
color: var(--muted-foreground);
```

### 📝 Typographie

**Police principale : Inter**
- Source : Google Fonts
- Poids disponibles : 100-900
- Import :
```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');
```

**Police branding : Montserrat**
- Pour "AVANCER SIMPLEMENT" uniquement
- Poids : 900 (Black)
- Import :
```css
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,900&display=swap');
```

#### Hiérarchie typographique

| Élément | Desktop | Mobile | Poids | Line-height |
|---------|---------|--------|-------|-------------|
| Hero Title | 48-56px | 32-40px | 700-800 | 1.2 |
| H1 | 32-40px | 28-32px | 700 | 1.2 |
| H2 | 28-32px | 24-28px | 700 | 1.3 |
| H3 | 24-28px | 20-24px | 600 | 1.3 |
| H4 | 20px | 20px | 600 | 1.4 |
| H5 | 18px | 18px | 600 | 1.4 |
| H6 | 16px | 16px | 600 | 1.5 |
| Body | 16-18px | 16px | 400 | 1.6 |
| Small | 14-15px | 14px | 400 | 1.5 |
| Meta/Label | 12-14px | 12px | 400-500 | 1.4 |

#### Variables typographiques CSS

```css
:root {
  /* Polices */
  --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  --font-brand: 'Montserrat', sans-serif;
  --font-mono: 'Menlo', monospace;
  
  /* Tailles de base */
  --text-xs: 12px;
  --text-sm: 14px;
  --text-base: 16px;
  --text-lg: 18px;
  --text-xl: 20px;
  --text-2xl: 24px;
  --text-3xl: 28px;
  --text-4xl: 32px;
  --text-5xl: 40px;
  --text-6xl: 48px;
}
```

### 🎨 Palette de couleurs

#### Couleurs principales

**Mode clair**
```css
:root {
  /* Brand */
  --brand-primary: #074491;
  --brand-link: #2563EB;
  
  /* UI */
  --bg-primary: #FFFFFF;
  --bg-secondary: #F0F3F5;
  --text-primary: #000000;
  --text-secondary: #545861;
  
  /* Boutons */
  --btn-primary-bg: #074491;
  --btn-primary-text: #FFFFFF;
  --btn-primary-hover: #053666;
  
  /* États */
  --border-default: #E5E7EB;
  --border-focus: #074491;
}
```

**Mode sombre**
```css
@media (prefers-color-scheme: dark) {
  :root {
    /* Brand */
    --brand-primary: #3085F5;
    --brand-link: #539DFF;
    
    /* UI */
    --bg-primary: #2B2E33;
    --bg-secondary: #42464D;
    --text-primary: #FFFFFF;
    --text-secondary: #E4E7EB;
    
    /* Boutons */
    --btn-primary-bg: #3085F5;
    --btn-primary-text: #202226;
    --btn-primary-hover: #539DFF;
    
    /* États */
    --border-default: #42464D;
    --border-focus: #3085F5;
  }
}
```

#### Couleurs d'appoint (usage limité)

```css
:root {
  --color-orange: #e05a03;
  --color-green: #009a2a;
  --color-yellow: #ffb200;
  --color-red: #db0e00;
  --color-purple: #641892;
  --color-magenta: #a82360;
  
  /* États de validation */
  --success: #009a2a;
  --error: #db0e00;
  --warning: #ffb200;
  --info: #2563EB;
}
```

### 📏 Système d'espacement

**Basé sur Tailwind (multiples de 4px)**

```css
:root {
  --spacing-1: 4px;      /* 0.25rem */
  --spacing-2: 8px;      /* 0.5rem */
  --spacing-3: 12px;     /* 0.75rem */
  --spacing-4: 16px;     /* 1rem */
  --spacing-6: 24px;     /* 1.5rem */
  --spacing-8: 32px;     /* 2rem */
  --spacing-12: 48px;    /* 3rem */
  --spacing-16: 64px;    /* 4rem */
  --spacing-20: 80px;    /* 5rem */
  --spacing-24: 96px;    /* 6rem */
}
```

**Conventions d'usage**
- Padding composant : 24-32px (spacing-6 à spacing-8)
- Spacing formulaire : 24px (spacing-6)
- Espacement bouton : 24px horizontal, 12px vertical
- Marges sections : 32-48px (spacing-8 à spacing-12)

### 🧩 Composants UI

#### Boutons

**Primaire**
```css
.mlp-btn-primary {
  background: var(--btn-primary-bg);
  color: var(--btn-primary-text);
  font-weight: 600;
  padding: 12px 24px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  font-size: 16px;
  transition: all 0.2s ease;
  min-height: 48px;
  min-width: 44px; /* Accessibilité */
}

.mlp-btn-primary:hover {
  background: var(--btn-primary-hover);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.mlp-btn-primary:active {
  transform: translateY(0);
}
```

**Secondaire**
```css
.mlp-btn-secondary {
  background: transparent;
  color: var(--brand-primary);
  border: 2px solid var(--brand-primary);
  font-weight: 600;
  padding: 12px 24px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 16px;
  transition: all 0.2s ease;
  min-height: 48px;
}

.mlp-btn-secondary:hover {
  background: var(--brand-primary);
  color: var(--btn-primary-text);
}
```

#### Cards

```css
.mlp-card {
  background: var(--bg-primary);
  border-radius: 12px;
  padding: 32px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  border: 1px solid var(--border-default);
  transition: box-shadow 0.3s ease;
}

.mlp-card:hover {
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
}
```

#### Inputs

```css
.mlp-input {
  width: 100%;
  height: 48px;
  padding: 0 16px;
  border: 2px solid var(--border-default);
  border-radius: 8px;
  font-size: 16px;
  font-family: var(--font-sans);
  transition: border-color 0.2s ease;
  background: var(--bg-primary);
  color: var(--text-primary);
}

.mlp-input:focus {
  outline: none;
  border-color: var(--border-focus);
  box-shadow: 0 0 0 3px rgba(7, 68, 145, 0.1);
}

.mlp-input::placeholder {
  color: var(--text-secondary);
  opacity: 0.6;
}
```

### ♿ Accessibilité

**Standards minimums**
- Contraste : WCAG AA (4.5:1 pour texte normal)
- Taille tactile : Minimum 44x44px
- Focus visible : Ring de 2-3px avec offset
- Labels : Toujours visibles (pas que placeholder)
- ARIA : Utiliser aria-label, aria-describedby

**Focus states**
```css
.mlp-focusable:focus {
  outline: none;
  box-shadow: 0 0 0 3px var(--border-focus);
  border-radius: 8px;
}
```

### 🎬 Animations

**Principes**
- Animations minimalistes uniquement
- Contexte sérieux (pas d'animations décoratives)
- Feedback utilisateur seulement

```css
:root {
  --transition-fast: 150ms ease;
  --transition-base: 200ms ease;
  --transition-slow: 300ms ease;
}

/* Transitions recommandées */
.mlp-transition-colors {
  transition: background-color var(--transition-base),
              border-color var(--transition-base),
              color var(--transition-base);
}

.mlp-transition-transform {
  transition: transform var(--transition-base);
}

.mlp-transition-shadow {
  transition: box-shadow var(--transition-base);
}
```

### 📱 Responsive Design

**Breakpoints**
```css
/* Mobile first */
:root {
  --breakpoint-sm: 640px;   /* Tablette */
  --breakpoint-md: 768px;   /* Tablette landscape */
  --breakpoint-lg: 1024px;  /* Desktop */
  --breakpoint-xl: 1280px;  /* Large desktop */
}

/* Usage */
@media (min-width: 768px) {
  /* Tablette et plus */
}

@media (min-width: 1024px) {
  /* Desktop et plus */
}
```

**Contraintes iframe Circle.so**
- Min-width : 320px
- Optimal : 400-600px
- Scroll vertical activé
- Padding mobile : 16px minimum

---

## Environnement cible Circle.so

### Plateforme
- **Système :** Website Builder de Circle.so
- **Bloc utilisé :** Bloc HTML personnalisé (Custom HTML Block)
- **Format :** Fichier unique contenant HTML + CSS + JavaScript

### Capacités du bloc HTML

**✅ Supporté**
- HTML5 complet
- CSS3 inline (balises `<style>`)
- JavaScript moderne inline (balises `<script>`)
- Accès à `window.circleUser` (données utilisateur)
- Media queries pour responsive
- CSS Variables
- Flexbox et Grid

**❌ NON supporté**
- Code backend (PHP, Python, Node.js)
- Modules ES6 (import/export)
- Fichiers CSS/JS externes séparés
- Accès filesystem
- WebSockets
- Service Workers
- Bases de données

### Objet window.circleUser

**Structure**
```javascript
window.circleUser = {
  id: "user_abc123",
  name: "Marie Dubois",
  email: "marie@example.com"
  // Autres propriétés possibles (non documentées)
}
```

**Utilisation**
```javascript
if (window.circleUser) {
  // Utilisateur connecté
  const userName = window.circleUser.name;
} else {
  // Visiteur
}
```

---

## Contraintes techniques CRITIQUES

### 1. ⚠️ Tout dans un seul bloc

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

### 2. ⚠️ Responsive OBLIGATOIRE

Circle ne gère PAS le responsive automatiquement.

**Approche mobile-first OBLIGATOIRE**
```css
/* Mobile par défaut */
.mlp-element {
  width: 100%;
  padding: 16px;
  font-size: 16px;
}

/* Tablette (≥768px) */
@media (min-width: 768px) {
  .mlp-element {
    width: 80%;
    padding: 24px;
    font-size: 18px;
  }
}

/* Desktop (≥1024px) */
@media (min-width: 1024px) {
  .mlp-element {
    width: 60%;
    padding: 32px;
    font-size: 18px;
  }
}
```

### 3. ⚠️ Préfixage des classes CSS

**CRITIQUE :** Préfixer TOUTES les classes pour éviter conflits.

```css
/* ❌ INTERDIT */
.hero { }
.button { }
.container { }

/* ✅ OBLIGATOIRE */
.mlp-hero { }
.mlp-button { }
.mlp-container { }
```

**Préfixe recommandé :** `mlp-` (my landing page)

### 4. ⚠️ Isolation JavaScript

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

### 5. ⚠️ Compatibilité navigateurs

Doit fonctionner sur :
- Chrome (dernière version)
- Safari (dernière version)  
- Firefox (dernière version)
- Edge (dernière version)

---

## Structure de code recommandée

### Template de base complet

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
      <p class="mlp-brand-subtitle">Présente</p>
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
    
    /* Couleurs - Mode clair */
    --brand-primary: #074491;
    --brand-link: #2563EB;
    --bg-primary: #FFFFFF;
    --bg-secondary: #F0F3F5;
    --text-primary: #000000;
    --text-secondary: #545861;
    --btn-primary-bg: #074491;
    --btn-primary-text: #FFFFFF;
    --btn-primary-hover: #053666;
    
    /* Espacement */
    --spacing-4: 16px;
    --spacing-6: 24px;
    --spacing-8: 32px;
    --spacing-12: 48px;
    
    /* Transitions */
    --transition-base: 200ms ease;
  }
  
  /* ===== MODE SOMBRE ===== */
  @media (prefers-color-scheme: dark) {
    :root {
      --brand-primary: #3085F5;
      --brand-link: #539DFF;
      --bg-primary: #2B2E33;
      --bg-secondary: #42464D;
      --text-primary: #FFFFFF;
      --text-secondary: #E4E7EB;
      --btn-primary-bg: #3085F5;
      --btn-primary-text: #202226;
      --btn-primary-hover: #539DFF;
    }
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
      // Personnalisation pour utilisateur connecté
      const userName = window.circleUser.name;
      // Update UI
    }
  }
  
})();
</script>
```

---

## Composants réutilisables

### 🎯 Hero Section complète

```html
<section class="mlp-hero">
  <div class="mlp-container">
    <!-- Branding -->
    <div class="mlp-brand-header">
      <h1 class="mlp-brand-title">AVANCER SIMPLEMENT</h1>
      <p class="mlp-brand-subtitle">Présente</p>
    </div>
    
    <!-- Hero content -->
    <h2 class="mlp-hero-title">Transforme ta vie aujourd'hui</h2>
    <p class="mlp-hero-subtitle">
      Rejoins une communauté de passionnés qui avancent ensemble vers leurs objectifs.
    </p>
    
    <!-- CTA -->
    <div class="mlp-hero-cta">
      <button class="mlp-btn-primary mlp-btn-large">
        Commencer gratuitement
      </button>
      <p class="mlp-hero-note">Aucune carte de crédit requise</p>
    </div>
  </div>
</section>

<style>
  .mlp-hero {
    background: linear-gradient(135deg, #074491 0%, #2563EB 100%);
    padding: 80px 20px;
    text-align: center;
    position: relative;
    overflow: hidden;
  }
  
  .mlp-brand-header {
    margin-bottom: 48px;
  }
  
  .mlp-brand-title {
    font-family: 'Montserrat', sans-serif;
    font-weight: 900;
    font-style: italic;
    text-transform: uppercase;
    letter-spacing: 0.02em;
    color: white;
    font-size: 32px;
    margin: 0 0 8px 0;
  }
  
  .mlp-brand-subtitle {
    font-family: 'Inter', sans-serif;
    font-weight: 400;
    font-style: italic;
    letter-spacing: 0.05em;
    color: rgba(255, 255, 255, 0.8);
    font-size: 14px;
    margin: 0;
  }
  
  .mlp-hero-title {
    color: white;
    font-size: 40px;
    font-weight: 700;
    line-height: 1.2;
    margin: 0 0 20px 0;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
  }
  
  .mlp-hero-subtitle {
    color: rgba(255, 255, 255, 0.9);
    font-size: 18px;
    line-height: 1.6;
    margin: 0 0 40px 0;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
  }
  
  .mlp-hero-cta {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
  }
  
  .mlp-btn-large {
    padding: 16px 40px;
    font-size: 18px;
    min-height: 56px;
  }
  
  .mlp-hero-note {
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
    margin: 0;
  }
  
  @media (min-width: 768px) {
    .mlp-hero {
      padding: 120px 40px;
    }
    
    .mlp-brand-title {
      font-size: 48px;
    }
    
    .mlp-brand-subtitle {
      font-size: 16px;
    }
    
    .mlp-hero-title {
      font-size: 56px;
    }
    
    .mlp-hero-subtitle {
      font-size: 20px;
    }
  }
</style>
```

### 📊 Grid de fonctionnalités

```html
<section class="mlp-features">
  <div class="mlp-container">
    <h3 class="mlp-section-title">Ce que tu vas obtenir</h3>
    
    <div class="mlp-features-grid">
      <div class="mlp-feature-card">
        <div class="mlp-feature-icon">🚀</div>
        <h4 class="mlp-feature-title">Croissance rapide</h4>
        <p class="mlp-feature-text">
          Des outils et stratégies éprouvées pour atteindre tes objectifs rapidement.
        </p>
      </div>
      
      <div class="mlp-feature-card">
        <div class="mlp-feature-icon">🤝</div>
        <h4 class="mlp-feature-title">Communauté active</h4>
        <p class="mlp-feature-text">
          Rejoins des centaines de membres qui s'entraident chaque jour.
        </p>
      </div>
      
      <div class="mlp-feature-card">
        <div class="mlp-feature-icon">💡</div>
        <h4 class="mlp-feature-title">Contenu exclusif</h4>
        <p class="mlp-feature-text">
          Accède à des ressources premium créées spécialement pour nos membres.
        </p>
      </div>
    </div>
  </div>
</section>

<style>
  .mlp-features {
    padding: 80px 0;
    background: var(--bg-primary);
  }
  
  .mlp-section-title {
    text-align: center;
    font-size: 36px;
    font-weight: 700;
    color: var(--text-primary);
    margin: 0 0 48px 0;
  }
  
  .mlp-features-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 24px;
  }
  
  .mlp-feature-card {
    background: var(--bg-primary);
    padding: 32px;
    border-radius: 12px;
    border: 1px solid var(--border-default, #E5E7EB);
    text-align: center;
    transition: all 0.3s ease;
  }
  
  .mlp-feature-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    border-color: var(--brand-primary);
  }
  
  .mlp-feature-icon {
    font-size: 48px;
    margin-bottom: 16px;
  }
  
  .mlp-feature-title {
    font-size: 20px;
    font-weight: 600;
    color: var(--text-primary);
    margin: 0 0 12px 0;
  }
  
  .mlp-feature-text {
    font-size: 16px;
    line-height: 1.6;
    color: var(--text-secondary);
    margin: 0;
  }
  
  @media (min-width: 768px) {
    .mlp-features-grid {
      grid-template-columns: repeat(2, 1fr);
      gap: 32px;
    }
    
    .mlp-section-title {
      font-size: 48px;
    }
  }
  
  @media (min-width: 1024px) {
    .mlp-features-grid {
      grid-template-columns: repeat(3, 1fr);
    }
  }
</style>
```

### ⏱️ Compteur à rebours

```html
<div class="mlp-countdown-section">
  <div class="mlp-container">
    <p class="mlp-countdown-label">Offre limitée - Plus que :</p>
    
    <div class="mlp-countdown">
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-days">00</span>
        <span class="mlp-countdown-unit">Jours</span>
      </div>
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-hours">00</span>
        <span class="mlp-countdown-unit">Heures</span>
      </div>
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-minutes">00</span>
        <span class="mlp-countdown-unit">Minutes</span>
      </div>
      <div class="mlp-countdown-item">
        <span class="mlp-countdown-number" id="mlp-seconds">00</span>
        <span class="mlp-countdown-unit">Secondes</span>
      </div>
    </div>
  </div>
</div>

<style>
  .mlp-countdown-section {
    background: var(--bg-secondary);
    padding: 48px 20px;
    text-align: center;
  }
  
  .mlp-countdown-label {
    font-size: 18px;
    font-weight: 600;
    color: var(--text-primary);
    margin: 0 0 24px 0;
  }
  
  .mlp-countdown {
    display: flex;
    justify-content: center;
    gap: 16px;
    flex-wrap: wrap;
  }
  
  .mlp-countdown-item {
    background: var(--bg-primary);
    border: 2px solid var(--brand-primary);
    border-radius: 12px;
    padding: 20px;
    min-width: 90px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  
  .mlp-countdown-number {
    font-size: 36px;
    font-weight: 700;
    color: var(--brand-primary);
    line-height: 1;
    font-variant-numeric: tabular-nums;
  }
  
  .mlp-countdown-unit {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: var(--text-secondary);
    margin-top: 8px;
  }
  
  @media (min-width: 768px) {
    .mlp-countdown-label {
      font-size: 20px;
    }
    
    .mlp-countdown-item {
      min-width: 110px;
      padding: 24px;
    }
    
    .mlp-countdown-number {
      font-size: 48px;
    }
    
    .mlp-countdown-unit {
      font-size: 14px;
    }
  }
</style>

<script>
(function() {
  'use strict';
  
  // ⚙️ CONFIGURATION - Modifie cette date
  const TARGET_DATE = new Date('2026-12-31T23:59:59').getTime();
  
  function updateCountdown() {
    const now = new Date().getTime();
    const distance = TARGET_DATE - now;
    
    if (distance < 0) {
      document.querySelector('.mlp-countdown').innerHTML = 
        '<p style="font-size: 20px; color: var(--color-red, #db0e00);">Offre expirée</p>';
      return;
    }
    
    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    const daysEl = document.getElementById('mlp-days');
    const hoursEl = document.getElementById('mlp-hours');
    const minutesEl = document.getElementById('mlp-minutes');
    const secondsEl = document.getElementById('mlp-seconds');
    
    if (daysEl) daysEl.textContent = String(days).padStart(2, '0');
    if (hoursEl) hoursEl.textContent = String(hours).padStart(2, '0');
    if (minutesEl) minutesEl.textContent = String(minutes).padStart(2, '0');
    if (secondsEl) secondsEl.textContent = String(seconds).padStart(2, '0');
  }
  
  updateCountdown();
  setInterval(updateCountdown, 1000);
})();
</script>
```

### ❓ FAQ Accordéon

```html
<section class="mlp-faq">
  <div class="mlp-container">
    <h3 class="mlp-section-title">Questions fréquentes</h3>
    
    <div class="mlp-faq-list">
      <div class="mlp-faq-item">
        <button class="mlp-faq-question" aria-expanded="false">
          Comment ça fonctionne ?
          <span class="mlp-faq-icon" aria-hidden="true">+</span>
        </button>
        <div class="mlp-faq-answer">
          <p>Inscris-toi, accède au contenu exclusif, et rejoins une communauté de passionnés qui avancent ensemble.</p>
        </div>
      </div>
      
      <div class="mlp-faq-item">
        <button class="mlp-faq-question" aria-expanded="false">
          Quel est le prix ?
          <span class="mlp-faq-icon" aria-hidden="true">+</span>
        </button>
        <div class="mlp-faq-answer">
          <p>Plusieurs options sont disponibles à partir de 29€/mois. Tu peux annuler à tout moment.</p>
        </div>
      </div>
      
      <div class="mlp-faq-item">
        <button class="mlp-faq-question" aria-expanded="false">
          Puis-je essayer gratuitement ?
          <span class="mlp-faq-icon" aria-hidden="true">+</span>
        </button>
        <div class="mlp-faq-answer">
          <p>Oui ! Profite de 7 jours d'essai gratuit pour découvrir tout ce que nous offrons.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .mlp-faq {
    padding: 80px 0;
    background: var(--bg-primary);
  }
  
  .mlp-faq-list {
    max-width: 800px;
    margin: 0 auto;
  }
  
  .mlp-faq-item {
    margin-bottom: 16px;
    border: 1px solid var(--border-default, #E5E7EB);
    border-radius: 12px;
    overflow: hidden;
    background: var(--bg-primary);
  }
  
  .mlp-faq-question {
    width: 100%;
    background: transparent;
    border: none;
    padding: 20px 24px;
    text-align: left;
    font-size: 18px;
    font-weight: 600;
    color: var(--text-primary);
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: background 0.2s ease;
    font-family: var(--font-sans);
  }
  
  .mlp-faq-question:hover {
    background: var(--bg-secondary);
  }
  
  .mlp-faq-question:focus {
    outline: none;
    background: var(--bg-secondary);
  }
  
  .mlp-faq-icon {
    font-size: 28px;
    font-weight: 300;
    color: var(--brand-primary);
    transition: transform 0.3s ease;
    flex-shrink: 0;
    margin-left: 16px;
  }
  
  .mlp-faq-item.active .mlp-faq-icon {
    transform: rotate(45deg);
  }
  
  .mlp-faq-answer {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
  }
  
  .mlp-faq-answer p {
    padding: 0 24px 24px 24px;
    margin: 0;
    color: var(--text-secondary);
    font-size: 16px;
    line-height: 1.6;
  }
  
  @media (min-width: 768px) {
    .mlp-faq-question {
      font-size: 20px;
      padding: 24px 32px;
    }
    
    .mlp-faq-answer p {
      padding: 0 32px 32px 32px;
      font-size: 18px;
    }
  }
</style>

<script>
(function() {
  'use strict';
  
  document.querySelectorAll('.mlp-faq-question').forEach(button => {
    button.addEventListener('click', function() {
      const item = this.parentElement;
      const answer = this.nextElementSibling;
      const isActive = item.classList.contains('active');
      
      // Ferme tous les autres items
      document.querySelectorAll('.mlp-faq-item').forEach(otherItem => {
        if (otherItem !== item && otherItem.classList.contains('active')) {
          otherItem.classList.remove('active');
          otherItem.querySelector('.mlp-faq-answer').style.maxHeight = null;
          otherItem.querySelector('.mlp-faq-question').setAttribute('aria-expanded', 'false');
        }
      });
      
      // Toggle l'item actuel
      if (isActive) {
        item.classList.remove('active');
        answer.style.maxHeight = null;
        this.setAttribute('aria-expanded', 'false');
      } else {
        item.classList.add('active');
        answer.style.maxHeight = answer.scrollHeight + 'px';
        this.setAttribute('aria-expanded', 'true');
      }
    });
  });
})();
</script>
```

---

## Instructions pour Claude Code

### 📝 Checklist de génération

Avant de fournir le code, VÉRIFIE :

```
✅ Un seul fichier (HTML + CSS + JS)
✅ Import polices : Inter + Montserrat (si branding)
✅ Toutes les classes préfixées (mlp-)
✅ CSS Variables définies (couleurs, espacements)
✅ Mode sombre avec @media (prefers-color-scheme: dark)
✅ Responsive mobile-first (768px, 1024px)
✅ JavaScript dans IIFE
✅ Support window.circleUser
✅ Accessibilité (alt, aria, contraste, focus)
✅ Taille tactile min 44x44px
✅ Commentaires pour valeurs modifiables
✅ Animations subtiles uniquement
```

### 🎯 Prompts optimaux

**Pour une landing page complète**
```
Crée une landing page complète pour [produit/service] avec le design system "Avancer Simplement".

STRUCTURE :
1. Header avec branding "AVANCER SIMPLEMENT" + "Présente"
2. Hero avec gradient bleu, titre, sous-titre, CTA
3. Features (3-4 cards en grid)
4. Témoignages (3 quotes)
5. Pricing (2-3 plans)
6. FAQ accordéon (5 questions)
7. Footer

DESIGN SYSTEM :
- Polices : Inter (contenu) + Montserrat Black Italic (branding)
- Couleurs : #074491 (light) / #3085F5 (dark)
- Espacement Tailwind (16px, 24px, 32px, 48px)
- Boutons : Arrondis 8px, min 48px hauteur
- Cards : Border-radius 12px, shadow subtile

TECHNIQUE :
- Un seul fichier HTML+CSS+JS
- Préfixe : mlp-
- Responsive mobile-first
- JavaScript : IIFE
- Support window.circleUser
- Mode sombre automatique

PERSONNALISATION :
- CSS Variables pour couleurs/espacements
- Config JS en début de script
- Commentaires clairs
```

### 🔧 Configuration JavaScript

Toujours inclure une section CONFIG modifiable :

```javascript
<script>
(function() {
  'use strict';
  
  // ⚙️ CONFIGURATION - Valeurs modifiables
  const CONFIG = {
    countdownDate: '2026-12-31T23:59:59',
    animationDuration: 300,
    scrollOffset: 80,
    // Autres configs...
  };
  
  // Reste du code...
})();
</script>
```

### 💬 Commentaires essentiels

```html
<!-- ========================================== -->
<!-- Section facilement identifiable -->
<!-- ========================================== -->

<style>
  /* ===== SECTION CSS ===== */
  
  /* 🎨 MODIFIABLE : Couleurs principales */
  :root {
    --brand-primary: #074491;
  }
</style>

<script>
  // ⚙️ CONFIGURATION - À modifier selon besoin
  const targetDate = '2026-12-31';
</script>
```

---

## Testing avant déploiement

### ✅ Checklist complète

**Visuel**
```
[ ] Polices chargent correctement (Inter + Montserrat)
[ ] Couleurs conformes au design system
[ ] Branding "AVANCER SIMPLEMENT" correct
[ ] Espacement cohérent (Tailwind units)
[ ] Mode sombre fonctionne
```

**Responsive**
```
[ ] Mobile 375px : Lisible, pas de débordement
[ ] Tablette 768px : Layout adapté
[ ] Desktop 1024px : Optimal
[ ] Desktop 1440px : Pas trop étiré
```

**Fonctionnel**
```
[ ] Tous les boutons cliquables (44x44px min)
[ ] Liens fonctionnent
[ ] Accordéons s'ouvrent/ferment
[ ] Compteur compte correctement
[ ] Formulaires validés
```

**Technique**
```
[ ] Pas d'erreurs console
[ ] window.circleUser testé (avec et sans)
[ ] Performance OK (PageSpeed >80)
[ ] HTML valide (W3C)
```

**Accessibilité**
```
[ ] Contraste suffisant (WCAG AA)
[ ] Alt sur toutes les images
[ ] ARIA labels présents
[ ] Navigation clavier OK
[ ] Focus visible
```

### 🧪 Template de test local

```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Test Landing Page - Avancer Simplement</title>
  
  <style>
    body {
      margin: 0;
      padding: 0;
      background: #f5f5f5;
    }
  </style>
  
  <script>
    // Simule Circle.so
    window.circleUser = {
      id: "test_123",
      name: "Marie Test",
      email: "marie@test.com"
    };
    
    // Pour tester sans utilisateur, commente les lignes ci-dessus
  </script>
</head>
<body>

<!-- ==================== CODE POUR CIRCLE ==================== -->

[TON CODE ICI]

<!-- ==================== FIN CODE ==================== -->

</body>
</html>
```

---

## 📚 Ressources

### Documentation officielle
- Circle.so : https://help.circle.so
- Circle Community : https://community.circle.so
- Circle API : https://api.circle.so

### Polices
- Inter : https://fonts.google.com/specimen/Inter
- Montserrat : https://fonts.google.com/specimen/Montserrat

### Outils
- Chrome DevTools : Testing responsive
- PageSpeed Insights : Performance
- WAVE : Accessibilité
- W3C Validator : HTML

### Design
- Material Design 3 : https://m3.material.io
- Tailwind Spacing : https://tailwindcss.com/docs/spacing

---

## ⚡ Points clés - Mémo rapide

### TOUJOURS
✅ Un seul fichier (HTML+CSS+JS)  
✅ Préfixe mlp- sur classes  
✅ Mobile-first responsive  
✅ IIFE pour JavaScript  
✅ CSS Variables  
✅ Mode sombre  
✅ Accessibilité WCAG AA  

### JAMAIS
❌ Code backend  
❌ Imports ES6  
❌ Variables globales  
❌ Classes génériques  
❌ Oublier responsive  
❌ Ignorer accessibilité  

### DESIGN SYSTEM
🎨 Polices : Inter + Montserrat  
🎨 Couleurs : #074491 / #3085F5  
🎨 Spacing : 16, 24, 32, 48px  
🎨 Branding : "AVANCER SIMPLEMENT"  

---

**Version du guide : 1.0.0**  
**Dernière mise à jour : 18 janvier 2026**
