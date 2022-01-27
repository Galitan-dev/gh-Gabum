PROJECT_PATH="${GABUM_DIRECTORY}/${args[name]}"

git init "${PROJECT_PATH}"
cd "${PROJECT_PATH}" 

license-generator --project "${args[name]}" --year $(date "+%Y") ${args[license]}
yo standard-readme

if [[ $private ]]; then
    gh repo create "${args[name]}" --private -s "${PROJECT_PATH}"
else
    gh repo create "${args[name]}" --public -s "${PROJECT_PATH}"
fi

code -n "${PROJECT_PATH}"