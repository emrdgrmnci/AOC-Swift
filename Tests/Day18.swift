import Testing
import Testing
import Foundation
@testable import AdventOfCode

struct Day18Tests {
  let data: String = """
                    """
  @Test
  func testPart1() {
    let challenge = Day18(data: data)
    #expect(String(describing: challenge.part1()) == "12")
  }
  
  @Test
  func testPart2() {
    let challenge = Day18(data: data)
    #expect(String(describing: challenge.part2()) == "24")
  }
}
