COMMIT_HASH=$(git rev-parse --short HEAD)
OUTPUT_DATA_FOLDER="${COMMIT_HASH}"/"${EXPERIMENT_NAME}"
PLOT_SCRIPT="PATH_TO_PLOT_SCRIPT.py"