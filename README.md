# Avancer Simplement - Landing Pages

Usine a landing pages standalone pour les produits Avancer Simplement.

## Structure

```
avancer-simplement-pages/
|
|-- _templates/              <- Templates a copier pour nouveau projet
|   |-- page.html            (structure HTML de base)
|   |-- textes.md            (template documentation)
|   |-- images.json          (template reference images)
|   |-- images/              (dossier pour images locales)
|
|-- pages/                   <- Les landing pages
|   |-- duo-connecte/
|   |   |-- index.html       (la page)
|   |   |-- textes.md        (tous les textes)
|   |   |-- images.json      (URLs Cloudinary)
|   |   |-- images/          (fichiers avant upload)
|   |
|   |-- [autre-projet]/
|       |-- ...
|
|-- docs/
|   |-- guide-design-system.md   <- Guide technique et design
|
|-- README.md
```

## Creer une nouvelle landing page

### 1. Lancer le script

```bash
./nouvelle-page.sh nom-du-projet
```

Exemple:
```bash
./nouvelle-page.sh solo-connecte
```

### 2. Configurer

- Remplacer les placeholders `[...]` dans tous les fichiers

### 3. Ajouter les images

1. Placer les images dans `pages/mon-nouveau-projet/images/`
2. Uploader sur Cloudinary (via MCP ou interface web)
3. Mettre a jour `images.json` avec les URLs

### 4. Developper

- Editer `index.html` en suivant le guide design system
- Tester localement dans le navigateur
- Verifier le responsive (mobile, tablette, desktop)

### 5. Deployer

- Copier le contenu HTML dans Circle.so (bloc HTML)
- Ou deployer via Docker

## Design System

Voir `docs/guide-design-system.md` pour :
- Palette de couleurs
- Typographie
- Composants UI
- Contraintes Circle.so

## Assets partages

Les logos Avancer Simplement sont deja sur Cloudinary :

| Asset | URL |
|-------|-----|
| Logo blanc | `https://res.cloudinary.com/dxhn08di4/image/upload/v1768769339/duo-connecte/logo-blanc-320.png` |
| Logo bleu | `https://res.cloudinary.com/dxhn08di4/image/upload/v1768769339/duo-connecte/logo-bleu-320.png` |

## Commandes utiles

```bash
# Serveur local pour tester
cd pages/duo-connecte && python -m http.server 8000

# Docker
docker-compose up
```
