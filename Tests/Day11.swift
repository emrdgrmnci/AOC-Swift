import Testing
import Foundation
@testable import AdventOfCode

struct Day11Tests {
  let data: String = """
                      125 17
                      """
  @Test
  func testPart1() {
    let challenge = Day11(data: data)
    #expect(String(describing: challenge.part1()) == "55312")
  }
  
  @Test
  func testPart2() {
    let challenge = Day11(data: data)
    #expect(String(describing: challenge.part2()) == "65601038650482")
  }
}
