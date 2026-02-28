"""Download a PDB structure from RCSB PDB.

Usage:
    uv run python fetch_structure.py [pdb_id]
"""

import argparse
from pathlib import Path

import requests

OUT_DIR = Path("modal")


def main() -> None:
    parser = argparse.ArgumentParser(description="Download a structure from RCSB PDB.")
    parser.add_argument("pdb_id", nargs="?", default="2bit", help="PDB ID to download (default: 2bit)")
    args = parser.parse_args()

    pdb_id = args.pdb_id.lower()
    url = f"https://files.rcsb.org/download/{pdb_id}.cif"

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    out_path = OUT_DIR / f"{pdb_id}.cif"
    print(f"Downloading {pdb_id}.cif ... ", end="")
    resp = requests.get(url)
    resp.raise_for_status()
    out_path.write_bytes(resp.content)
    print("done.")
    print(f"Saved to {out_path}")


if __name__ == "__main__":
    main()
