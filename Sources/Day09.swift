import Algorithms
import Foundation

struct Day09: AdventDay {
  let data: String
  private var diskBlocks: [FileBlock]
  
  enum FileBlock: Equatable {
    case file(id: Int, size: Int)
    case empty
  }
  
  init(data: String) {
    self.data = data
    self.diskBlocks = []
    self.diskBlocks = Self.parseDiskMap(data)
  }
  
  private static func parseDiskMap(_ input: String) -> [FileBlock] {
    var blocks: [FileBlock] = []
    var currentId = 0
    var index = input.startIndex
    
    while index < input.endIndex {
      if let size = Int(String(input[index])) {
        // Add file blocks with size info
        blocks.append(.file(id: currentId, size: size))
        
        // Add empty spaces if there's a next number
        let nextIndex = input.index(after: index)
        if nextIndex < input.endIndex,
           let spaces = Int(String(input[nextIndex])) {
          blocks.append(contentsOf: Array(repeating: .empty, count: spaces))
        }
        
        currentId += 1
        index = input.index(index, offsetBy: 2, limitedBy: input.endIndex) ?? input.endIndex
      } else {
        index = input.index(after: index)
      }
    }
    
    return blocks
  }
  
  private func expandBlocks(_ blocks: [FileBlock]) -> [FileBlock] {
    blocks.flatMap { block -> [FileBlock] in
      if case let .file(id, size) = block {
        return Array(repeating: .file(id: id, size: 1), count: size)
      }
      return [block]
    }
  }
  
  private func defragment() -> [Int] {
    let expanded = expandBlocks(diskBlocks)
    var blocks = expanded
    var start = 0
    var end = blocks.count - 1
    
    while start < end {
      while start < end, case .file = blocks[start] { start += 1 }
      while start < end, case .empty = blocks[end] { end -= 1 }
      
      if start < end {
        blocks.swapAt(start, end)
      }
    }
    
    return blocks.compactMap { block in
      if case let .file(id, _) = block { return id }
      return nil
    }
  }
  
  func part1() -> Any {
    defragment().enumerated().reduce(0) { $0 + $1.offset * $1.element }
  }
  
  func part2() -> Any {
    var compressed = data.compactMap(\.wholeNumberValue)
    var indices = Array(0..<(compressed.count / 2 + 1))
    var idx = compressed.count - 1
    if !idx.isMultiple(of: 2) { idx -= 1 }
    var cId = idx / 2
    
    while idx >= 0 {
      if indices[idx / 2] != cId {
        idx -= 2
        continue
      }
      for p in stride(from: 1, to: idx, by: 2) {
        if compressed[p] >= compressed[idx] {
          compressed[p] -= compressed[idx]
          compressed.insert(contentsOf: [0, compressed[idx]], at: p)
          indices.insert(indices[idx / 2], at: (p + 1) / 2)
          idx += 2
          
          indices.remove(at: idx / 2)
          if idx == compressed.count - 1 {
            compressed[idx - 1] += compressed[idx]
            compressed.remove(at: idx)
          } else {
            compressed[idx - 1] += compressed[idx] + compressed[idx + 1]
            compressed.removeSubrange(idx..<(idx + 2))
          }
          break
        }
      }
      idx -= 2
      cId -= 1
    }
    
    let map = compressed
      .enumerated()
      .flatMap { idx, val in [Int](repeating: idx.isMultiple(of: 2) ? indices[idx / 2] : -1, count: val) }
    let result = map
      .enumerated()
      .filter { $0.element > 0 }
      .map { $0.element * $0.offset }
      .reduce(0, +)
    return "\(result)"
  }
  
}

/*
 [1, 2, 3, 4, 5]
 numbers[0] is the first file size
 numbers[1] is the first free space size
 numbers[2] is the second file size
 */
