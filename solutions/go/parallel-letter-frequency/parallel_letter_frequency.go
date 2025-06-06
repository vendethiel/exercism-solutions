package letter

import (
    "sync"
)

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	return frequencies
}

func ParFreq(wg *sync.WaitGroup, ch chan<- FreqMap, text string) {
	defer wg.Done()
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	ch <- frequencies
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
    var wg sync.WaitGroup
    
    freqChan := make(chan FreqMap)
    final := FreqMap{}
    
    for _, text := range texts {
        wg.Add(1)
        go ParFreq(&wg, freqChan, text)
    }
	go (func () {
       wg.Wait()
       close(freqChan)
    })()

    for freq := range freqChan {
        for r, c := range freq {
            final[r] += c
        }
    }
	return final
}
