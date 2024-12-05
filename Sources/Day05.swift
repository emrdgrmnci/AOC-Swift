import Algorithms
import Foundation

struct Day05: AdventDay {
    var data: String
    
    private func parseRules(_ input: String) -> [(Int, Int)] {
        return input.components(separatedBy: .newlines)
            .compactMap { line -> (Int, Int)? in
                let parts = line.split(separator: "|")
                guard parts.count == 2,
                      let first = Int(parts[0]),
                      let second = Int(parts[1]) else { return nil }
                return (first, second)
            }
    }
    
    private func parseOrders(_ input: String) -> [[Int]] {
        return input.components(separatedBy: .newlines)
            .map { line in
                line.split(separator: ",")
                    .compactMap { Int(String($0)) }
            }
            .filter { !$0.isEmpty }
    }
    
    private func isValidOrder(_ order: [Int], rules: [(Int, Int)]) -> Bool {
        var ruleDict: [Int: Set<Int>] = [:]
        for (before, after) in rules {
            ruleDict[before, default: []].insert(after)
        }
        
        for i in 0..<order.count {
            for j in (i + 1)..<order.count {
                let first = order[i]
                let second = order[j]
                
                if let dependencies = ruleDict[second], dependencies.contains(first) {
                    return false
                }
            }
        }
        return true
    }
    
    private func reorderSequence(_ sequence: [Int], rules: [(Int, Int)]) -> [Int] {
        var graph: [Int: Set<Int>] = [:]
        var inDegree: [Int: Int] = [:]
        
        for num in sequence {
            graph[num] = []
            inDegree[num] = 0
        }
        
        for (before, after) in rules {
            if graph[before] != nil && graph[after] != nil {
                graph[before]?.insert(after)
                inDegree[after, default: 0] += 1
            }
        }
        
        var result: [Int] = []
        var queue = sequence.filter { inDegree[$0] == 0 }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node)
            
            if let neighbors = graph[node] {
                for neighbor in neighbors {
                    inDegree[neighbor] = (inDegree[neighbor] ?? 0) - 1
                    if inDegree[neighbor] == 0 {
                        queue.append(neighbor)
                    }
                }
            }
        }
        
        return result
    }
    
    func part1() -> Any {
        let components = data.components(separatedBy: "\n\n")
        guard components.count >= 2 else { return 0 }
        
        let rules = parseRules(components[0])
        let orders = parseOrders(components[1])
        
        let validOrders = orders.filter { isValidOrder($0, rules: rules) }
        return validOrders.count
    }
    
    func part2() -> Any {
        let components = data.components(separatedBy: "\n\n")
        guard components.count >= 2 else { return 0 }
        
        let rules = parseRules(components[0])
        let orders = parseOrders(components[1])
        
        let incorrectOrders = orders.filter { !isValidOrder($0, rules: rules) }
        
        let middleElements = incorrectOrders.map { sequence -> Int in
            let reordered = reorderSequence(sequence, rules: rules)
            let middleIndex = reordered.count / 2
            return reordered[middleIndex]
        }
        
        return middleElements.reduce(0, +)
    }
}
