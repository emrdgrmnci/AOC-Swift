import Algorithms
import Foundation
import RegexBuilder

struct Day03: AdventDay {
  var data: String
  
  struct Mul: Equatable {
    let x: Int
    let y: Int
    var result: Int { x * y }
  }
  
  enum Instruction {
    case multiply(Mul)
    case enable    // do()
    case disable   // don't()
  }
  
  func parseInstructions() -> [Instruction] {
    var instructions: [Instruction] = []
    var position = data.startIndex
    
    while position < data.endIndex {
      let remaining = String(data[position...])
      
      if let range = remaining.range(of: #"do\(\)"#, options: .regularExpression) {
        instructions.append(.enable)
        position = data.index(position, offsetBy: range.upperBound.utf16Offset(in: remaining))
        continue
      }
      
      if let range = remaining.range(of: #"don't\(\)"#, options: .regularExpression) {
        instructions.append(.disable)
        position = data.index(position, offsetBy: range.upperBound.utf16Offset(in: remaining))
        continue
      }
      
      if let range = remaining.range(of: #"mul\((\d{1,3}),(\d{1,3})\)"#, options: .regularExpression),
         let match = try? NSRegularExpression(pattern: #"mul\((\d{1,3}),(\d{1,3})\)"#)
        .firstMatch(in: remaining, range: NSRange(location: 0, length: remaining.count)) {
        
        if let xRange = Range(match.range(at: 1), in: remaining),
           let yRange = Range(match.range(at: 2), in: remaining),
           let x = Int(remaining[xRange]),
           let y = Int(remaining[yRange]),
           (1...999).contains(x),
           (1...999).contains(y) {
          instructions.append(.multiply(Mul(x: x, y: y)))
        }
        position = data.index(position, offsetBy: range.upperBound.utf16Offset(in: remaining))
        continue
      }
      
      position = data.index(after: position)
    }
    
    return instructions
  }
  
  func part1() -> Int {
    return parseInstructions()
      .compactMap { instruction -> Int? in
        if case .multiply(let mul) = instruction {
          return mul.result
        }
        return nil
      }
      .reduce(0, +)
  }
  
  func part2() -> Int {
    let instructions = parseInstructions()
    var isEnabled = true
    var sum = 0
    
    for instruction in instructions {
      switch instruction {
      case .multiply(let mul):
        if isEnabled {
          sum += mul.result
        }
      case .enable:
        isEnabled = true
      case .disable:
        isEnabled = false
      }
    }
    
    return sum
  }
}
