import Testing
import Foundation
@testable import AdventOfCode

struct Day16Tests {
  let data: String = """
                  #################
                  #...#...#...#..E#
                  #.#.#.#.#.#.#.#.#
                  #.#.#.#...#...#.#
                  #.#.#.#.###.#.#.#
                  #...#.#.#.....#.#
                  #.#.#.#.#.#####.#
                  #.#...#.#.#.....#
                  #.#.#####.#.###.#
                  #.#.#.......#...#
                  #.#.###.#####.###
                  #.#.#...#.....#.#
                  #.#.#.#####.###.#
                  #.#.#.........#.#
                  #.#.#.#########.#
                  #S#.............#
                  #################
                  """
  @MainActor @Test
  func testPart1() {
    let challenge = Day16(input: data)
    #expect(String(describing: challenge.part1()) == "11048")
  }
  
  @MainActor @Test
  func testPart2() {
    let challenge = Day16(input: data)
    #expect(String(describing: challenge.part2()) == "64")
  }
}
