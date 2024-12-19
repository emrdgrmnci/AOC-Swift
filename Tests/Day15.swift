import Testing
import Foundation
@testable import AdventOfCode

struct Day15Tests {
  let data: String = """
                   p=0,4 v=3,-3
                   p=6,3 v=-1,-3
                   p=10,3 v=-1,2
                   p=2,0 v=2,-1
                   p=0,0 v=1,3
                   p=3,0 v=-2,-2
                   p=7,6 v=-1,-3
                   p=3,0 v=-1,-2
                   p=9,3 v=2,3
                   p=7,3 v=-1,2
                   p=2,4 v=2,-3
                   p=9,5 v=-3,-3
                  """
  @Test
  func testPart1() {
    let challenge = Day15(data: data)
    #expect(String(describing: challenge.part1()) == "12")
  }
  
  @Test
  func testPart2() {
    let challenge = Day15(data: data)
    #expect(String(describing: challenge.part2()) == "24")
  }
}
