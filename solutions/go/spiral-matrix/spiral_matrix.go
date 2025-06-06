package spiralmatrix

func r(x, y, w int) int {
	if y == 1 {
		return x
	} else {
		return (w / 2) + (r(y-1, (w/2)-x+1, w-1))
	}
}

func SpiralMatrix(size int) [][]int {
	result := [][]int{}
	for x := 1; x <= size; x++ {
		row := []int{}
		for y := 1; y <= size; y++ {
			row = append(row, r(y, x, size*2))
		}
		result = append(result, row)
	}
	return result
}
