import Testing
import Foundation
import Parsing
@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day10Tests {
  // Smoke test data provided in the challenge question
  // The following test data also included in Day02.txt file and I have an helper to read from Bundle and test it
  var data: String = """
                      89010123
                      78121874
                      87430965
                      96549874
                      45678903
                      32019012
                      01329801
                      10456732                      
                      """
  
  @Test
  func testPart1() {
    let challenge = Day10(data: data)
    #expect(String(describing: challenge.part1()) == "36")
  }
  
  @Test
  func testPart2() {
    let challenge = Day10(data: data)
    #expect(String(describing: challenge.part2()) == "81")
  }
}

