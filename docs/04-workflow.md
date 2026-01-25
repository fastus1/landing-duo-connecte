# Workflow et Testing

## Instructions pour Claude Code

### Checklist de generation

Avant de fournir le code, VERIFIE :

```
[ ] Un seul fichier (HTML + CSS + JS)
[ ] Import polices : Inter + Montserrat (si branding)
[ ] Toutes les classes prefixees (mlp-)
[ ] CSS Variables definies (couleurs, espacements)
[ ] Mode sombre avec @media (prefers-color-scheme: dark)
[ ] Responsive mobile-first (768px, 1024px)
[ ] JavaScript dans IIFE
[ ] Support window.circleUser
[ ] Accessibilite (alt, aria, contraste, focus)
[ ] Taille tactile min 44x44px
[ ] Commentaires pour valeurs modifiables
[ ] Animations subtiles uniquement
```

### Prompt optimal pour landing page

```
Cree une landing page complete pour [produit/service] avec le design system "Avancer Simplement".

STRUCTURE :
1. Header avec branding "AVANCER SIMPLEMENT" + "Presente"
2. Hero avec gradient bleu, titre, sous-titre, CTA
3. Features (3-4 cards en grid)
4. Temoignages (3 quotes)
5. Pricing (2-3 plans)
6. FAQ accordeon (5 questions)
7. Footer

DESIGN SYSTEM :
- Polices : Inter (contenu) + Montserrat Black Italic (branding)
- Couleurs : #074491 (light) / #3085F5 (dark)
- Espacement Tailwind (16px, 24px, 32px, 48px)
- Boutons : Arrondis 8px, min 48px hauteur
- Cards : Border-radius 12px, shadow subtile

TECHNIQUE :
- Un seul fichier HTML+CSS+JS
- Prefixe : mlp-
- Responsive mobile-first
- JavaScript : IIFE
- Support window.circleUser
- Mode sombre automatique

PERSONNALISATION :
- CSS Variables pour couleurs/espacements
- Config JS en debut de script
- Commentaires clairs
```

### Configuration JavaScript

Toujours inclure une section CONFIG modifiable :

```javascript
<script>
(function() {
  'use strict';

  // CONFIGURATION - Valeurs modifiables
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

### Commentaires essentiels

```html
<!-- ========================================== -->
<!-- Section facilement identifiable -->
<!-- ========================================== -->

<style>
  /* ===== SECTION CSS ===== */

  /* MODIFIABLE : Couleurs principales */
  :root {
    --brand-primary: #074491;
  }
</style>

<script>
  // CONFIGURATION - A modifier selon besoin
  const targetDate = '2026-12-31';
</script>
```

---

## Testing avant deploiement

### Checklist complete

**Visuel**
```
[ ] Polices chargent correctement (Inter + Montserrat)
[ ] Couleurs conformes au design system
[ ] Branding "AVANCER SIMPLEMENT" correct
[ ] Espacement coherent (Tailwind units)
[ ] Mode sombre fonctionne
```

**Responsive**
```
[ ] Mobile 375px : Lisible, pas de debordement
[ ] Tablette 768px : Layout adapte
[ ] Desktop 1024px : Optimal
[ ] Desktop 1440px : Pas trop etire
```

**Fonctionnel**
```
[ ] Tous les boutons cliquables (44x44px min)
[ ] Liens fonctionnent
[ ] Accordeons s'ouvrent/ferment
[ ] Compteur compte correctement
[ ] Formulaires valides
```

**Technique**
```
[ ] Pas d'erreurs console
[ ] window.circleUser teste (avec et sans)
[ ] Performance OK (PageSpeed >80)
[ ] HTML valide (W3C)
```

**Accessibilite**
```
[ ] Contraste suffisant (WCAG AA)
[ ] Alt sur toutes les images
[ ] ARIA labels presents
[ ] Navigation clavier OK
[ ] Focus visible
```

### Template de test local

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

## Ressources

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
- WAVE : Accessibilite
- W3C Validator : HTML

### Design
- Material Design 3 : https://m3.material.io
- Tailwind Spacing : https://tailwindcss.com/docs/spacing

---

## Memo rapide

### TOUJOURS
- Un seul fichier (HTML+CSS+JS)
- Prefixe mlp- sur classes
- Mobile-first responsive
- IIFE pour JavaScript
- CSS Variables
- Mode sombre
- Accessibilite WCAG AA

### JAMAIS
- Code backend
- Imports ES6
- Variables globales
- Classes generiques
- Oublier responsive
- Ignorer accessibilite

### DESIGN SYSTEM
- Polices : Inter + Montserrat
- Couleurs : #074491 / #3085F5
- Spacing : 16, 24, 32, 48px
- Branding : "AVANCER SIMPLEMENT"
