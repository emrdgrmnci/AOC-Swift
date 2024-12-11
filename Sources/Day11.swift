import Algorithms
import Foundation

struct Stone {
  var number: Int
  
  func transform() -> [Stone] {
    if number == 0 {
      return [Stone(number: 1)]
    }
    
    let digits = String(number).count
    if digits.isMultiple(of: 2) {
      let strNum = String(number)
      let mid = digits / 2
      let leftStr = String(strNum.prefix(mid))
      let rightStr = String(strNum.suffix(mid))
      
      return [
        Stone(number: Int(leftStr) ?? 0),
        Stone(number: Int(rightStr) ?? 0)
      ]
    }
    return [Stone(number: number * 2024)]
  }
}

struct Day11: AdventDay {
  var data: String
  
  // Helper function to count digits in a number
  private func digitCount(_ number: Int) -> Int {
    return String(number).count
  }
  
  private func simulateBlinks(count: Int) -> Int {
    // Use a dictionary to store count of each number
    var numberCounts: [Int: Int] = [:]
    
    // Initialize counts from input data
    for numberStr in data.split(separator: " ") {
      let number = Int(numberStr) ?? 0
      numberCounts[number, default: 0] += 1
    }
    
    // Process each iteration
    for iteration in 0..<count {
      var newCounts: [Int: Int] = [:]
      
      // Process each unique number and its count
      for (number, count) in numberCounts {
        let stone = Stone(number: number)
        let transformed = stone.transform()
        
        // Add transformed stones to new counts
        for newStone in transformed {
          newCounts[newStone.number, default: 0] += count
        }
      }
      
      numberCounts = newCounts
      
      // Debug printing every 10 iterations
      if iteration % 10 == 0 {
        let totalStones = numberCounts.values.reduce(0, +)
        print("Iteration \(iteration): Total stones = \(totalStones)")
      }
    }
    
    // Return total count of stones
    return numberCounts.values.reduce(0, +)
  }
  
  func part1() -> Any {
    return simulateBlinks(count: 25)
  }
  
  func part2() -> Any {
    return simulateBlinks(count: 75)
  }
}
