# Create local venv
python3 -m venv .venv
source .venv/bin/activate

# update pip
pip install --upgrade pip

# Download latest pyi typings
pip install ghidra-stubs

# Install pyhdira
pip install pyghidra
