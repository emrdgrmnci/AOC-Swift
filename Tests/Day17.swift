import Testing
import Testing
import Foundation
@testable import AdventOfCode

struct Day17Tests {
  let data: String = """
                    """
  @Test
  func testPart1() {
    let challenge = Day17(data: data)
    #expect(String(describing: challenge.part1()) == "12")
  }
  
  @Test
  func testPart2() {
    let challenge = Day17(data: data)
    #expect(String(describing: challenge.part2()) == "24")
  }
}
