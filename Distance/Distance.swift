class Distance: CustomStringConvertible , Comparable { //set my private var
  private(set) var miles: Int
  private(set) var yards: Int
  private(set) var feet: Int
  private(set) var inches: Int
  public var description: String {
    "\(miles)m \(yards)y \(feet)' \(inches)'' "
  }
  
  init?() {
    self.miles = 0
    self.yards = 0
    self.feet = 0
    self.inches = 0
  }
  
  init? (inches: Int) {
    if inches < 0 {
      return nil
    }
    var addNumb: Int
    if inches >= 12 {
      self.inches = inches - ((inches/12) * 12)
      addNumb = (inches / 12)
      self.feet = addNumb
    } else {
      self.inches = inches
      self.feet = 0
    }
    if feet >= 3 {
      self.feet = feet - ((feet/3) * 3)
      addNumb = (feet / 3)
      self.yards = addNumb
    } else {
      self.inches = inches - ((inches/12) * 12)
      self.feet = inches / 12
      self.yards = 0
    }
    if yards >= 1760 {
      self.yards = yards - ((yards/1760) * 1760)
      addNumb = (yards/1760)
      self.miles = addNumb
    } else {
      self.inches = inches - ((inches/12) * 12)
      self.feet = inches / 12
      self.yards = feet / 3
      self.miles = 0
    }
    self.miles = (yards / 1760)
    if inches >= 12 {
      self.inches = inches % 12
      self.feet = feet + (inches / 12)
    } else {
      self.inches = inches
    }
    if feet >= 3 {
      self.feet = feet % 3
      self.yards = yards + (feet / 3)
    } else {
      self.feet = feet + (inches / 12)
    }
    if yards >= 1760 {
      self.yards = yards % 1760
      self.miles = miles + (yards / 1760)
    } else {
      self.yards = yards + (feet / 3)
    }
    self.miles = miles + (yards / 1760)
  }
  
  init? (miles: Int , yards: Int, feet: Int , inches: Int ) { // starting the init
    if miles < 0 || yards < 0 || feet < 0 || inches < 0 {
      return nil
    }
    if inches >= 12 {
      self.inches = inches % 12
      self.feet = feet + (inches / 12)
    } else {
      self.inches = inches
    }
    if feet >= 3 {
      self.feet = feet % 3
      self.yards = yards + (feet / 3)
    } else {
      self.feet = feet + (inches / 12)
    }
    if yards >= 1760 {
      self.yards = yards % 1760
      self.miles = miles + (yards / 1760)
    } else {
      self.yards = yards + (feet / 3)
    }
    self.miles = miles + (yards / 1760)
  }
  
  static func ==(lhs: Distance, rhs: Distance) -> Bool { // function to compare ===
    if lhs.miles == rhs.miles && lhs.yards == rhs.yards && lhs.feet == rhs.feet && lhs.inches == rhs.inches {
      return true
    }
    return false
  }
  
  static func *(lhs: Distance, x: Int) -> Distance? {
    let newM = lhs.miles * x
    let newY = lhs.yards * x
    let newF = lhs.feet * x
    let newI = lhs.inches * x
    if let newDistance = Distance(miles: newM, yards: newY, feet: newF, inches: newI) {
      return newDistance
    } else {
      return nil
    }
  }
  
  static func +(lhs: Distance, rhs: Distance) -> Distance? {
    let newM = lhs.miles + rhs.miles
    let newY = lhs.yards + rhs.yards
    let newF = lhs.feet + rhs.feet
    let newI = lhs.inches + rhs.inches
    if let newDistamce = Distance(miles: newM, yards: newY, feet: newF, inches: newI) {
      return newDistamce
    } else {
      return nil
    }
  }
  
  static func <(lhs: Distance, rhs: Distance) -> Bool { // func to compare higher ><
    if lhs.miles < rhs.miles {
      return true
    } else if lhs.miles > rhs.miles {
      return false
    }
    if lhs.yards < rhs.yards {
      return true
    } else if lhs.yards > rhs.yards {
      return false
    }
    if lhs.feet < rhs.feet {
      return true
    } else if lhs.feet > rhs.feet {
      return false
    }
    if lhs.inches < rhs.inches {
      return true
    }
    return false
  }
  
  static func -(lhs: Distance, rhs: Distance) -> Distance? {
    var newM: Int
    var newY: Int
    var newF: Int
    var newI: Int
    if lhs.miles < rhs.miles {
      newM = 0
    } else {
      newM = lhs.miles - rhs.miles
    }
    if lhs.yards < rhs.yards {
      newY = 0
    } else {
      newY = lhs.miles - rhs.miles
    }
    if lhs.feet < rhs.feet {
      newF = 0
    } else {
      newF = lhs.feet - rhs.feet
    }
    if lhs.inches < rhs.inches {
      newI = 0
    } else {
      newI = lhs.inches - rhs.inches
    }
    if let newDistance = Distance(miles: newM, yards: newY, feet: newF, inches: newI) {
      return newDistance
    } else {
      return nil
    }
  }
  
  static func +=(lhs: Distance, x: Int) {
    if let newDistance = Distance(miles: lhs.miles, yards: lhs.yards, feet: lhs.feet, inches: lhs.inches + x) {
      lhs.miles = newDistance.miles
      lhs.yards = newDistance.yards
      lhs.feet = newDistance.feet
      lhs.inches = newDistance.inches
    }
  }
}
