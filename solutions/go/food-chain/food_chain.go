package foodchain

import (
	"fmt"
)

type Part = struct {
	name, comment, end string
	rolls              bool
}

var parts = []Part{
	{"fly", "I don't know why she swallowed the fly. Perhaps she'll die.", ".\nI don't know why she swallowed the fly. Perhaps she'll die.", false},
	{"spider", "It wriggled and jiggled and tickled inside her.", " that wriggled and jiggled and tickled inside her.", true},
	{"bird", "How absurd to swallow a bird!", ".", true},
	{"cat", "Imagine that, to swallow a cat!", ".", true},
	{"dog", "What a hog, to swallow a dog!", ".", true},
	{"goat", "Just opened her throat and swallowed a goat!", ".", true},
	{"cow", "I don't know how she swallowed a cow!", ".", true},
	{"horse", "She's dead, of course!", ".", false},
}

func preys(v int) string {
	part := parts[v-1]
	if !part.rolls {
		return ""
	}
	prev := parts[v-2]
	return fmt.Sprintf("\nShe swallowed the %s to catch the %s%s%s", part.name, prev.name, prev.end, preys(v-1))
}

func Verse(v int) string {
	part := parts[v-1]
	return fmt.Sprintf("I know an old lady who swallowed a %s.\n%s%s", part.name, part.comment, preys(v))
}

func Verses(start, end int) string {
	s := ""
	for i := start; i <= end; i++ {
		if s != "" {
			s += "\n\n"
		}
		s += Verse(i)
	}
	return s
}

func Song() string {
	return Verses(1, 8)
}
