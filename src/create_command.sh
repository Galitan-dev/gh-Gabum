PROJECT_PATH="${GABUM_DIRECTORY}/${args[name]}"

git init "${PROJECT_PATH}"
cd "${PROJECT_PATH}"

gh repo create

code -nw "${PROJECT_PATH}"