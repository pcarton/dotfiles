#! /bin/sh
curl -L https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py

python3 /tmp/get-pip.py

python3 -m pip install --user pipx
python3 -m pipx ensurepath

if [ -f "/etc/debian_version" ]; then
   sudo apt update
   sudo apt install -y python3-venv
fi

~/.local/bin/pipx install --include-deps ansible
