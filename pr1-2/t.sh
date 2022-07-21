#!/usr/bin/env bash
strcmd=""
echo "\begin{maximai}"
while read -t 1 line; do
	strcmd="$strcmd$line";
	echo "$line"
done
if [ "$strcmd" = "" ]; then
	exit
fi
strcmd="$strcmd tex(%)$"
tmpfile=`mktemp`
maxima --very-quiet --batch-string="$strcmd" > "$tmpfile"
if [ $? -ne 0 ]; then
	echo "Maxima Error!"
	echo "\end{maximai}"
	echo "\begin{maximao}"
	rm -rf "$tmpfile"
	exit
fi

sed -n '/^\$\$/,$p' -i "$tmpfile"
sed -n 's/^\$\$//;s/\$\$$//;p' -i "$tmpfile"

echo "\end{maximai}"
echo "\begin{maximao}"
cat "$tmpfile"
rm -rf "$tmpfile"
echo "\end{maximao}"

exit

f(a,n):=sum(a^i,i,1,n)$
f(a,100);

f(a,n):=sum(a^i,i,1,n)$
f(a,5);
