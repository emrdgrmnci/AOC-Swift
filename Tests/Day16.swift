import Testing
import Foundation
@testable import AdventOfCode

struct Day16Tests {
  let data: String = """
                  Register A: 729
                  Register B: 0
                  Register C: 0
                  
                  Program: 0,1,5,4,3,0
                  """
  @MainActor @Test
  func testPart1() {
    let challenge = Day16(input: data)
    #expect(String(describing: challenge.part1()) == "11048")
  }
  
  @MainActor @Test
  func testPart2() {
    let challenge = Day16(input: data)
    #expect(String(describing: challenge.part2()) == "64")
  }
}
