# Logic Tensor Networks — présentation et étude de cas pratique

Ce dépôt présente les **Logic Tensor Networks (LTN)**, un framework
neuro-symbolique qui combine apprentissage profond et raisonnement logique
du premier ordre : il fixe la *forme* d'un prédicat au moyen d'une formule
logique, tout en laissant le *contenu* qu'il calcule être appris par
descente de gradient.

Le dépôt se compose de deux volets :

1. **Une présentation théorique** (`presentation/`) : comment un symbole
   logique (constante, prédicat, fonction, variable) est représenté sous
   forme de tenseur (*grounding*), comment les connecteurs et
   quantificateurs logiques sont traduits en opérations différentiables
   (configuration produit stable, quantification diagonale et gardée), et
   comment la satisfaction d'une base de connaissances devient une
   fonction de perte pour l'entraînement d'un réseau de neurones — voir
   les [tutoriels](code/tutorials).
2. **Une étude de cas pratique** (`code/`), basée sur la bibliothèque
   [LTNtorch](https://github.com/logictensornetworks/LTNtorch) : la
   reconnaissance semi-supervisée de chiffres manuscrits, où un LTN
   apprend à reconnaître des chiffres individuels sans jamais recevoir
   leur étiquette, uniquement à partir de la somme de deux chiffres. Les
   résultats sont comparés à une baseline purement supervisée — voir les
   [exemples](code/examples) et en particulier
   [l'étude de cas](code/examples/4-semi-supervised_pattern_recognition.ipynb).

## Structure du dépôt

```
logic-tensor-networks/
├── code/
│   ├── venv/                          environnement virtuel Python (non versionné)
│   ├── requirements.txt               dépendances Python
│   ├── tutorials/                     tutoriels officiels LTNtorch, réécrits en français
│   │   ├── 1-grounding_non_logical_symbols.ipynb
│   │   ├── 2-grounding_connectives.ipynb
│   │   ├── 2b-operators-and-gradients.ipynb
│   │   └── 3-knowledgebase-and-learning.ipynb
│   └── examples/                      exemples officiels LTNtorch
│       ├── 1-binary_classification.ipynb
│       ├── 2-multi_class_single_label_classification.ipynb
│       ├── 3-multi_class_multi_label_classification.ipynb
│       ├── 4-semi-supervised_pattern_recognition.ipynb   <- étude de cas de la présentation
│       ├── 5-regression.ipynb
│       ├── 6-clustering.ipynb
│       ├── 7-learning_embeddings_with_LTN.ipynb
│       ├── datasets/
│       └── images/
│
└── presentation/
    ├── main.tex          source unique de la présentation (Beamer)
    ├── main-notes.tex    wrapper qui active les notes de l'orateur
    ├── images/           figures utilisées dans les diapositives
    ├── build.sh          construit main.pdf et main-notes.pdf
    ├── latexmkrc         configuration latexmk (active -shell-escape pour minted)
    └── README.md         détails de compilation et conventions d'écriture
```

### Tutoriels (`code/tutorials/`)

Les tutoriels officiels de LTNtorch, réécrits pédagogiquement en français,
à suivre dans l'ordre. Chacun introduit un niveau supplémentaire du
framework :

1. **Grounding des symboles non logiques** — Real Logic : comment une
   constante, un prédicat, une fonction ou une variable devient un
   tenseur ou une fonction différentiable.
2. **Grounding des connecteurs** — traduction des connecteurs logiques
   (∧, ∨, ¬, ⇒) en opérations floues différentiables (configuration
   produit).
3. **Opérateurs et gradients** — les trois pièges du gradient (gradient
   qui s'annule, à passage unique, qui explose) et la configuration
   produit *stable* qui les évite.
4. **Base de connaissances et apprentissage** — quantificateurs (∀, ∃),
   moyenne généralisée (`pMean`), et satisfaction d'une base de
   connaissances (`SatAgg`) comme objectif d'entraînement.

### Exemples (`code/examples/`)

Le dossier conserve l'ensemble des exemples officiels de LTNtorch pour
référence. L'exemple **4 — reconnaissance de motifs semi-supervisée** est
celui développé dans la présentation : un LTN apprend un classifieur de
chiffres MNIST sans jamais recevoir l'étiquette d'un chiffre individuel,
uniquement la somme de deux chiffres, et sa capacité à généraliser est
comparée à une baseline purement supervisée sur l'addition à un et deux
chiffres.

## Prise en main

### Environnement du code

**Windows (PowerShell)**
```powershell
cd code
python -m venv venv
venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

**Linux / macOS**
```bash
cd code
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Lancer ensuite Jupyter depuis `code/` :
```bash
jupyter notebook
```

et ouvrir `examples/4-semi-supervised_pattern_recognition.ipynb` pour
reproduire l'étude de cas présentée.

### Compilation de la présentation

Nécessite une distribution LaTeX avec `latexmk` et `pdflatex`, ainsi que
Python et [Pygments](https://pygments.org/) (requis par `minted` pour la
coloration syntaxique, via `-shell-escape`).

Depuis `presentation/` :

```bash
latexmk -pdf main.tex          # -> main.pdf         (diapos, sans notes, à partager)
latexmk -pdf main-notes.tex    # -> main-notes.pdf    (diapos + notes de l'orateur)
```

ou, pour construire les deux d'un coup :

```bash
cd presentation
./build.sh
```

Le détail des conventions d'écriture (modes de notes, contraintes sur les
frames `minted`, palette de couleurs) est documenté dans
[`presentation/README.md`](presentation/README.md).

## Références

- Badreddine, S., d'Avila Garcez, A., Serafini, L., & Spranger, M. (2022).
  *Logic Tensor Networks*. Artificial Intelligence, 303, 103649.
- Manhaeve, R., Dumančić, S., Kimmig, A., Demeester, T., & De Raedt, L.
  (2018). *DeepProbLog: Neural Probabilistic Logic Programming*. NeurIPS.
- Carraro, T. LTNtorch —
  [github.com/logictensornetworks/LTNtorch](https://github.com/logictensornetworks/LTNtorch)
- LeCun, Y., Cortes, C., & Burges, C. *The MNIST Database of Handwritten
  Digits*.
