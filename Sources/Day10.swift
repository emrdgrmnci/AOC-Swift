import Algorithms
import Foundation

struct Day10: AdventDay {
  var data: String
  
  typealias Grid = [[Int]]
  
  struct Position: Hashable {
    let row: Int
    let col: Int
  }
  
  func parseInput() -> Grid {
    return data
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .components(separatedBy: .newlines)
      .map { line in
        line.map { Int(String($0))! }
      }
  }
  
  func dimensions(of grid: Grid) -> (rows: Int, cols: Int) {
    return (grid.count, grid[0].count)
  }
  
  func isValid(row: Int, col: Int, in grid: Grid) -> Bool {
    let (rows, cols) = dimensions(of: grid)
    return row >= 0 && row < rows && col >= 0 && col < cols
  }
  
  func getAdjacent(position: Position) -> [Position] {
    return [
      Position(row: position.row - 1, col: position.col), // up
      Position(row: position.row + 1, col: position.col), // down
      Position(row: position.row, col: position.col - 1), // left
      Position(row: position.row, col: position.col + 1)  // right
    ]
  }
  
  func findAllTrailHeadPositions(grid: Grid) -> [Position] {
    var trailHeads: [Position] = []
    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        if grid[row][col] == 0 {
          trailHeads.append(Position(row: row, col: col))
        }
      }
    }
    return trailHeads
  }
  
  func findValidHikingTrails(from trailHead: Position, in grid: Grid) -> Int {
    var visited = Set<Position>()
    var validEndpoints = Set<Position>()
    
    func dfs(at current: Position, expectedHeight: Int) {
      guard isValid(row: current.row, col: current.col, in: grid) else { return }
      guard grid[current.row][current.col] == expectedHeight else { return }
      guard !visited.contains(current) else { return }
      
      if expectedHeight == 9 {
        validEndpoints.insert(current)
        return
      }
      
      visited.insert(current)
      
      for next in getAdjacent(position: current) {
        dfs(at: next, expectedHeight: expectedHeight + 1)
      }
      
      visited.remove(current)
    }
    
    dfs(at: trailHead, expectedHeight: 0)
    
    return validEndpoints.count
  }
  
  func countDistinctHikingTrails(from trailHead: Position, in grid: Grid) -> Int {
    var visited = Set<Position>()
    var pathCount = 0
    
    func dfs(at current: Position, expectedHeight: Int) {
      guard isValid(row: current.row, col: current.col, in: grid) else { return }
      guard grid[current.row][current.col] == expectedHeight else { return }
      guard !visited.contains(current) else { return }
      
      if expectedHeight == 9 {
        pathCount += 1
        return
      }
      
      visited.insert(current)
      
      for next in getAdjacent(position: current) {
        dfs(at: next, expectedHeight: expectedHeight + 1)
      }
      
      visited.remove(current)
    }
    
    dfs(at: trailHead, expectedHeight: 0)
    return pathCount
  }
  
  func part1() -> Any {
    let grid = parseInput()
    let trailHeads = findAllTrailHeadPositions(grid: grid)
    
    let totalScore = trailHeads.map { trailHead in
      findValidHikingTrails(from: trailHead, in: grid)
    }.reduce(0, +)
    
    return totalScore
  }
  
  func part2() -> Any {
    let grid = parseInput()
    let trailHeads = findAllTrailHeadPositions(grid: grid)
    
    let totalRating = trailHeads.map { trailHead in
      countDistinctHikingTrails(from: trailHead, in: grid)
    }.reduce(0, +)
    
    return totalRating
  }
}
