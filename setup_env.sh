#!/bin/bash

set -e

echo "🔧 Updating package list and installing Python3 and pip..."
sudo apt update
sudo apt install -y python3 python3-pip python3-venv

echo "Creating Virtual environment"
python3 -m venv .venv
source .venv/bin/activate

echo "Downloading dependencies"
pip install --upgrade pip
pip install -r requirements.txt

echo "Running Flake8 check"
flake8 . > lint-report.txt

echo "Running tests with coverage"
pytest --cov=. --cov-report=term --cov-report=xml --junitxml=test-result.xml