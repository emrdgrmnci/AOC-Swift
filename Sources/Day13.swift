import Foundation

struct Positionss: Equatable {
  let x, y: Int
  
  static func +(lhs: Positionss, rhs: Positionss) -> Positionss {
    Positionss(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }
  
  static func *(lhs: Int, rhs: Positionss) -> Positionss {
    Positionss(x: lhs * rhs.x, y: lhs * rhs.y)
  }
}

struct Machine {
  let buttonA: Positionss
  let buttonB: Positionss
  let prize: Positionss
  
  var tokensToSolve: Int? {
    // Using the same mathematical approach as the working solution
    let determinant = buttonA.x * buttonB.y - buttonA.y * buttonB.x
    guard determinant != 0 else { return nil }
    
    // Calculate values using the equations from the working solution
    let a = (prize.x * buttonB.y - prize.y * buttonB.x) / determinant
    let b = (buttonA.x * prize.y - buttonA.y * prize.x) / -determinant
    
    // Verify solution and calculate tokens
    let resultPos = (a * buttonA) + (b * buttonB)
    guard resultPos.x == prize.x && resultPos.y == prize.y && a >= 0 && b >= 0 else {
      return nil
    }
    
    return 3 * a + b
  }
  
  func withIncreasedPrize() -> Machine {
    let offset = 10_000_000_000_000
    return Machine(
      buttonA: buttonA,
      buttonB: buttonB,
      prize: prize + Positionss(x: offset, y: offset)
    )
  }
}

struct Day13: AdventDay {
  var data: String
  
  func parseMachines() -> [Machine] {
    let blocks = data.split(separator: "\n\n")
    return blocks.compactMap { block in
      let lines = block.split(separator: "\n").map(String.init)
      guard lines.count == 3 else { return nil }
      
      // Parse Button A
      guard let aMatch = lines[0].firstMatch(of: /Button A: X\+(-?\d+), Y\+(-?\d+)/)?.output,
            let aX = Int(String(aMatch.1)),
            let aY = Int(String(aMatch.2)) else { return nil }
      
      // Parse Button B
      guard let bMatch = lines[1].firstMatch(of: /Button B: X\+(-?\d+), Y\+(-?\d+)/)?.output,
            let bX = Int(String(bMatch.1)),
            let bY = Int(String(bMatch.2)) else { return nil }
      
      // Parse Prize
      guard let pMatch = lines[2].firstMatch(of: /Prize: X=(-?\d+), Y=(-?\d+)/)?.output,
            let pX = Int(String(pMatch.1)),
            let pY = Int(String(pMatch.2)) else { return nil }
      
      return Machine(
        buttonA: Positionss(x: aX, y: aY),
        buttonB: Positionss(x: bX, y: bY),
        prize: Positionss(x: pX, y: pY)
      )
    }
  }
  
  func part1() -> Any {
    let machines = parseMachines()
    return machines.reduce(0) { total, machine in
      guard let tokens = machine.tokensToSolve else { return total }
      return total + tokens
    }
  }
  
  func part2() -> Any {
    let machines = parseMachines()
    return machines.reduce(0) { total, machine in
      guard let tokens = machine.withIncreasedPrize().tokensToSolve else { return total }
      return total + tokens
    }
  }
}
