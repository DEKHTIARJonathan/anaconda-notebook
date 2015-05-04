#!/bin/bash

if [ -f ./.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch ./.root_pw_set

echo "========================================================================"
echo "If needed, here is the root password"
echo ""
echo ""
echo "    Root Password : $PASS"
echo ""
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"