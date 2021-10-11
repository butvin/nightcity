#!/usr/bin/env sh
# Rebuild apps containers

# shellcheck disable=SC2046
docker stop $(docker ps -q -a); \

# shellcheck disable=SC2046
docker rm $(docker ps -qa); \

# shellcheck disable=SC2046
make \
    --debug=basic \
    --warn-undefined-variables && \
printf "\n\tMakefile: Completed. Build success!\n\n";





















#
##!/usr/bin/env sh
#set -e
#
#EXITCODE=0
#
## bits of this were adapted from lxc-checkconfig
## see also https://github.com/lxc/lxc/blob/lxc-1.0.2/src/lxc/lxc-checkconfig.in
#
#possibleConfigs="
#	/proc/config.gz
#	/boot/config-$(uname -r)
#	/usr/src/linux-$(uname -r)/.config
#	/usr/src/linux/.config
#"
#
#if [ $# -gt 0 ]; then
#	CONFIG="$1"
#else
#	: "${CONFIG:=/proc/config.gz}"
#fi
#
#if ! command -v zgrep > /dev/null 2>&1; then
#	zgrep() {
#		zcat "$2" | grep "$1"
#	}
#fi
#
#kernelVersion="$(uname -r)"
#kernelMajor="${kernelVersion%%.*}"
#kernelMinor="${kernelVersion#$kernelMajor.}"
#kernelMinor="${kernelMinor%%.*}"
#
#is_set() {
#	zgrep "CONFIG_$1=[y|m]" "$CONFIG" > /dev/null
#}
#is_set_in_kernel() {
#	zgrep "CONFIG_$1=y" "$CONFIG" > /dev/null
#}
#is_set_as_module() {
#	zgrep "CONFIG_$1=m" "$CONFIG" > /dev/null
#}
#
#color() {
#	codes=
#	if [ "$1" = 'bold' ]; then
#		codes='1'
#		shift
#	fi
#	if [ "$#" -gt 0 ]; then
#		code=
#		case "$1" in
#			# see https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
#			black) code=30 ;;
#			red) code=31 ;;
#			green) code=32 ;;
#			yellow) code=33 ;;
#			blue) code=34 ;;
#			magenta) code=35 ;;
#			cyan) code=36 ;;
#			white) code=37 ;;
#		esac
#		if [ "$code" ]; then
#			codes="${codes:+$codes;}$code"
#		fi
#	fi
#	printf '\033[%sm' "$codes"
#}
#wrap_color() {
#	text="$1"
#	shift
#	color "$@"
#	printf '%s' "$text"
#	color reset
#	echo
#}
#
#wrap_good() {
#	echo "$(wrap_color "$1" white): $(wrap_color "$2" green)"
#}
#wrap_bad() {
#	echo "$(wrap_color "$1" bold): $(wrap_color "$2" bold red)"
#}
#wrap_warning() {
#	wrap_color >&2 "$*" red
#}