# Instructions : Landing Page Duo-Connecte

## Contexte du projet

Tu dois créer une landing page pour **Duo-Connecte**, une application de communication de couple développée par Avancer Simplement.

Cette page sera intégrée dans le Website Builder de Circle.so via un bloc HTML personnalisé. Tout le code doit être dans un seul fichier (HTML + CSS + JS).

---

## Documents de référence

Avant de commencer, lis attentivement ces fichiers :
- `guide-complet-circle-design-technique.md` : Design system complet et contraintes techniques Circle.so
- `texte_applications.md` : Contenu et textes de l'application Duo-Connecte

---

## Description du produit

**Duo-Connecte** est un guide interactif qui accompagne les couples dans leurs conversations difficiles. L'application structure l'échange pour aider les partenaires à s'exprimer et s'écouter mutuellement.

**Public cible :**
- Couples en général
- Couples vivant des difficultés de communication
- Couples ayant un non-dit important à régler
- Couples voulant améliorer leur connexion

**Proposition de valeur principale :**
Un guide pas à pas pour naviguer les conversations délicates avec authenticité, sans tomber dans les pièges habituels (défense, attaque, justification).

---

## Objectif de la page

**Action principale :** Acheter l'application (50$ CAD, paiement unique)

**URL d'achat :** `https://communaute.avancersimplement.com/checkout/duo-connecte-v1`

---

## Structure de la landing page

### Section 1 : Hero

**Contenu :**
- Logo Avancer Simplement (mode clair/sombre)
- Texte "AVANCER SIMPLEMENT" (style branding : Montserrat Black Italic)
- Texte "Présente" (style subtitle : Inter Italic)
- Titre principal : "Duo-Connecte"
- Sous-titre : "Un guide pour mieux communiquer dans les moments difficiles"
- Bouton CTA principal : "Commencer maintenant" → lien vers section prix ou directement vers achat

**Visuel :** Image hero (voir section Images ci-dessous)

---

### Section 2 : Le problème / La solution

**Angle :** Partir du problème que vivent les couples, puis présenter la solution.

**Problème à adresser :**
- Les conversations importantes tournent souvent mal
- On tombe dans des automatismes : défense, attaque, justification
- On veut avoir raison plutôt que se comprendre
- Les non-dits s'accumulent et créent de la distance

**Solution :**
- Duo-Connecte offre une structure claire qui guide la conversation
- Chaque étape a un objectif précis
- L'application aide à ralentir, sortir des automatismes, et vraiment s'écouter

---

### Section 3 : Comment ça fonctionne (aperçu simple)

Présenter le parcours en 3-4 étapes simples, sans trop de détails :

1. **Définir vos rôles** - Qui partage son vécu en premier, qui écoute
2. **Exprimer avec authenticité** - Partager votre perspective sans accusation
3. **Écouter avec bienveillance** - Comprendre le vécu de l'autre
4. **Se reconnecter** - Trouver un terrain commun

**Note :** Mentionner la durée recommandée (45-60 minutes) et l'importance d'un endroit calme.

---

### Section 4 : Bénéfices / Pourquoi ça fonctionne

3-4 cartes avec les bénéfices clés :

- **Structure guidée** : Chaque étape vous garde sur la bonne voie
- **Moins de réactivité** : Le format ralentit les automatismes de défense
- **Deux perspectives validées** : Vos deux vérités peuvent coexister
- **Applicable immédiatement** : Utilisable dès qu'une conversation importante se présente

---

### Section 5 : À qui s'adresse Duo-Connecte

**Situations idéales :**
- Un malentendu qui traîne depuis plusieurs jours
- Un non-dit que vous n'arrivez pas à nommer
- Un sujet délicat que vous évitez d'aborder
- Un moment où vous sentez que la connexion s'est perdue

**Ce que ce n'est PAS :**
- Un substitut à une thérapie de couple
- Un outil de gestion de crise (si l'émotion est trop forte, attendre)

---

### Section 6 : Prix

**Présentation simple et claire :**
- Prix : **50$ CAD**
- Paiement unique (pas d'abonnement)
- Accès illimité à l'application
- Bouton : "Acheter Duo-Connecte"

---

### Section 7 : FAQ (4-5 questions)

Questions suggérées (rédiger les réponses de façon concise) :

1. **Combien de temps dure un parcours ?**
   Environ 45 à 60 minutes. Prévoyez un moment calme sans interruptions.

2. **Faut-il des compétences particulières ?**
   Des bases en communication aident : identifier vos émotions, écouter sans interrompre, accepter que l'autre voit les choses différemment.

3. **Peut-on utiliser Duo-Connecte plusieurs fois ?**
   Oui, autant de fois que nécessaire. Chaque conversation difficile peut bénéficier de la structure guidée.

4. **Est-ce que ça remplace une thérapie de couple ?**
   Non. Duo-Connecte est un outil d'accompagnement pour des conversations ponctuelles, pas un suivi thérapeutique.

5. **Mes données sont-elles collectées ?**
   Non. Aucune donnée personnelle n'est collectée. Vos conversations restent privées.

---

### Section 8 : Call-to-action final

- Phrase de clôture motivante
- Bouton : "Acheter Duo-Connecte - 50$"
- Lien : `https://communaute.avancersimplement.com/checkout/duo-connecte-v1`

---

### Section 9 : Témoignages (masquée pour l'instant)

Préparer la structure HTML pour 3 témoignages, mais avec `display: none` en CSS.
Cette section sera activée plus tard quand des témoignages réels seront disponibles.

---

## Spécifications techniques

### Contraintes Circle.so (CRITIQUES)

- **Un seul fichier** : HTML + CSS + JS dans le même bloc
- **Préfixe obligatoire** : Toutes les classes CSS doivent commencer par `mlp-`
- **JavaScript** : Encapsuler dans une IIFE `(function() { 'use strict'; ... })();`
- **Pas de navigation** : Circle.so a déjà sa navigation, ne pas en ajouter

### Responsive

- **Mobile-first** obligatoire
- Breakpoints : 768px (tablette), 1024px (desktop)
- Minimum 320px de largeur supporté

### Mode clair/sombre

- Utiliser `@media (prefers-color-scheme: dark)` pour le mode sombre
- Suivre les couleurs du design system (voir guide technique)

### Accessibilité

- Contraste WCAG AA minimum
- Taille tactile minimum 44x44px pour les boutons
- Alt text sur toutes les images
- Focus visible sur les éléments interactifs

---

## Images à intégrer

### Hébergement Cloudinary

**Cloud name :** `dxhn08di4`

**Structure des URLs :**
```
https://res.cloudinary.com/dxhn08di4/image/upload/[options]/[dossier]/[nom-fichier]
```

**Options recommandées pour optimisation automatique :**
```
q_auto,f_auto
```

**Exemple d'URL complète :**
```
https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/logo-bleu-320.png
```

**Organisation suggérée des dossiers dans Cloudinary :**
- `avancer-simplement/logos/` - Logos de la marque
- `avancer-simplement/duo-connecte/` - Images spécifiques à Duo-Connecte

---

### Logos (fournis)

- **Mode clair** : `logo-bleu-320.png`
- **Mode sombre** : `logo-blanc-320.png`

**URLs des logos (à mettre à jour après upload) :**
```
Logo bleu : https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/logos/logo-bleu-320.png

Logo blanc : https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/logos/logo-blanc-320.png
```

**Instructions pour uploader les logos :**
1. Va dans ton tableau de bord Cloudinary
2. Crée un dossier `avancer-simplement/logos/`
3. Upload les deux fichiers `logo-bleu-320.png` et `logo-blanc-320.png`
4. Les URLs ci-dessus devraient fonctionner automatiquement

---

### Images mockup à créer (placeholder)

Pour chaque image ci-dessous, utiliser un placeholder avec les dimensions indiquées. Je créerai les images finales par la suite avec un générateur d'images.

#### Image 1 : Hero principal
- **Emplacement** : Section Hero, à droite du texte (desktop) ou en dessous (mobile)
- **Dimensions** : 600x400px (ratio 3:2)
- **Description pour génération future** : Illustration d'un couple assis face à face dans un salon chaleureux, ambiance calme et bienveillante. Style illustration moderne et épuré, tons bleus et neutres. Pas de visages détaillés pour rester universel.

#### Image 2 : Mockup téléphone - Écran d'accueil
- **Emplacement** : Section "Comment ça fonctionne"
- **Dimensions** : 300x600px (ratio 1:2, format téléphone)
- **Description pour génération future** : Mockup de téléphone iPhone/Android montrant l'écran d'accueil de Duo-Connecte avec le logo, le titre "Duo-Connecte" et le bouton "Commencer". Interface sombre avec accents bleus.

#### Image 3 : Mockup téléphone - Écran des rôles
- **Emplacement** : Section "Comment ça fonctionne"
- **Dimensions** : 300x600px (ratio 1:2)
- **Description pour génération future** : Mockup de téléphone montrant l'écran "Définir vos rôles" avec les champs Émetteur et Récepteur. Interface sombre avec icône de deux personnes.

#### Image 4 : Illustration bénéfices
- **Emplacement** : Section "Pourquoi ça fonctionne"
- **Dimensions** : 400x300px (ratio 4:3)
- **Description pour génération future** : Illustration abstraite représentant la connexion entre deux personnes. Deux silhouettes reliées par des lignes fluides ou un pont symbolique. Style minimaliste, couleurs bleues et blanches.

#### Image 5 : Illustration situation
- **Emplacement** : Section "À qui s'adresse Duo-Connecte"
- **Dimensions** : 400x300px (ratio 4:3)
- **Description pour génération future** : Illustration d'un couple sur un canapé, l'un tenant un téléphone/tablette, tous deux regardant l'écran ensemble. Ambiance collaborative et sereine. Style illustration moderne.

---

## Placeholder images

Pour le développement, utiliser des placeholders avec les bonnes dimensions :

```html
<!-- Exemple de placeholder -->
<img src="https://placehold.co/600x400/074491/FFFFFF?text=Hero+Image" alt="Description">
```

Service recommandé : `https://placehold.co/` (supporte dimensions et couleurs personnalisées)

---

## URLs finales des images (à compléter)

Une fois les images générées et uploadées sur Cloudinary, utiliser ces URLs :

```
Hero principal (600x400) :
https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/duo-connecte/hero.png

Mockup téléphone - Accueil (300x600) :
https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/duo-connecte/mockup-accueil.png

Mockup téléphone - Rôles (300x600) :
https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/duo-connecte/mockup-roles.png

Illustration bénéfices (400x300) :
https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/duo-connecte/benefices.png

Illustration situation (400x300) :
https://res.cloudinary.com/dxhn08di4/image/upload/q_auto,f_auto/avancer-simplement/duo-connecte/situation.png
```

---

## Ton et style d'écriture

- Vocabulaire accessible et clair
- Paragraphes courts
- Éviter le jargon thérapeutique complexe
- Ton chaleureux mais professionnel
- Utiliser "ça" plutôt que "cela"
- Utiliser "difficultés" plutôt que "faiblesses"
- Utiliser "émotions" plutôt que "ressentis"
- Éviter "dès lors"

---

## Livrables attendus

1. **Fichier HTML unique** : Code complet prêt à copier-coller dans Circle.so
2. **Liste des URLs d'images** : Placeholder à remplacer, avec descriptions pour génération future
3. **Instructions de déploiement** : Étapes pour intégrer dans Circle.so

---

## Checklist finale

Avant de livrer, vérifie :

- [ ] Un seul fichier (HTML + CSS + JS)
- [ ] Toutes les classes préfixées `mlp-`
- [ ] Import des polices Inter + Montserrat
- [ ] CSS Variables pour les couleurs
- [ ] Mode sombre fonctionnel
- [ ] Responsive mobile-first (768px, 1024px)
- [ ] JavaScript dans IIFE
- [ ] Boutons d'achat avec la bonne URL
- [ ] Section témoignages masquée (display: none)
- [ ] Accessibilité (alt, aria, contraste, focus)
- [ ] Placeholders pour les images avec bonnes dimensions
