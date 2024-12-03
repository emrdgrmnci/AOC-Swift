import Algorithms
import Parsing

// MARK: - Data Structures
struct Report {
    let levels: [Int]
    
    func isSafe(withDampener: Bool = false) -> Bool {
        guard levels.count >= 2 else { return false }
        
        // Check if sequence is naturally safe without dampener
        if isSequenceSafe(levels) {
            return true
        }
        
        // If dampener is enabled, try removing each level one at a time
        // to see if it makes the sequence safe
        if withDampener {
            for i in levels.indices {
                var modifiedLevels = levels
                modifiedLevels.remove(at: i)
                if isSequenceSafe(modifiedLevels) {
                    return true
                }
            }
        }
        
        return false
    }
    
    // Helper function to check if a sequence is naturally safe
    private func isSequenceSafe(_ sequence: [Int]) -> Bool {
        guard sequence.count >= 2 else { return false }
        
        // Determine if sequence should be increasing or decreasing
        let isDecreasing = sequence[0] > sequence[1]
        
        // Check each adjacent pair
        for (current, next) in zip(sequence, sequence.dropFirst()) {
            let difference = next - current
            
            // For decreasing sequences, difference should be negative
            // For increasing sequences, difference should be positive
            if isDecreasing {
                if difference >= 0 || abs(difference) > 3 {
                    return false
                }
            } else {
                if difference <= 0 || difference > 3 {
                    return false
                }
            }
        }
        
        return true
    }
}

// MARK: - Parsing
struct ReportParser: Parser {
    var body: some Parser<Substring, Report> {
        Many {
            Int.parser()
        } separator: {
            " "
        }
        .map(Report.init(levels:))
    }
}

struct ReportsParser: Parser {
    var body: some Parser<Substring, [Report]> {
        Many {
            ReportParser()
        } separator: {
            "\n"
        }
    }
}

// MARK: - Solution
struct Day02: AdventDay {
    var data: String
    
    func part1() -> Any {
        do {
            let reports = try ReportsParser().parse(data[...])
            return reports.filter { $0.isSafe() }.count
        } catch {
            print("Error parsing input: \(error)")
            return 0
        }
    }
    
    func part2() -> Any {
        do {
            let reports = try ReportsParser().parse(data[...])
            return reports.filter { $0.isSafe(withDampener: true) }.count
        } catch {
            print("Error parsing input: \(error)")
            return 0
        }
    }
}

// MARK: - Testing
let testInput = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""

let day = Day02(data: testInput)
