# Instructions du projet - Avancer Simplement Landing Pages

## Contexte

Ce projet est une **usine a landing pages standalone** pour les produits Avancer Simplement.

Chaque page HTML est **copiee-collee dans Circle.so** (bloc HTML du Site Builder). Les pages ne sont PAS servies comme un site statique traditionnel - elles sont integrees individuellement dans Circle.

## Outils disponibles

- **MCP Server Cloudinary** : Gestion des images (upload, recherche, transformation)
- **Script nouvelle-page.sh** : Creation de nouvelles pages

## Structure du projet

```
avancer-simplement-pages/
├── pages/
│   ├── index.html              ← Page d'accueil avec cartes vers les pages
│   ├── style-guide.html        ← Reference visuelle du design system
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

## Structure Cloudinary

```
avancer-simplement/
├── _shared/
│   └── logos/
│       ├── logo-blanc-320.png  ← Logo blanc (theme sombre)
│       └── logo-bleu-320.png   ← Logo bleu (favicon)
├── duo-connecte/               ← Images specifiques au projet
│   ├── hero-couple.jpg
│   ├── mockup-smartphone-sombre.png
│   └── ...
└── [autre-projet]/
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
- **Reference visuelle** : `pages/style-guide.html`
- **Documentation complete** : `docs/`

### Images
- Upload sur Cloudinary dans `avancer-simplement/[nom-projet]/`
- Utiliser le MCP Server Cloudinary pour upload et gestion
- Mettre a jour `images.json` avec les URLs
- Logos partages : `avancer-simplement/_shared/logos/`

## Workflow nouvelle page

```bash
./nouvelle-page.sh nom-du-projet
```

1. Executer le script ci-dessus
2. Creer le dossier Cloudinary : `avancer-simplement/nom-du-projet`
3. Remplir `textes.md` avec le contenu
4. Ajouter images dans `images/`, upload sur Cloudinary via MCP
5. Developper le HTML
6. **Demander a Claude d'ajouter une carte dans `pages/index.html`**
7. Copier le HTML dans Circle.so

## Page d'accueil (pages/index.html)

La page d'accueil contient des **cartes** vers chaque landing page.
Quand une nouvelle page est creee, demander a Claude d'ajouter manuellement une carte.

## Deploiement

- **Portainer** se met a jour automatiquement toutes les minutes (pas besoin de rappeler)
- Apres un push, les changements sont deployes automatiquement

### REGLES CRITIQUES - NE JAMAIS ENFREINDRE

1. **JAMAIS de commandes Docker dans le terminal** :
   - PAS de `docker compose up/down`
   - PAS de `docker build`
   - PAS de `docker run/stop/rm`
   - Portainer gere TOUT. Ces commandes cassent le lien Portainer ↔ stack.

2. **Tout passe par GitHub** :
   - Portainer pull depuis GitHub, PAS les fichiers locaux
   - Un changement local n'existe pas tant qu'il n'est pas `git push`
   - Workflow : modifier → commit → push → Portainer auto-update (ou Pull and redeploy)

3. **Gestion des stacks = Portainer seulement** :
   - Creer/supprimer stacks → Portainer UI
   - Start/stop/restart → Portainer UI
   - Voir les logs → Portainer UI

4. **Si ca ne marche pas apres push** :
   - Verifier le cache navigateur (Ctrl+Shift+R)
   - Dans Portainer : Pull and redeploy
   - JAMAIS toucher au terminal pour Docker

## Circle.so

- Le HTML est colle dans un **bloc HTML** du Site Builder
- Circle fournit `window.circleUser` pour personnaliser selon l'utilisateur connecte
- Pas de fichiers externes (tout inline)
- Responsive obligatoire (Circle ne le gere pas)
