.PHONY: help clean fetch proc fetch-proc clean-data modal-check modal-small

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

clean: ## Remove __pycache__ dirs and .pyc files
	find . -type d -name __pycache__ -exec rm -rf {} + && \
	find . -type f -name '*.pyc' -delete

fetch: ## Run scripts/fetch_structure.py
	uv run python scripts/fetch_structure.py

proc: ## Run scripts/process_structure.py
	uv run python scripts/process_structure.py

fetch-proc: fetch proc ## Run fetch then process

clean-data: ## Remove all .cif and .pdb files from data/
	rm -f data/*.cif data/*.pdb

modal-check: ## Check Modal / BoltzGen connectivity
	modal run scripts/run_boltzgen_modal.py --check

modal-small: ## Run BoltzGen on Modal (100 designs)
	modal run scripts/run_boltzgen_modal.py --num-designs 100
