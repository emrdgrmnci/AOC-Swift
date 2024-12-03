import Testing
import Foundation
import Parsing
@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day03Tests {
  // Smoke test data provided in the challenge question
  // The following test data also included in Day02.txt file and I have an helper to read from Bundle and test it
  
  @Test func testPart1() async throws {
    let challenge = Day03(data: "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")
    #expect(String(describing: challenge.part1()) == "161")
  }
  
  @Test func testPart2() async throws {
    let input =
    """
xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
"""
    let challenge = Day03(data: input)
    #expect(String(describing: challenge.part2()) == "40")
  }
}
