import Algorithms
import Parsing

// MARK: - Solution
struct Day03: AdventDay {
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
