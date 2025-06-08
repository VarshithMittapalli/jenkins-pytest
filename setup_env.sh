#!/bin/bash

set -e

apt-get update && apt-get install -y python3-pip
echo "Creating Virtual environment"
python3 -m venv .venv

echo "Downloading dependencies"
pip install -r requirements.txt

echo "Running Flake8 check"
flake8 . > lint-report.txt

echo "Running tests with coverage"
pytest --cov=. --cov-report=term --cov-report=xml --junitxml=test-result.xml