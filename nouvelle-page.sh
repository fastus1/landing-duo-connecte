#!/bin/bash

# Creer une nouvelle landing page a partir du template

if [ -z "$1" ]; then
  echo "Usage: ./nouvelle-page.sh nom-du-projet"
  echo ""
  echo "Exemple: ./nouvelle-page.sh solo-connecte"
  exit 1
fi

PROJECT_NAME="$1"
PROJECT_DIR="pages/$PROJECT_NAME"
TODAY=$(date +%Y-%m-%d)

# Verifier si le projet existe deja
if [ -d "$PROJECT_DIR" ]; then
  echo "Erreur: Le projet '$PROJECT_NAME' existe deja dans pages/"
  exit 1
fi

# Copier le template
cp -r _templates "$PROJECT_DIR"

# Renommer page.html en index.html
mv "$PROJECT_DIR/page.html" "$PROJECT_DIR/index.html"

# Remplacer les placeholders de base dans images.json
sed -i "s/\[NOM_PROJET\]/$PROJECT_NAME/g" "$PROJECT_DIR/images.json"
sed -i "s/\[DATE\]/$TODAY/g" "$PROJECT_DIR/images.json"

# Remplacer le nom du projet dans textes.md
sed -i "s/\[NOM_PROJET\]/$PROJECT_NAME/g" "$PROJECT_DIR/textes.md"

echo ""
echo "Projet '$PROJECT_NAME' cree avec succes!"
echo ""
echo "Structure:"
echo "  pages/$PROJECT_NAME/"
echo "  ├── index.html"
echo "  ├── textes.md"
echo "  ├── images.json    <- projet: $PROJECT_NAME, date: $TODAY"
echo "  └── images/"
echo ""
echo "Prochaines etapes:"
echo "  1. Editer pages/$PROJECT_NAME/textes.md avec ton contenu"
echo "  2. Ajouter tes images dans pages/$PROJECT_NAME/images/"
echo "  3. Upload sur Cloudinary et mettre a jour images.json"
echo "  4. Developper pages/$PROJECT_NAME/index.html"
echo ""
