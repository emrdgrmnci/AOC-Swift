struct Position: Hashable {
  let x: Int
  let y: Int
  
  func neighbors() -> [Position] {
    [
      Position(x: x, y: y - 1),
      Position(x: x + 1, y: y),
      Position(x: x, y: y + 1),
      Position(x: x - 1, y: y)
    ]
  }
}

// Simplified state that only tracks what we really need
struct State: Hashable {
  let position: Position
  let steps: Int
  let cheating: Bool
  let cheatStepsLeft: Int
}

class RaceTrack {
  let grid: [[Character]]
  let start: Position
  let end: Position
  private var bestPathLength: Int = Int.max
  private var cheats: [(start: Position, end: Position, saved: Int)] = []
  
  init(_ input: String) {
    let lines = input.split(separator: "\n").map(String.init)
    grid = lines.map { Array($0) }
    
    // Find start and end
    var s = Position(x: 0, y: 0)
    var e = Position(x: 0, y: 0)
    for y in 0..<grid.count {
      for x in 0..<grid[y].count {
        if grid[y][x] == "S" { s = Position(x: x, y: y) }
        if grid[y][x] == "E" { e = Position(x: x, y: y) }
      }
    }
    start = s
    end = e
  }
  
  private func isValid(_ pos: Position) -> Bool {
    pos.y >= 0 && pos.y < grid.count && pos.x >= 0 && pos.x < grid[0].count
  }
  
  private func isWall(_ pos: Position) -> Bool {
    grid[pos.y][pos.x] == "#"
  }
  
  // First find shortest normal path
  private func findNormalPath() {
    var queue: [(pos: Position, steps: Int)] = [(start, 0)]
    var visited = Set<Position>()
    var index = 0
    
    while index < queue.count {
      let current = queue[index]
      index += 1
      
      if current.pos == end {
        bestPathLength = min(bestPathLength, current.steps)
        continue
      }
      
      // Basic pruning - if we've taken more steps than best path, skip
      if current.steps >= bestPathLength {
        continue
      }
      
      if visited.contains(current.pos) {
        continue
      }
      visited.insert(current.pos)
      
      for next in current.pos.neighbors() {
        if !isValid(next) || isWall(next) || visited.contains(next) {
          continue
        }
        queue.append((next, current.steps + 1))
      }
    }
  }
  
  // Then find all possible cheats
  private func findCheats() {
    // We'll search from each valid position
    for y in 0..<grid.count {
      for x in 0..<grid[0].count {
        let pos = Position(x: x, y: y)
        if isWall(pos) { continue }
        
        var queue: [(state: State, cheatStart: Position?)] = [
          (State(position: pos, steps: 0, cheating: false, cheatStepsLeft: 2), nil)
        ]
        var visited = Set<State>()
        var index = 0
        
        while index < queue.count {
          let current = queue[index]
          index += 1
          
          let state = current.state
          
          // Basic pruning
          if state.steps > bestPathLength {
            continue
          }
          
          if visited.contains(state) {
            continue
          }
          visited.insert(state)
          
          for next in state.position.neighbors() {
            if !isValid(next) { continue }
            
            let isWallTile = isWall(next)
            
            // Normal movement
            if !state.cheating && !isWallTile {
              queue.append((
                State(
                  position: next,
                  steps: state.steps + 1,
                  cheating: false,
                  cheatStepsLeft: 2
                ),
                current.cheatStart
              ))
              
              // Start cheating
              queue.append((
                State(
                  position: next,
                  steps: state.steps + 1,
                  cheating: true,
                  cheatStepsLeft: 2
                ),
                state.position
              ))
            }
            // Continue cheating
            else if state.cheating && state.cheatStepsLeft > 0 {
              // If this is our last cheat step, we must land on a valid tile
              if state.cheatStepsLeft == 1 && !isWallTile {
                if let cheatStart = current.cheatStart {
                  // Calculate time saved
                  let normalPath = bestPathLength
                  let cheatPath = state.steps + 1
                  let saved = normalPath - cheatPath
                  if saved > 0 {
                    cheats.append((cheatStart, next, saved))
                  }
                }
              } else if state.cheatStepsLeft > 1 {
                queue.append((
                  State(
                    position: next,
                    steps: state.steps + 1,
                    cheating: true,
                    cheatStepsLeft: state.cheatStepsLeft - 1
                  ),
                  current.cheatStart
                ))
              }
            }
          }
        }
      }
    }
  }
  
  func solve() -> Int {
    // First find the best normal path
    findNormalPath()
    print("Best normal path length:", bestPathLength)
    
    // Then find all possible cheats
    findCheats()
    
    // Count cheats that save >= 100 steps
    return cheats.filter { $0.saved >= 100 }.count
  }
}

struct Day20: AdventDay {
  var data: String
  
  func part1() -> Any {
    let track = RaceTrack(data)
    return track.solve()
  }
  
  func part2() -> Any {
    return 0 // Part 2 not implemented
  }
}
