import Testing
import Testing
import Foundation
@testable import AdventOfCode

struct Day19Tests {
  let data: String = """
    r, wr, b, g, bwu, rb, gb, br
    
    brwrr
    bggr
    gbbr
    rrbgbr
    ubwu
    bwurrg
    brgr
    bbrgwb    
    """
  
  @Test
  func testPart1() {
    let challenge = Day19(data: data)
    #expect(String(describing: challenge.part1()) == "6")
  }
  
  @Test
  func testPart2() {
    let challenge = Day19(data: data)
    #expect(String(describing: challenge.part2()) == "16")
  }
}
