# Guide Technique - Avancer Simplement

Documentation pour generer des landing pages HTML optimisees pour Circle.so.

## Documents

| Document | Contenu |
|----------|---------|
| [01-design-system.md](01-design-system.md) | Couleurs, typographie, espacement, composants UI, accessibilite |
| [02-contraintes-techniques.md](02-contraintes-techniques.md) | Environnement Circle.so, regles critiques, template de base |
| [03-composants.md](03-composants.md) | Hero, Features, Countdown, FAQ (code copier-coller) |
| [04-workflow.md](04-workflow.md) | Instructions Claude, testing, checklists, ressources |

## Resume rapide

### TOUJOURS
- Un seul fichier (HTML+CSS+JS)
- Prefixe `mlp-` sur toutes les classes
- Mobile-first responsive
- IIFE pour JavaScript
- CSS Variables
- Theme sombre uniquement
- Accessibilite WCAG AA

### JAMAIS
- Code backend
- Imports ES6
- Variables globales
- Classes generiques (.hero, .button)
- Oublier responsive
- Ignorer accessibilite

### DESIGN SYSTEM
- **Polices** : Inter + Montserrat
- **Couleur principale** : #3085F5 (theme sombre)
- **Spacing** : 16, 24, 32, 48px
- **Branding** : "AVANCER SIMPLEMENT"

---

**Version : 1.0.0**
**Mise a jour : 25 janvier 2026**
