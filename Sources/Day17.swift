import Foundation

class Computer {
  private var regA: Int
  private var regB: Int
  private var regC: Int
  private var ip: Int  // instruction pointer
  private var program: [Int]
  private var output: [Int]
  
  init(program: [Int], regA: Int = 0, regB: Int = 0, regC: Int = 0) {
    self.program = program
    self.regA = regA
    self.regB = regB
    self.regC = regC
    self.ip = 0
    self.output = []
  }
  
  private func getComboValue(_ operand: Int) -> Int {
    switch operand {
    case 0...3: return operand
    case 4: return regA
    case 5: return regB
    case 6: return regC
    default: fatalError("Invalid combo operand: \(operand)")
    }
  }
  
  func run() {
    while ip < program.count - 1 {  // Need at least 2 numbers for opcode+operand
      let opcode = program[ip]
      let operand = program[ip + 1]
      
      switch opcode {
      case 0:  // adv
        let divisor = Int(pow(2.0, Double(getComboValue(operand))))
        regA /= divisor
        ip += 2
        
      case 1:  // bxl
        regB ^= operand
        ip += 2
        
      case 2:  // bst
        regB = getComboValue(operand) % 8
        ip += 2
        
      case 3:  // jnz
        if regA != 0 {
          ip = operand
        } else {
          ip += 2
        }
        
      case 4:  // bxc
        regB ^= regC
        ip += 2
        
      case 5:  // out
        let value = getComboValue(operand) % 8
        output.append(value)
        ip += 2
        
      case 6:  // bdv
        let divisor = Int(pow(2.0, Double(getComboValue(operand))))
        regB = regA / divisor
        ip += 2
        
      case 7:  // cdv
        let divisor = Int(pow(2.0, Double(getComboValue(operand))))
        regC = regA / divisor
        ip += 2
        
      default:
        fatalError("Invalid opcode: \(opcode)")
      }
    }
  }
  
  func getOutputString() -> String {
    return output.map(String.init).joined(separator: ",")
  }
}

struct Day17: AdventDay {
  var data: String
  
  func parseInput() -> [Int] {
    return data.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
  }
  
  func part1() -> Any {
    let program = parseInput()
    let computer = Computer(program: program, regA: 729, regB: 0, regC: 0)
    computer.run()
    return computer.getOutputString()
  }
  
  func part2() -> Any {
    let program = parseInput()
    let target = program.map(String.init).joined(separator: ",")
    
    // Try values for register A until we find one that outputs the program
    var a = 1
    while true {
      let computer = Computer(program: program, regA: a, regB: 0, regC: 0)
      computer.run()
      if computer.getOutputString() == target {
        return a
      }
      a += 1
      
      // Sanity check to prevent infinite loop
      if a > 1_000_000 {
        return "No solution found"
      }
    }
  }
}
