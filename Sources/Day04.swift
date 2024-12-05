import Algorithms
import Foundation

struct Day04: AdventDay {
  var data: String
  
  func part1() -> Any {
    let grid = data.split(separator: "\n").map { Array($0) }
    var count = 0
    
    // Directions for the 8 different ways
    let directions = [(0,1), (1,0), (0,-1), (-1,0), (1,1), (-1,-1), (-1,1), (1,-1)]
    // right   down    left   up  down-right up-left up-right down-left
    
    // 1. Split input into grid
    // 2. For each position (i,j) in grid:
    //   - If grid[i][j] is 'X':
    //     - For each direction:
    //       - Check if "MAS" exists in that direction
    //       - If found, increment counter
    // 3. Return counter
    
    
    // Split input into grid
    /*
     grid[0] = ['X','X','M','A','S']
     grid[1] = ['M','A','X','X','X']
     grid[2] = ['A','X','X','M','X']
     grid[3] = ['S','X','X','X','M']
     grid[4] = ['X','M','A','S','X']
     */
    
    func isValidXMAS(x: Int, y: Int, dx: Int, dy: Int) -> Bool {
      let positions = [(x+dx, y+dy), (x+2*dx, y+2*dy), (x+3*dx, y+3*dy)]
      let expectedChars: [Character] = ["M", "A", "S"]
      
      return positions.enumerated().allSatisfy { index, pos in
        pos.0 >= 0 && pos.0 < grid.count &&
        pos.1 >= 0 && pos.1 < grid[0].count &&
        grid[pos.0][pos.1] == expectedChars[index]
      }
    }
    
    // For each position (i,j) in grid:
    // If the current cell is not 'X', skip
    // Check in all 8 directions
    // Check for the next 3 characters (M, A, S)
    
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == "X" {
          count += directions.filter { isValidXMAS(x: i, y: j, dx: $0.0, dy: $0.1) }.count
        }
      }
    }
    return count
  }
  
  /*
   M.S  (one MAS going down-right)
   .A.
   M.S  (another MAS going down-left)
   */
  func part2() -> Any {
    var counter = 0
    let grid = data.split(separator: "\n").map { Array($0) }
    
    for i in 0..<grid.count {
      for j in 0..<grid[i].count {
        // Start checking when we find an 'A' (the center of our X)
        if grid[i][j] == "A" {
          // Check all possible combinations of MAS and SAM
          // Up-left and up-right positions (for M/S)
          let upLeft = (i - 1, j - 1)
          let upRight = (i - 1, j + 1)
          // Down-left and down-right positions (for S/M)
          let downLeft = (i + 1, j - 1)
          let downRight = (i + 1, j + 1)
          
          // Bounds check
          if upLeft.0 >= 0 && upLeft.1 >= 0 &&
              upRight.0 >= 0 && upRight.1 < grid[0].count &&
              downLeft.0 < grid.count && downLeft.1 >= 0 &&
              downRight.0 < grid.count && downRight.1 < grid[0].count {
            
            // Check MAS-MAS pattern
            if (grid[upLeft.0][upLeft.1] == "M" && grid[downRight.0][downRight.1] == "S" &&
                grid[upRight.0][upRight.1] == "M" && grid[downLeft.0][downLeft.1] == "S") {
              counter += 1
            }
            // Check MAS-SAM pattern
            if (grid[upLeft.0][upLeft.1] == "M" && grid[downRight.0][downRight.1] == "S" &&
                grid[upRight.0][upRight.1] == "S" && grid[downLeft.0][downLeft.1] == "M") {
              counter += 1
            }
            // Check SAM-MAS pattern
            if (grid[upLeft.0][upLeft.1] == "S" && grid[downRight.0][downRight.1] == "M" &&
                grid[upRight.0][upRight.1] == "M" && grid[downLeft.0][downLeft.1] == "S") {
              counter += 1
            }
            // Check SAM-SAM pattern
            if (grid[upLeft.0][upLeft.1] == "S" && grid[downRight.0][downRight.1] == "M" &&
                grid[upRight.0][upRight.1] == "S" && grid[downLeft.0][downLeft.1] == "M") {
              counter += 1
            }
          }
        }
      }
    }
    return counter
  }
}

/*
 - I need to find all occurrences of "XMAS" in a grid of letters
 -The word can appear in multiple directions:
 
 - Horizontal (left to right and right to left)
 - Vertical (up to down and down to up)
 - Diagonal (in all 4 diagonal directions)
 
 (-1,0) Up
 ↑
 (0,-1) ← • → (0,1)
 ↓
 (1,0) Down
 
 Each tuple (x,y) represents how to move from the current position:
 
 First number (x): represents vertical movement
 
 -1 means move up one row
 0 means stay in same row
 1 means move down one row
 
 
 Second number (y): represents horizontal movement
 
 -1 means move left one column
 0 means stay in same column
 1 means move right one column
 
 Let's break down each direction:
 
 (0,1) Right: Stay in same row (0), move right one column (+1)
 (1,0) Down: Move down one row (+1), stay in same column (0)
 (0,-1) Left: Stay in same row (0), move left one column (-1)
 (-1,0) Up: Move up one row (-1), stay in same column (0)
 
 For diagonals, we combine movements:
 5. (1,1) Down-right: Move down (+1) and right (+1)
 6. (-1,-1) Up-left: Move up (-1) and left (-1)
 7. (-1,1) Up-right: Move up (-1) and right (+1)
 8. (1,-1) Down-left: Move down (+1) and left (-1)
 
 -Words can overlap each other
 ------------------------------
 ↑, ↓ (vertical)
 ←, → (horizontal)
 ↖, ↗ (diagonal up)
 ↙, ↘ (diagonal down)
 ------------------------------
 */
