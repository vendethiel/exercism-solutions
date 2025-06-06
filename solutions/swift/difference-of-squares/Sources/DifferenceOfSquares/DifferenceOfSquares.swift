class Squares {
    var squareOfSum : Int
    var sumOfSquares : Int
    var differenceOfSquares : Int
    init(_ max: Int) {
      let plusOne: Int = max + 1
      let timesPlusOne: Int = max * plusOne
      let doublePlusOne: Int = max * 2 + 1
      
      squareOfSum = timesPlusOne / 2
      squareOfSum = squareOfSum * squareOfSum
        
      sumOfSquares = (doublePlusOne * timesPlusOne) / 6
      
      differenceOfSquares = squareOfSum - sumOfSquares
    }
}
