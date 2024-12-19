struct Position: Hashable {
  let x: Int
  let y: Int
}

enum Direction: CaseIterable {
  case north
  case east
  case south
  case west
  
  var movement: (dx: Int, dy: Int) {
    switch self {
    case .north: return (0, -1)
    case .east:  return (1, 0)
    case .south: return (0, 1)
    case .west:  return (-1, 0)
    }
  }
  
  func rotateClockwise() -> Direction {
    switch self {
    case .north: return .east
    case .east: return .south
    case .south: return .west
    case .west: return .north
    }
  }
  
  func rotateCounterclockwise() -> Direction {
    switch self {
    case .north: return .west
    case .east: return .north
    case .south: return .east
    case .west: return .south
    }
  }
}

struct State: Hashable {
  let position: Position
  let direction: Direction
  let score: Int
}

struct Day16: AdventDay {
  var data: String
  
  typealias Grid = [[Character]]
  
  func parseGrid() -> Grid {
    return data.split(separator: "\n").map { Array($0) }
  }
  
  func dimensions(of grid: Grid) -> (rows: Int, cols: Int) {
    return (grid.count, grid[0].count)
  }
  
  func isValid(row: Int, col: Int, in grid: Grid) -> Bool {
    let (rows, cols) = dimensions(of: grid)
    return row >= 0 && row < rows && col >= 0 && col < cols
  }
  
  func findStart(_ grid: Grid) -> Position? {
    for (y, row) in grid.enumerated() {
      for (x, char) in row.enumerated() {
        if char == "S" {
          return Position(x: x, y: y)
        }
      }
    }
    return nil
  }
  
  func findEnd(_ grid: Grid) -> Position? {
    for (y, row) in grid.enumerated() {
      for (x, char) in row.enumerated() {
        if char == "E" {
          return Position(x: x, y: y)
        }
      }
    }
    return nil
  }
  
  func getNextMoves(from state: State, in grid: Grid) -> [State] {
    var moves: [State] = []
    
    let (dx, dy) = state.direction.movement
    let newX = state.position.x + dx
    let newY = state.position.y + dy
    
    if isValid(row: newY, col: newX, in: grid) && grid[newY][newX] != "#" {
      moves.append(
        State(
          position: Position(x: newX, y: newY),
          direction: state.direction,
          score: state.score + 1
        )
      )
    }
    
    let clockwise = State(
      position: state.position,
      direction: state.direction.rotateClockwise(),
      score: state.score + 1000
    )
    
    let counterClockwise = State(
      position: state.position,
      direction: state.direction.rotateCounterclockwise(),
      score: state.score + 1000
    )
    
    moves.append(clockwise)
    moves.append(counterClockwise)
    
    return moves
  }
  
  func part1() -> Any {
    let grid = parseGrid()
    guard let start = findStart(grid),
          let end = findEnd(grid) else {
      return 0
    }
    
    // Create initial state (starting east as per requirements)
    let initialState = State(position: start, direction: .east, score: 0)
    
    // Priority queue to store states to explore
    var queue: [(State, Int)] = [(initialState, 0)]
    // Keep track of visited states
    var visited: Set<State> = []
    
    while !queue.isEmpty {
      // Sort by score and get the state with lowest score
      queue.sort { $0.1 > $1.1 }
      let (currentState, _) = queue.removeLast()
      
      // If we reached the end, return the score
      if currentState.position.x == end.x && currentState.position.y == end.y {
        return currentState.score
      }
      
      // Skip if we've visited this state
      if visited.contains(currentState) {
        continue
      }
      visited.insert(currentState)
      
      // Get next possible moves
      let nextMoves = getNextMoves(from: currentState, in: grid)
      for move in nextMoves {
        if !visited.contains(move) {
          queue.append((move, move.score))
        }
      }
    }
    
    return 0
  }
  
  func part2() -> Any {
    
    return 0
  }
}
