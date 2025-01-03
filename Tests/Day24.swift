import Testing
@testable import AdventOfCode

@Suite("Day 24 Tests")
struct Day24Tests {
  @MainActor @Test("Day 24 Part 1 Solution")
  func testDay24_part1_solution() {
    let day = Day24(input: Day24.input)
    #expect(day.part1() == 51715173446832)
  }
  
  @MainActor @Test("Day 24 Part 2 Solution")
  func testDay24_part2_solution() {
    let day = Day24(input: Day24.input)
    #expect(day.part2() == "dpg,kmb,mmf,tvp,vdk,z10,z15,z25")
  }
}
