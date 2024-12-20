import Testing
import Testing
import Foundation
@testable import AdventOfCode

struct Day17Tests {
  let inputData1: String = """
                    Register A: 729
                    Register B: 0
                    Register C: 0
                    
                    Program: 0,1,5,4,3,0
                    """
  
  let inputData2: String = """
                  Register A: 2024
                  Register B: 0
                  Register C: 0

                  Program: 0,3,5,4,3,0
                """
  
  @MainActor @Test
  func testPart1() {
    let challenge = Day17(input: inputData1)
    #expect(String(describing: challenge.part1()) == "4,6,3,5,6,3,5,2,1,0")
  }
  
  @MainActor @Test
  func testPart2() {
    let challenge = Day17(input: inputData2)
    #expect(String(describing: challenge.part2()) == "117440")
  }
}
