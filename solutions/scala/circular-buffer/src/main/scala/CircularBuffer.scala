class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {
  var x = Vector.empty[Int]

  def write(value: Int) =
    if (x.size < capacity) x :+= value
    else throw new FullBufferException()

  def read(): Int =
    if (x.nonEmpty) {
      val ret = x.head
      x = x.tail
      ret
    }
    else throw new EmptyBufferException()

  def overwrite(value: Int) = {
    if (x.size == capacity) x = x.tail
    write(value)
  }

  def clear() = x = Vector.empty[Int]
}