import Testing
import Foundation
@testable import AdventOfCode

struct Day12Tests {
  let data: String = """
                      RRRRIICCFF
                      RRRRIICCCF
                      VVRRRCCFFF
                      VVRCCCJFFF
                      VVVVCJJCFE
                      VVIVCCJJEE
                      VVIIICJJEE
                      MIIIIIJJEE
                      MIIISIJEEE
                      MMMISSJEEE
                      """
  @Test
  func testPart1() {
    let challenge = Day12(data: data)
    #expect(String(describing: challenge.part1()) == "1930")
  }
  
  @Test
  func testPart2() {
    let challenge = Day12(data: data)
    #expect(String(describing: challenge.part2()) == "1206")
  }
}
