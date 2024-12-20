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

struct Day14: AdventDay {
  var data: String
  
  private struct Robot {
    let pos: Point
    let vel: Point
  }
  
  private struct RobotState {
    let n: Int
    let robots: [Robot]
  }
  
  func part1() -> Any {
    let robots = parseRobots(from: data)
    let dimensions = if robots.count > 20 {
      Point(x: 101, y: 103)
    } else {
      Point(x: 11, y: 7)
    }
    let finalState = simulate(initial: RobotState(n: 0, robots: robots), mapSize: dimensions, forSeconds: 100)
    return calculateSafetyFactor(robots: finalState.robots, mapSize: dimensions)
  }
  
  func part2() -> Any {
    let robots = parseRobots(from: data)
    let dimensions = if robots.count > 20 {
      Point(x: 101, y: 103)
    } else {
      Point(x: 11, y: 7)
    }
    
    var minDistance = Int.max
    var minSec = 0
    let mid = Point(x: dimensions.x / 2, y: dimensions.y / 2)
    
    for sec in 1...(dimensions.x * dimensions.y) {
      let currentRobots = robots.map { simulate(robot: $0, mapSize: dimensions, steps: sec) }
      let distance = currentRobots.map { abs($0.pos.x - mid.x) + abs($0.pos.y - mid.y) }.reduce(0, +)
      if distance < minDistance {
        minDistance = distance
        minSec = sec
      }
    }
    
    return minSec
  }
  
  private func parseRobots(from input: String) -> [Robot] {
    let lines = input.split { $0.isNewline }
    var robots: [Robot] = []
    
    for line in lines {
      guard let robot = parseRobot(line: line) else {
        continue
      }
      robots.append(robot)
    }
    
    return robots
  }
  
  private func parseRobot(line: String.SubSequence) -> Robot? {
    let parts = line.split(separator: " ")
    guard parts.count == 2 else { return nil }
    
    let posStr = parts[0].dropFirst(2)
    let posCoords = posStr.split(separator: ",")
    guard posCoords.count == 2,
          let posX = Int(posCoords[0]),
          let posY = Int(posCoords[1]) else {
      return nil
    }
    
    let velStr = parts[1].dropFirst(2)
    let velCoords = velStr.split(separator: ",")
    guard velCoords.count == 2,
          let velX = Int(velCoords[0]),
          let velY = Int(velCoords[1]) else {
      return nil
    }
    
    return Robot(
      pos: Point(x: posX, y: posY),
      vel: Point(x: velX, y: velY)
    )
  }
  
  private func parsePoint(from arr: ArraySlice<Character>) -> Point? {
    guard let comma = arr.firstIndex(where: { $0 == "," }) else {
      return nil
    }
    guard let x = Int(String(arr[arr.startIndex..<comma])) else {
      return nil
    }
    guard let y = Int(String(arr[comma+1..<arr.endIndex])) else {
      return nil
    }
    return Point(x: x, y: y)
  }
  
  private func simulate(initial state: RobotState, mapSize: Point, forSeconds n: Int) -> RobotState {
    var simulatedRobots = state.robots
    
    for _ in 0..<n {
      for i in 0..<simulatedRobots.count {
        simulatedRobots[i] = simulate(robot: simulatedRobots[i], mapSize: mapSize)
      }
    }
    
    return RobotState(n: state.n + n, robots: simulatedRobots)
  }
  
  private func simulate(robot: Robot, mapSize: Point, steps: Int = 1) -> Robot {
    var currentRobot = robot
    for _ in 0..<steps {
      let nextPos = currentRobot.pos + currentRobot.vel
      var x = nextPos.x
      var y = nextPos.y
      
      if y < 0 {
        y += mapSize.y
      } else if y >= mapSize.y {
        y -= mapSize.y
      }
      if x < 0 {
        x += mapSize.x
      } else if x >= mapSize.x {
        x -= mapSize.x
      }
      
      currentRobot = Robot(pos: Point(x: x, y: y), vel: currentRobot.vel)
    }
    return currentRobot
  }
  
  private func calculateSafetyFactor(robots: [Robot], mapSize: Point) -> Int {
    let hw = mapSize.x / 2
    let hh = mapSize.y / 2
    // A|B
    // -+-
    // C|D
    var a = 0
    var b = 0
    var c = 0
    var d = 0
    
    for robot in robots {
      if robot.pos.x < hw && robot.pos.y < hh {
        a += 1
      } else if robot.pos.x > hw && robot.pos.y < hh {
        b += 1
      } else if robot.pos.x < hw && robot.pos.y > hh {
        c += 1
      } else if robot.pos.x > hw && robot.pos.y > hh {
        d += 1
      }
    }
    
    return a * b * c * d
  }
}

extension Point {
  static func + (lhs: Point, rhs: Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }
}
