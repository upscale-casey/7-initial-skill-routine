#!/usr/bin/env python3
"""
Setup script that runs at the start of each cloud routine execution.
Installs required Python dependencies.
"""
import subprocess
import sys

subprocess.check_call([sys.executable, "-m", "pip", "install", "openpyxl", "-q"])
print("Dependencies installed.")
