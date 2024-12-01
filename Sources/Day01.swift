import Algorithms

struct Day01: AdventDay {
    var data: String
    
    var entities: ([Int], [Int]) {
        let parts = data.split(separator: "\n").map {
            $0.split(separator: " ")
             .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        }
        
        let validParts = parts.filter { $0.count == 2 }
        let leftList = validParts.map { $0[0] }
        let rightList = validParts.map { $0[1] }
        
        return (leftList, rightList)
    }
    
    func part1() -> Any {
        let (leftList, rightList) = entities
        
        // Sort both lists
        let sortedLeft = leftList.sorted()
        let sortedRight = rightList.sorted()
        
        // Calculate sum of absolute differences between paired numbers
        return zip(sortedLeft, sortedRight)
            .reduce(0) { sum, pair in
                sum + abs(pair.0 - pair.1)
            }
    }
    
    func part2() -> Any {
        let (leftList, rightList) = entities
        
        // Create a frequency dictionary for the right list
        var rightFrequency: [Int: Int] = [:]
        for num in rightList {
            rightFrequency[num, default: 0] += 1
        }
        
        // Calculate similarity score
        let similarityScore = leftList.reduce(0) { score, leftNum in
            // For each number in left list, multiply it by its frequency in right list
            score + (leftNum * (rightFrequency[leftNum] ?? 0))
        }
        
        return similarityScore
    }
}
