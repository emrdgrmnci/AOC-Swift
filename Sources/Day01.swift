import Algorithms

struct Day01: AdventDay {
    var data: String
    
    var entities: ([Int], [Int]) {
        // Split by newlines and parse each line into two numbers
        let parts = data.split(separator: "\n").map {
            $0.split(separator: " ")
             .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        }
        
        // Filter out any invalid lines and safely extract left and right numbers
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
        // Placeholder for part 2
        return 0
    }
}
