import Testing
import Testing
import Foundation
@testable import AdventOfCode

struct Day17Tests {
  let data: String = """
                    Register A: 21539243
                    Register B: 0
                    Register C: 0
                    
                    Program: 6,7,5,2,1,3,5,1,7
                    """
  @Test
  func testPart1() {
    let challenge = Day17(data: data)
    #expect(String(describing: challenge.part1()) == "0")
  }
  
  @Test
  func testPart2() {
    let challenge = Day17(data: data)
    #expect(String(describing: challenge.part2()) == "0")
  }
}
