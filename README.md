# PPIF Binder Design Project

Computational protein binder design targeting human PPIF (peptidyl-prolyl isomerase F / Cyclophilin D) using BoltzGen, an all-atom diffusion model run on [Modal](https://modal.com).

PPIF is a possible therapeutic target for Alzheimer's disease. Inhibiting PPIF in the brain could also have a neuroprotective effect during recovery from ischemia. This project focuses solely on generating plausible candidate binders -- it does not address immunogenicity, blood-brain barrier crossing, cell penetration, etc.

## Prerequisites

- Python >= 3.12
- [uv](https://docs.astral.sh/uv/) for dependency management
- A [Modal](https://modal.com) account (for running BoltzGen)

## Getting Started

1. **Install dependencies**

   ```sh
   uv sync
   ```

2. **Fetch the target structure**

   Download the PPIF crystal structure (PDB 2BIT) from RCSB PDB into the `data/` directory:

   ```sh
   uv run scripts/fetch_structure.py
   ```

   This saves `data/2bit.cif`, which is the default target used by the design pipeline. You can also specify a different PDB ID if you prefer:

   ```sh
   uv run scripts/fetch_structure.py 1w8m
   ```

## Project Structure

```
scripts/              Local helper scripts (data fetching, analysis)
modal_scripts/        BoltzGen design scripts that run on Modal
data/                 Downloaded structures and design outputs
```
