import Foundation

fileprivate struct Point: Hashable, Comparable {
  let x: Int
  let y: Int
  
  static func < (lhs: Point, rhs: Point) -> Bool {
    if lhs.y != rhs.y {
      return lhs.y < rhs.y
    }
    return lhs.x < rhs.x
  }
  
  // Get all corners of a cell
  var corners: [Point] {
    [
      self,                            // top-left
      Point(x: x + 1, y: y),          // top-right
      Point(x: x, y: y + 1),          // bottom-left
      Point(x: x + 1, y: y + 1)       // bottom-right
    ]
  }
  
  func isNeighbor(of other: Point) -> Bool {
    let dx = abs(x - other.x)
    let dy = abs(y - other.y)
    return (dx == 1 && dy == 0) || (dx == 0 && dy == 1)
  }
}

struct Region {
  fileprivate var points: Set<Point>
  let plantType: Character
  
  var area: Int {
    points.count
  }
  
  var perimeter: Int {
    var perimeterCount = 0
    for point in points {
      let neighbors = [
        Point(x: point.x + 1, y: point.y),
        Point(x: point.x - 1, y: point.y),
        Point(x: point.x, y: point.y + 1),
        Point(x: point.x, y: point.y - 1)
      ]
      
      for neighbor in neighbors {
        if !points.contains(neighbor) {
          perimeterCount += 1
        }
      }
    }
    return perimeterCount
  }
  
  var sides: Int {
    // Get all corners from all cells in the region
    let allCorners = points.flatMap { $0.corners }
    
    // Count occurrences of each corner
    var cornerCounts: [Point: Int] = [:]
    allCorners.forEach { corner in
      cornerCounts[corner, default: 0] += 1
    }
    
    // Count unique corners (corners that appear an odd number of times)
    let uniqueCorners = cornerCounts.filter { !$0.value.isMultiple(of: 2) }.count
    
    // Count touching corners (corners that appear exactly twice)
    let touchingCorners = cornerCounts.filter { $0.value == 2 }.count { corner, _ in
      // Get the cells that share this corner
      let adjacentCells = corner.corners.map { Point(x: $0.x - 1, y: $0.y - 1) }
        .filter(points.contains)
      
      // If we found exactly 2 cells
      guard adjacentCells.count == 2 else { return false }
      
      // Check if they're touching diagonally (not sharing an edge)
      return !adjacentCells[0].isNeighbor(of: adjacentCells[1])
    }
    
    // Total number of sides is unique corners plus twice the touching corners
    return uniqueCorners + touchingCorners * 2
  }
  
  var pricePartOne: Int {
    area * perimeter
  }
  
  var pricePartTwo: Int {
    area * sides
  }
}

struct Garden {
  let grid: [[Character]]
  var regions: [Region] = []
  
  init(input: String) {
    grid = input.split(separator: "\n").map { Array(String($0)) }
    findRegions()
  }
  
  mutating func findRegions() {
    var visited = Set<Point>()
    
    for y in 0..<grid.count {
      for x in 0..<grid[y].count {
        let point = Point(x: x, y: y)
        if !visited.contains(point) {
          var region = Region(points: [], plantType: grid[y][x])
          exploreRegion(from: point, region: &region, visited: &visited)
          if !region.points.isEmpty {
            regions.append(region)
          }
        }
      }
    }
  }
  
  fileprivate func exploreRegion(from point: Point, region: inout Region, visited: inout Set<Point>) {
    guard point.y >= 0 && point.y < grid.count &&
            point.x >= 0 && point.x < grid[point.y].count &&
            !visited.contains(point) &&
            grid[point.y][point.x] == region.plantType else {
      return
    }
    
    region.points.insert(point)
    visited.insert(point)
    
    exploreRegion(from: Point(x: point.x + 1, y: point.y), region: &region, visited: &visited)
    exploreRegion(from: Point(x: point.x - 1, y: point.y), region: &region, visited: &visited)
    exploreRegion(from: Point(x: point.x, y: point.y + 1), region: &region, visited: &visited)
    exploreRegion(from: Point(x: point.x, y: point.y - 1), region: &region, visited: &visited)
  }
  
  var totalPricePartOne: Int {
    regions.reduce(0) { $0 + $1.pricePartOne }
  }
  
  var totalPricePartTwo: Int {
    regions.reduce(0) { $0 + $1.pricePartTwo }
  }
}

struct Day12: AdventDay {
  var data: String
  
  func part1() -> Any {
    let garden = Garden(input: data)
    return garden.totalPricePartOne
  }
  
  func part2() -> Any {
    let garden = Garden(input: data)
    return garden.totalPricePartTwo
  }
}
