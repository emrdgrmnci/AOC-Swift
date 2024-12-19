struct Day19: AdventDay {
  var data: String
  
  // Memoization helper class
  final class Memoized<In: Hashable, Out> {
    private var _compute: (In, Memoized) -> Out
    
    init(_ compute: @escaping (In, Memoized) -> Out) {
      _compute = { _, _ in fatalError() }
      unowned let me = self
      var cache: [In: Out] = [:]
      _compute = { (input, recurse) in
        if let answer = cache[input] {
          return answer
        }
        let answer = compute(input, me)
        cache[input] = answer
        return answer
      }
    }
    
    func callAsFunction(_ input: In) -> Out {
      _compute(input, self)
    }
  }
  
  func part1() -> Any {
    let chunks = data.split(separator: "\n\n")
    let towels = chunks[0].split(separator: ", ")
    let designs = chunks[1].split(separator: "\n")
    
    let canMake = Memoized<Substring, Bool> { design, recurse in
      if design.isEmpty { return true }
      for towel in towels where design.hasPrefix(towel) {
        if recurse(design.dropFirst(towel.count)) {
          return true
        }
      }
      return false
    }
    
    return designs.filter { canMake($0) }.count
  }
  
  func part2() -> Any {
    let chunks = data.split(separator: "\n\n")
    let towels = chunks[0].split(separator: ", ")
    let designs = chunks[1].split(separator: "\n")
    
    let waysToMake = Memoized<Substring, Int> { design, recurse in
      if design.isEmpty { return 1 }
      var count = 0
      for towel in towels where design.hasPrefix(towel) {
        count += recurse(design.dropFirst(towel.count))
      }
      return count
    }
    
    return designs.map { waysToMake($0) }.reduce(0, +)
  }
}
