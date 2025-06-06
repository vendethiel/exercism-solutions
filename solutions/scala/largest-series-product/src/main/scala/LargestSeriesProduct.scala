object Series {
  def largestProduct(c: Int, s: String): Option[Int] = {
    if (c > s.length || c < 1 || s.exists(_.isLetter))
      None
    else
      Some(s.split("").map(_.toInt).sliding(c).map(_.product).max)
  }
}