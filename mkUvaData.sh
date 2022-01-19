sed -n "s/\[\([0-9]\+\),\([0-9]\+\),\"\(.*\)\".*/\2:\n id: \1\n name: \"\3\"\n/p" < ~/class/cs491cap/web-wowchemy/uva-problems.json
