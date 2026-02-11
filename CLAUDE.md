# PPIF Binder Design Project

## Overview

This project demonstrates using AI agents for computational protein binder design. We use BoltzGen (running on Modal) to generate candidate binders that inhibit human PPIF (peptidyl-prolyl isomerase F / Cyclophilin D).

## Therapeutic Rationale

PPIF is a possible therapeutic target for Alzheimer's disease. Inhibiting PPIF in the brain could also have a neuroprotective effect during recovery from ischemia. For this project we focus solely on generating plausible candidate binders — we are not addressing immunogenicity, blood-brain barrier crossing, cell penetration, or intracellular target engagement.

## Tools & Stack

- **BoltzGen** — all-atom diffusion model for protein binder design (run via Modal)
- **uv** — Python project and dependency management
- **ruff** — formatting and linting
- **Python >=3.12**

## Development

```sh
uv sync          # install dependencies
uv run ruff check .   # lint
uv run ruff format .  # format
```
