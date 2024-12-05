import Testing
import Foundation
import Parsing
@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day04Tests {
  // Smoke test data provided in the challenge question
  // The following test data also included in Day02.txt file and I have an helper to read from Bundle and test it
  var data: String = """
                  MMMSXXMASM
                  MSAMXMSMSA
                  AMXSXMAAMM
                  MSAMASMSMX
                  XMASAMXAMM
                  XXAMMXXAMA
                  SMSMSASXSS
                  SAXAMASAAA
                  MAMMMXMMMM
                  MXMXAXMASX
                  """
  
  @Test func testPart1() async throws {
    let challenge = Day04(data: data)
    #expect(String(describing: challenge.part1()) == "18")
  }
  
  @Test func testPart2() async throws {
    let challenge = Day04(data: data)
    #expect(String(describing: challenge.part2()) == "9")
  }
}

// Grid output:
/*
 let foo = [
 ["M", "M", "M", "S", "X", "X", "M", "A", "S", "M"],
 ["M", "S", "A", "M", "X", "M", "S", "M", "S", "A"],
 ["A", "M", "X", "S", "X", "M", "A", "A", "M", "M"],
 ["M", "S", "A", "M", "A", "S", "M", "S", "M", "X"],
 ["X", "M", "A", "S", "A", "M", "X", "A", "M", "M"],
 ["X", "X", "A", "M", "M", "X", "X", "A", "M", "A"],
 ["S", "M", "S", "M", "S", "A", "S", "X", "S", "S"],
 ["S", "A", "X", "A", "M", "A", "S", "A", "A", "A"],
 ["M", "A", "M", "M", "M", "X", "M", "M", "M", "M"],
 ["M", "X", "M", "X", "A", "X", "M", "A", "S", "X"]
 ]
 */
