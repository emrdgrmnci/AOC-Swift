import XCTest
import Foundation
@testable import AdventOfCode

class Day11Tests: XCTestCase {
    let data: String = """
                      0 5601550 3914 852 50706 68 6 645371
                      """
    
    func testPart1() {
        let challenge = Day11(data: data)
        XCTAssertEqual(String(describing: challenge.part1()), "189092")
    }
    
    func testPart2() {
        let challenge = Day11(data: data)
        XCTAssertEqual(String(describing: challenge.part2()), "224869647102559")
    }
}
