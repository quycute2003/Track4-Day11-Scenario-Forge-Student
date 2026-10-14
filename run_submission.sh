#!/bin/sh
# Preserve the full student ID using the runner's supported environment override.
export LAB11_MSSV=2A202602745
if [ "$#" -eq 0 ]; then
    set -- all
fi
exec "$(dirname "$0")/.venv/bin/python" "$(dirname "$0")/run_all.py" "$@"
