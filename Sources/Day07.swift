import Algorithms
import Foundation

struct Day07: AdventDay {
  var data: String
  
  func part1() -> Any {
    return solve(includeConcatenation: false)
  }
  
  func part2() -> Any {
    return solve(includeConcatenation: true)
  }
  
  private func solve(includeConcatenation: Bool) -> Int {
    let equations = parseInput(data)
    var total = 0
    
    for equation in equations {
      let (target, numbers) = equation
      if canFormTarget(target, with: numbers, includeConcatenation: includeConcatenation) {
        total += target
      }
    }
    
    return total
  }
  
  private func parseInput(_ input: String) -> [(Int, [Int])] {
    let lines = input.split(separator: "\n")
    var equations = [(Int, [Int])]()
    
    for line in lines {
      let parts = line.split(separator: ":")
      guard parts.count == 2,
            let target = Int(parts[0].trimmingCharacters(in: .whitespaces)),
            let numbers = parts[1].split(separator: " ").compactMap({ Int($0) }) as [Int]? else {
        continue
      }
      equations.append((target, numbers))
    }
    
    return equations
  }
  
  private func canFormTarget(_ target: Int, with numbers: [Int], includeConcatenation: Bool) -> Bool {
    return dfs(numbers, target, 0, includeConcatenation)
  }
  
  private func dfs(_ numbers: [Int], _ target: Int, _ currentValue: Int, _ includeConcatenation: Bool) -> Bool {
    if numbers.isEmpty {
      return currentValue == target
    }
    
    let next = numbers[0]
    let remaining = Array(numbers.dropFirst())
    
    if dfs(remaining, target, currentValue + next, includeConcatenation) {
      return true
    }
    
    if dfs(remaining, target, currentValue * next, includeConcatenation) {
      return true
    }
    
    if includeConcatenation {
      let concatenatedValue = Int("\(currentValue)\(next)") ?? Int.max
      if dfs(remaining, target, concatenatedValue, includeConcatenation) {
        return true
      }
    }
    
    return false
  }
}
