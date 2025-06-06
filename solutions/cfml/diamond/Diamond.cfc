/**
* Your implementation of the Diamond exercise
*/
component {
	
	/**
	* @returns 
	*/
	array function rows( letter ) {
		var ary = [];
    var lc = Asc(letter) - 65;
    for (var i = 0; i LTE lc; i = i + 1) {
      var s = RepeatString(" ", lc * 2 + 1);
      s = RemoveChars(s, lc - i + 1, 1);
      s = Insert(Chr(i + 65), s, lc - i);
      s = RemoveChars(s, lc + i + 1, 1);
      s = Insert(Chr(i + 65), s, lc + i);
      ary.push(s);
    }
    if (lc > 0) {
      ArrayAppend(ary, ary.reverse().slice(2), true);
    }
    return ary;
	}
	
}
