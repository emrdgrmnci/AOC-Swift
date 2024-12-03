import Testing
import Foundation
@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day02Tests {
  // Smoke test data provided in the challenge question
  // The following test data also included in Day02.txt file and I have an helper to read from Bundle and test it
  func loadTestData() throws -> String {
    // For testing with embedded data
    let embeddedData = """
          7 6 4 2 1
          1 2 7 8 9
          9 7 6 2 1
          1 3 2 4 5
          8 6 4 4 1
          1 3 6 7 9
          """
    return embeddedData
  }
  
  @Test
  func testPart1() async throws {
    let testData = try loadTestData()
    let challenge = Day02(data: testData)
    #expect(String(describing: challenge.part1()) == "2")
  }
  
  @Test
  func testPart2() async throws {
    let testData = try loadTestData()
    let challenge = Day02(data: testData)
    #expect(String(describing: challenge.part2()) == "4")
  }
}
