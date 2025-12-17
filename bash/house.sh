#!/usr/bin/env bash

readonly sfx=(
	"the house that Jack built."
	"the malt"
	"the rat"
	"the cat"
	"the dog"
	"the cow with the crumpled horn"
	"the maiden all forlorn"
	"the man all tattered and torn"
	"the priest all shaven and shorn"
	"the rooster that crowed in the morn"
	"the farmer sowing his corn"
	"the horse and the hound and the horn"
)
readonly pfx=(
	"that lay in "
	"that ate "
	"that killed "
	"that worried "
	"that tossed "
	"that milked "
	"that kissed "
	"that married "
	"that woke "
	"that kept "
	"that belonged to "
	"This is "
)


print_verse() {
	b="$1"
	e="$2"
	for (( i=$(( $e-1 )); i>=$(( $b-1 )); i-- ))
	do
		prefix="${pfx[$i]}"
		[[ $i == $(( $e-1 )) ]] && prefix="${pfx[11]}"
		echo -e "$prefix${sfx[$i]}"
	done
}

begin="$1"
end="$2"

if (( begin < 1 || begin > 12 || end < 1 || end > 12 )); then
	echo "invalid"
	exit 1
fi
for (( i=1; i<=$end; i++))
do
	rhyme=$( print_verse 1 $i )
	[[ $i -ge $begin ]] && echo -e "$rhyme\n"
done
