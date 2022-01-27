if [[ -z "${GABUM_HOME}" ]]; then
  GABUM_HOME="${HOME}/.gabum"
else
  GABUM_HOME="${GABUM_HOME}"
fi

if [[ ! -f "${GABUM_HOME}" ]]; then
    mkdir -p "${GABUM_HOME}"
fi

if [[ -z "${GABUM_DIRECTORY}" ]]; then
  GABUM_DIRECTORY="${HOME}/Documents/Development"
else
  GABUM_DIRECTORY="${GABUM_DIRECTORY}"
fi

if [[ ! -f "${GABUM_DIRECTORY}" ]]
then
    mkdir -p "${GABUM_DIRECTORY}"
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v cargo)" ]; then
  echo 'Error: cargo is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v npm)" ]; then
  echo 'Error: npm is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v license-generator)" ]; then
  echo 'Installing license-generator'
  cargo install license-generator
fi

if ! [ -x "$(command -v yo)" ]; then
  echo 'Installing yeoman'
  npm install --global yo
fi

if [[ ! -f "${GABUM_DIRECTORY}/.cache" ]]; then
  mkdir -p "${GABUM_DIRECTORY}/.cache"
fi

if [[ ! -f "${GABUM_DIRECTORY}/.cache/standard-readme" ]]; then
  echo 'Installing generator-readme-md'
  export npm_config_loglevel=silent
  npm install --global yo generator-standard-readme
  unset npm_config_loglevel
  touch "${GABUM_DIRECTORY}/.cache/standard-readme"
fi
