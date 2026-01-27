#!/bin/bash

# Creer une nouvelle landing page a partir du template
# Usage: ./nouvelle-page.sh nom-du-projet

if [ -z "$1" ]; then
  echo "Usage: ./nouvelle-page.sh nom-du-projet"
  echo ""
  echo "Exemple: ./nouvelle-page.sh solo-connecte"
  exit 1
fi

PROJECT_NAME="$1"
PROJECT_DIR="pages/$PROJECT_NAME"
CLOUDINARY_FOLDER="avancer-simplement/$PROJECT_NAME"
TODAY=$(date +%Y-%m-%d)

# Verifier si le projet existe deja
if [ -d "$PROJECT_DIR" ]; then
  echo "Erreur: Le projet '$PROJECT_NAME' existe deja dans pages/"
  exit 1
fi

# Copier le template
cp -r _templates "$PROJECT_DIR"

# Renommer page.html avec le nom du projet
mv "$PROJECT_DIR/page.html" "$PROJECT_DIR/$PROJECT_NAME.html"

# Remplacer les placeholders de base dans images.json
# Utiliser | comme delimiteur pour eviter problemes avec underscores
sed -i "s|\[NOM_PROJET\]|${PROJECT_NAME}|g" "$PROJECT_DIR/images.json"
sed -i "s|\[DATE\]|${TODAY}|g" "$PROJECT_DIR/images.json"

# Remplacer le nom du projet dans textes.md
sed -i "s|\[NOM_PROJET\]|${PROJECT_NAME}|g" "$PROJECT_DIR/textes.md"

echo ""
echo "Projet '$PROJECT_NAME' cree avec succes!"
echo ""
echo "Structure:"
echo "  pages/$PROJECT_NAME/"
echo "  ├── $PROJECT_NAME.html"
echo "  ├── textes.md"
echo "  ├── images.json"
echo "  └── images/"
echo ""
echo "Dossier Cloudinary: $CLOUDINARY_FOLDER"
echo ""
echo "Prochaines etapes:"
echo "  1. Creer le dossier Cloudinary: avancer-simplement/$PROJECT_NAME"
echo "  2. Editer textes.md avec le contenu"
echo "  3. Ajouter images/ et upload sur Cloudinary"
echo "  4. Developper $PROJECT_NAME.html"
echo "  5. Demander a Claude d'ajouter une carte dans pages/index.html"
echo ""
