import RegexBuilder

enum PhoneNumberError: Error {
  case invalidPhoneNumber
}

class PhoneNumber {
  let number: String
  init(_ phoneNumber: String) {
    number = phoneNumber
  }

  func clean() throws(PhoneNumberError) -> String {
    if number.contains("@") {
      throw .invalidPhoneNumber
    }

    var numbers = number.filter { c in 48...57 ~= c.asciiValue ?? 0 }
    switch numbers.count {
    case 11:
      if numbers.first != "1" {
        throw .invalidPhoneNumber
      }
      numbers.removeFirst()
      fallthrough
    case 10:
      if (numbers.first == "0" || numbers.first == "1") {
        throw .invalidPhoneNumber
      }
      let exchange = numbers[numbers.index(numbers.startIndex, offsetBy: 3)]
      if (exchange == "0" || exchange == "1") {
        throw .invalidPhoneNumber
      }
      return numbers
    default:
      throw .invalidPhoneNumber
    }
  }
}
