import Testing
import Foundation
import Parsing
@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day09Tests {
  // Smoke test data provided in the challenge question
  // The following test data also included in Day02.txt file and I have an helper to read from Bundle and test it
  var data: String = """
                      2333133121414131402
                      """
  
  @Test
  func testPart1() {
    let challenge = Day09(data: data)
    #expect(String(describing: challenge.part1()) == "1928")
  }
  
  @Test
  func testPart2() {
    let challenge = Day09(data: data)
    #expect(String(describing: challenge.part2()) == "2858")
  }
}