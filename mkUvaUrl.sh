sed -n "s/\[\([0-9]\+\),$1,\"\(.*\)\".*/{{<UVa id=\"\1\" name=\"$1 - \2\">}}/p" < ~/class/cs491cap/web-wowchemy/uva-problems.json
