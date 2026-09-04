# Logic Tensor Networks — Présentation et implémentation pratique

Ce projet présente les **Logic Tensor Networks (LTN)**, un framework
neuro-symbolique qui combine apprentissage profond et raisonnement logique
du premier ordre.

Il se compose de deux volets :

1. Une présentation théorique du fonctionnement du framework : comment un
   symbole logique (constante, prédicat, fonction) est représenté sous
   forme de tenseur, comment les connecteurs et quantificateurs logiques
   sont traduits en opérations différentiables, et comment la
   satisfiabilité d'une base de formules devient une fonction de perte
   pour l'entraînement d'un réseau de neurones.
2. Une implémentation pratique basée sur la bibliothèque
   [LTNtorch](https://github.com/logictensornetworks/LTNtorch), avec une
   comparaison expérimentale entre un classifieur entraîné avec et sans
   contraintes logiques.

## Contenu du dépôt

Le dossier `presentation/` contient le support de présentation (fichier
Beamer), tandis que le dossier `code/` contient l'environnement Python et
les notebooks Jupyter utilisés pour explorer LTNtorch et développer le TP.

## Structure du projet

```
LTN-TP/
├── code/
│   ├── venv/                  environnement virtuel Python
│   ├── tutorials/             tutoriels officiels LTNtorch
│   ├── examples/               exemples officiels LTNtorch (référence)
│   ├── mon_tp.ipynb            implémentation adaptée pour le TP
│   └── requirements.txt        dépendances Python
│
└── presentation/
    ├── main.tex                 fichier Beamer principal
    └── figures/                  plots et captures exportés depuis code/
```

### Tutoriels (`code/tutorials/`)

Les tutoriels officiels sont à suivre dans l'ordre. Chacun introduit un
niveau supplémentaire du framework :

1. **Grounding en LTN (partie 1)** — Real Logic, constantes, prédicats,
   fonctions et variables. Explique comment un symbole logique est
   représenté comme un tenseur ou une fonction différentiable.
2. **Grounding en LTN (partie 2)** — connecteurs logiques et
   quantificateurs (∧, ∨, ¬, ⇒, ∀, ∃). Explique leur traduction en
   opérations floues différentiables, avec un complément sur le choix des
   opérateurs adaptés à l'apprentissage par gradient.
3. **Apprentissage en LTN** — utilisation de la satisfiabilité d'une base
   de formules comme objectif d'entraînement (fonction de perte).

### Exemples (`code/examples/`)

Le dossier conserve l'ensemble des exemples officiels LTNtorch pour
référence. Seul l'exemple de **classification binaire** est repris et
adapté comme base du TP de ce projet.

## Prise en main

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

## Références

- Badreddine, S., d'Avila Garcez, A., Serafini, L., & Spranger, M. (2022).
  *Logic Tensor Networks*. Artificial Intelligence, 303, 103649.
- Carraro, T. LTNtorch — [github.com/logictensornetworks/LTNtorch](https://github.com/logictensornetworks/LTNtorch)