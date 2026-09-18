# Présentation — compilation

Une seule source (`main.tex`), deux PDF.

## Le PDF à projeter (sans notes) — c'est le mode par défaut

```bash
latexmk -pdf main.tex
```

Produit `main.pdf`. **Aucune note n'y figure jamais**, quel que soit ce qui est
écrit dans les `\note{}` : le mode par défaut est `hide notes`. C'est ce fichier
qu'on partage en réunion.

## Le PDF annoté (pour l'orateur)

```bash
latexmk -pdf main-notes.tex
```

Produit `main-notes.pdf` : page large, diapo à gauche, discours à droite,
**une page par diapo**. Ce fichier ne doit jamais être partagé.

`main-notes.tex` ne contient aucun contenu — il active les notes puis charge
`main.tex`. Tout le fond se modifie dans `main.tex` uniquement.

### Autres modes de notes

Dans `main-notes.tex`, remplacer `cote` par :

| mode | rendu | usage |
|---|---|---|
| `cote` | diapo à gauche + notes à droite (défaut) | parler en direct |
| `pages` | diapo, puis page de notes, en alternance | imprimer |
| `seules` | les notes seules | relire le discours |

## En visioconférence

Partager **la fenêtre** du lecteur affichant `main.pdf` — pas l'écran entier.
Ainsi `main-notes.pdf`, ouvert à côté ou sur un second écran, reste invisible
même si on change de fenêtre par réflexe.

## Contraintes d'écriture

- Toute diapo contenant du `minted` doit être `\begin{frame}[fragile]{...}`.
- **Une note = une page.** À la taille utilisée, cela représente environ
  230–240 mots, soit à peu près 1 min 30 de parole. Au-delà, le texte est
  silencieusement coupé en bas de page — vérifier le rendu après chaque ajout.
- La palette tient en 4 lignes en tête de `main.tex` (`accent`, `ink`, `ash`,
  `mist`) : changer `accent` suffit à retourner toute l'identité visuelle.
