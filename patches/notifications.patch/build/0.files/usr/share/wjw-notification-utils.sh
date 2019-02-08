#!/bin/bash

_DEBUG=1

_() {
	/usr/bin/wjw-log 'wjw-notification-utils.sh' $@
	
	$@
}

notify_user() {
	_ wall ${1}
}
