#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd -P)"
BASENAME="$( basename "$0" )"
REBOOT_CRONJOB="@reboot /bin/bash -l -c \"${BASEDIR}/${BASENAME} check_bootvisor\""
CHECKER_CRONJOB="*/5 * * * * /bin/bash -l -c \"${BASEDIR}/${BASENAME} check_bootvisor\""

restart_bootvisor_if_dead () {
  if ! "${BASEDIR}/init.sh" status &>/dev/null; then
    echo "Bootvisor is offline, restarting..."
    "${BASEDIR}/init.sh" start
  fi
}

remove_line_from_string () {
  echo "$1" | grep -Fvx "$2"
}

is_line_in_string () {
  echo "$1" | grep -Fxq "$2"
}

create_cronfile () {
  mktemp /tmp/bootvisor.XXXX || exit 1
}

# If new cronfile is not empty then load crontab from it
# else remove the crontab
# Check if cronfile exists to prevent removing existing cronfile if file in argument was removed
overwrite_crontab () {
  if [ -f "$1" ]; then
    if [ -s "$1" ]; then
      crontab "$1"
    else
      crontab -r &>/dev/null
    fi
    rm "$1"
  fi
}

delete_cronjobs () {
  local CRONFILE
  local RESULT

  CRONFILE="$(create_cronfile)"
  # Get current user's crontab (redirection used for when there is no initial crontab)
  RESULT="$(crontab -l 2>/dev/null)"

  # Remove periodic check from current crontab (if it exists)
  local SKIPPED_CHECKER
  SKIPPED_CHECKER="$(remove_line_from_string "${RESULT}" "${CHECKER_CRONJOB}")"
  RESULT="${SKIPPED_CHECKER}"

  # Remove reboot check from current crontab (if it exists)
  local SKIPPED_REBOOT
  SKIPPED_REBOOT="$(remove_line_from_string "${RESULT}" "${REBOOT_CRONJOB}")"
  RESULT="${SKIPPED_REBOOT}"

  # Add result to cronfile (if not empty)
  if [ "${RESULT}" ]; then
    echo "${RESULT}" >"${CRONFILE}"
  fi

  overwrite_crontab "${CRONFILE}"
}

cronjobs_exist () {
  local CRONTAB
  CRONTAB="$(crontab -l 2>/dev/null)"

  local EXITCODE
  EXITCODE=0

  if ! is_line_in_string "${CRONTAB}" "${REBOOT_CRONJOB}" &>/dev/null; then
    EXITCODE=$(( $EXITCODE + 1 ))
  fi

  if ! is_line_in_string "${CRONTAB}" "${CHECKER_CRONJOB}" &>/dev/null; then
    EXITCODE=$(( $EXITCODE + 2 ))
  fi

  exit $EXITCODE
}

create_cronjob () {
  local CRONFILE
  local CRONTAB
  local CRONJOB=$1

  CRONFILE="$(create_cronfile)"
  # Get current user's crontab (redirection used for when there is no initial crontab)
  CRONTAB="$(crontab -l 2>/dev/null)"
  # Add previous crontab if it wasn't empty
  if [ "${CRONTAB}" ]; then
    echo "${CRONTAB}" >"${CRONFILE}"
  fi
  # Add the supplied job if it does not already exit
  if ! is_line_in_string "${CRONTAB}" "${CRONJOB}" &>/dev/null; then
    echo  "${CRONJOB}" >>"${CRONFILE}"
  fi

  overwrite_crontab "${CRONFILE}"
}

case "$1" in
  check_bootvisor)
    restart_bootvisor_if_dead
    ;;
  clear)
    delete_cronjobs
    ;;
  cronjobs_exist)
    cronjobs_exist
    exit $?
    ;;
  create_boot_cronjob)
    create_cronjob "${REBOOT_CRONJOB}"
    ;;
  create_interval_cronjob)
    create_cronjob "${CHECKER_CRONJOB}"
    ;;
  *)
    create_cronjob "${REBOOT_CRONJOB}"
    create_cronjob "${CHECKER_CRONJOB}"
    echo "Cronjobs installed."
esac
