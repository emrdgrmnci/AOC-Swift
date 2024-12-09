import Algorithms
import Foundation

struct Position: Hashable {
  let x: Int
  let y: Int
  
  func distance(to other: Position) -> Double {
    let dx = Double(other.x - x)
    let dy = Double(other.y - y)
    return sqrt(dx * dx + dy * dy)
  }
}

struct Antenna {
  let position: Position
  let frequency: Character
}

struct Day08: AdventDay {
  var data: String
  
  func parseInput() -> [Antenna] {
    var antennas: [Antenna] = []
    
    let lines = data.components(separatedBy: .newlines)
    
    for (y, line) in lines.enumerated() {
      for (x, char) in line.enumerated() {
        if char != "." {
          let position = Position(x: x, y: y)
          let antenna = Antenna(position: position, frequency: char)
          antennas.append(antenna)
        }
      }
    }
    
    return antennas
  }
  
  func groupAntennasByFrequency(
    _ antennas: [Antenna]
  ) -> [Character: [Position]] {
    var frequencyGroups: [Character: [Position]] = [:]
    
    for antenna in antennas {
      if frequencyGroups[antenna.frequency] == nil {
        frequencyGroups[antenna.frequency] = []
      }
      frequencyGroups[antenna.frequency]?.append(antenna.position)
    }
    return frequencyGroups.filter { $0.value.count >= 2 }
  }
  
  func findAntennaPairs(
    _ frequencyGroups: [Character: [Position]]
  ) -> [(Position, Position)] {
    var pairs: [(Position, Position)] = []
    
    for positions in frequencyGroups.values {
      for i in 0..<positions.count {
        for j in (i + 1)..<positions.count {
          pairs.append((positions[i], positions[j]))
        }
      }
    }
    
    return pairs
  }
  
  func findAntinodes(
    _ antennaPairs: [(Position, Position)],
    mapWidth: Int,
    mapHeight: Int
  ) -> Set<Position> {
    var antinodes: Set<Position> = []
    
    for pair in antennaPairs {
      let a1 = pair.0
      let a2 = pair.1
      
      let minX = max(0, min(a1.x, a2.x) - abs(a2.x - a1.x) * 2)
      let maxX = min(mapWidth - 1, max(a1.x, a2.x) + abs(a2.x - a1.x) * 2)
      let minY = max(0, min(a1.y, a2.y) - abs(a2.y - a1.y) * 2)
      let maxY = min(mapHeight - 1, max(a1.y, a2.y) + abs(a2.y - a1.y) * 2)
      
      for x in minX...maxX {
        for y in minY...maxY {
          let point = Position(x: x, y: y)
          let dist1 = point.distance(to: a1)
          let dist2 = point.distance(to: a2)
          
          let epsilon = 1e-10
          if abs(dist1 - 2 * dist2) < epsilon || abs(dist2 - 2 * dist1) < epsilon {
            let dx1 = Double(point.x - a1.x)
            let dy1 = Double(point.y - a1.y)
            let dx2 = Double(a2.x - a1.x)
            let dy2 = Double(a2.y - a1.y)
            let crossProduct = abs(dx1 * dy2 - dx2 * dy1)
            
            if crossProduct < epsilon {
              antinodes.insert(point)
            }
          }
        }
      }
    }
    
    return antinodes
  }
  
  /*
   The final answer would be the total count of unique antinode locations
   within the map boundaries.
   */
  func part1() -> Any {
    let antennas = parseInput()
    let lines = data.components(separatedBy: .newlines)
    let mapHeight = lines.count
    let mapWidth = lines.first?.count ?? 0
    
    let frequencyGroups = groupAntennasByFrequency(antennas)
    let antennaPairs = findAntennaPairs(frequencyGroups)
    let antinodes = findAntinodes(antennaPairs, mapWidth: mapWidth, mapHeight: mapHeight)
    
    return antinodes.count
  }
  
  func isCollinear(
    _ p1: Position,
    _ p2: Position,
    _ p3: Position
  ) -> Bool {
    let crossProduct = (p2.y - p1.y) * (p3.x - p2.x) -
    (p2.x - p1.x) * (p3.y - p2.y)
    return crossProduct == 0
  }
  
  func findPointsOnLine(
    _ p1: Position,
    _ p2: Position,
    mapWidth: Int,
    mapHeight: Int
  ) -> [Position] {
    var points: [Position] = []
    
    let dx = p2.x - p1.x
    let dy = p2.y - p1.y
    
    func gcd(_ a: Int, _ b: Int) -> Int {
      let absA = abs(a)
      let absB = abs(b)
      return absB == 0 ? absA : gcd(absB, absA % absB)
    }
    
    let divisor = gcd(dx, dy)
    let stepX = dx / (divisor == 0 ? 1 : divisor)
    let stepY = dy / (divisor == 0 ? 1 : divisor)
    
    var x = p1.x
    var y = p1.y
    
    while x >= 0 && x < mapWidth && y >= 0 && y < mapHeight {
      points.append(Position(x: x, y: y))
      x -= stepX
      y -= stepY
    }
    
    x = p1.x + stepX
    y = p1.y + stepY
    
    while x >= 0 && x < mapWidth && y >= 0 && y < mapHeight {
      points.append(Position(x: x, y: y))
      x += stepX
      y += stepY
    }
    
    return points
  }
  
  func findResonantAntinodes(
    _ antennaPairs: [(Position, Position)],
    mapWidth: Int,
    mapHeight: Int,
    antennaPositions: Set<Position>
  ) -> Set<Position> {
    var antinodes: Set<Position> = []
    antinodes = antinodes.union(antennaPositions)
    
    for pair in antennaPairs {
      let points = findPointsOnLine(
        pair.0,
        pair.1,
        mapWidth: mapWidth,
        mapHeight: mapHeight
      )
      antinodes.formUnion(points)
    }
    
    return antinodes
  }
  
  func part2() -> Any {
    let antennas = parseInput()
    let lines = data.components(separatedBy: .newlines)
    let mapHeight = lines.count
    let mapWidth = lines.first?.count ?? 0
    
    let frequencyGroups = groupAntennasByFrequency(antennas)
    let antennaPairs = findAntennaPairs(frequencyGroups)
    
    var validAntennaPositions = Set<Position>()
    for (_, positions) in frequencyGroups {
      if positions.count > 1 {
        positions.forEach { validAntennaPositions.insert($0) }
      }
    }
    
    let antinodes = findResonantAntinodes(
      antennaPairs,
      mapWidth: mapWidth,
      mapHeight: mapHeight,
      antennaPositions: validAntennaPositions
    )
    
    print("Map dimensions: \(mapWidth)x\(mapHeight)")
    print("Number of frequency groups:", frequencyGroups.count)
    print("Number of antenna pairs:", antennaPairs.count)
    print("Number of valid antenna positions:", validAntennaPositions.count)
    print("Sample of antinodes (first 5):")
    antinodes.prefix(5).forEach { print("(\($0.x), \($0.y))") }
    
    return antinodes.count
  }
}
