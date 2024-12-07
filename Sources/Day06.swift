import Algorithms
import Foundation

struct Day06: AdventDay {
  init(data: String) {
    self.map = data.split(separator: "\n").map { Array($0) }
  }
  
  let map: [[Character]]
  
  struct Position: Hashable {
    let x: Int
    let y: Int
    
    func next(_ direction: Direction) -> Position {
      Position(x: x + direction.dx, y: y + direction.dy)
    }
  }
  
  struct Direction {
    let dx: Int
    let dy: Int
    
    func turnRight() -> Direction {
      Direction(dx: -dy, dy: dx)
    }
  }
  
  func getStart() -> (pos: Position, dir: Direction)? {
    for y in map.indices {
      for x in map[y].indices {
        switch map[y][x] {
        case "^": return (Position(x: x, y: y), Direction(dx: 0, dy: -1))
        case ">": return (Position(x: x, y: y), Direction(dx: 1, dy: 0))
        case "v": return (Position(x: x, y: y), Direction(dx: 0, dy: 1))
        case "<": return (Position(x: x, y: y), Direction(dx: -1, dy: 0))
        default: continue
        }
      }
    }
    return nil
  }
  
  func isValid(_ pos: Position) -> Bool {
    pos.y >= 0 && pos.y < map.count && pos.x >= 0 && pos.x < map[0].count
  }
  
  func simulate() -> Set<Position> {
    guard let (start, startDir) = getStart() else { return [] }
    
    var visited = Set([start])
    var pos = start
    var dir = startDir
    
    while isValid(pos) {
      let next = pos.next(dir)
      if !isValid(next) || map[next.y][next.x] == "#" {
        dir = dir.turnRight()
      } else {
        pos = next
        visited.insert(pos)
      }
    }
    return visited
  }
  
  func part1() -> Any {
    simulate().count
  }
  
  func part2() -> Any {
    let visited = simulate()
    var result = 0
    
    guard let (start, _) = getStart() else { return 0 }
    
    for pos in visited where pos != start {
      var modMap = map
      modMap[pos.y][pos.x] = "#"
      
      let newDay = Day06(data: String(modMap.map { String($0) }.joined(separator: "\n")))
      if newDay.simulate().count < visited.count {
        result += 1
      }
    }
    return result
  }
}
