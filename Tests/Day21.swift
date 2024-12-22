import Testing
import Foundation
@testable import AdventOfCode

@Suite("Day 21 Tests")
struct Day21Tests {
  @MainActor @Test("Day 21 Part 1")
  func testDay21_part1() {
    let day = Day21(input: testInput)
    #expect(day.part1() == 44)
  }
  
  @MainActor @Test("Day 21 Part 1 Solution")
  func testDay21_part1_solution() {
    let day = Day21(input: Day21.input)
    #expect(day.part1() == 1327)
  }
  
  @MainActor @Test("Day 21 Part 2")
  func testDay21_part2() {
    let day = Day21(input: testInput)
    #expect(day.part2() == 285)
  }
  
  @MainActor @Test("Day 21 Part 2 Solution")
  func testDay21_part2_solution() {
    let day = Day21(input: Day21.input)
    #expect(day.part2() == 985737)
  }
}
