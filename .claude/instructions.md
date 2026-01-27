# Instructions du projet - Avancer Simplement Landing Pages

## Contexte

Ce projet est une **usine a landing pages standalone** pour les produits Avancer Simplement.

Chaque page HTML est **copiee-collee dans Circle.so** (bloc HTML du Site Builder). Les pages ne sont PAS servies comme un site statique traditionnel - elles sont integrees individuellement dans Circle.

## Structure du projet

```
avancer-simplement-pages/
├── pages/
│   ├── index.html              ← Page d'accueil avec cartes vers les pages
│   ├── duo-connecte/
│   │   ├── duo-connecte.html   ← HTML standalone (copier dans Circle)
│   │   ├── textes.md           ← Tous les textes de la page
│   │   ├── images.json         ← URLs Cloudinary des images
│   │   └── images/             ← Images locales avant upload
│   └── [autre-projet]/
│       └── ...
├── _templates/                  ← Templates pour nouvelles pages
├── docs/                        ← Guide design system (4 fichiers)
└── nouvelle-page.sh             ← Script creation nouvelle page
```

## Regles importantes

### Fichiers HTML
- Chaque page a son propre fichier nomme `[nom-projet].html` (PAS index.html)
- Le HTML doit etre **standalone** : tout le CSS et JS inline
- Prefixer toutes les classes CSS avec `mlp-` pour eviter conflits dans Circle
- JavaScript dans une IIFE (pas de variables globales)

### Design System
- **Polices** : Inter + Montserrat (branding)
- **Couleur principale** : #3085F5 (theme sombre uniquement)
- Voir `docs/` pour le guide complet

### Images
- Upload sur Cloudinary avant utilisation
- Mettre a jour `images.json` avec les URLs
- Les logos partages sont deja sur Cloudinary (voir images.json > shared)

## Workflow nouvelle page

1. Executer `./nouvelle-page.sh nom-du-projet`
2. Remplir `textes.md` avec le contenu
3. Ajouter images dans `images/`, upload sur Cloudinary
4. Developper le HTML
5. **Demander a Claude d'ajouter une carte dans `pages/index.html`**
6. Copier le HTML dans Circle.so

## Page d'accueil (pages/index.html)

La page d'accueil contient des **cartes** vers chaque landing page.
Quand une nouvelle page est creee, demander a Claude d'ajouter manuellement une carte.

## Circle.so

- Le HTML est colle dans un **bloc HTML** du Site Builder
- Circle fournit `window.circleUser` pour personnaliser selon l'utilisateur connecte
- Pas de fichiers externes (tout inline)
- Responsive obligatoire (Circle ne le gere pas)
