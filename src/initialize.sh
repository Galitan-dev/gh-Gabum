if [[ -z "${GABUM_HOME}" ]]; then
  GABUM_HOME="${HOME}/.gabum"
else
  GABUM_HOME="${GABUM_HOME}"
fi

if [[ ! -f "${GABUM_HOME}" ]]
then
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