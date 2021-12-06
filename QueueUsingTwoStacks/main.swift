//
//  main.swift
//  QueueUsingTwoStacks
//
//  Created by slava bily on 06.12.2021.
//

import Foundation

struct Stack: CustomStringConvertible {
    
    var items: [Int] = []
    
    var description: String {
        return "----Stack begin----\n" +
            items.map({ "\($0)" }).joined(separator: "\n") +
        "\n---Stack end----"
    }
    
    mutating func push(_ item: Int) {
        items.insert(item, at: 0)
    }
    
    @discardableResult
    mutating func pop() -> Int? {
        if items.isEmpty { return nil }
        return items.removeFirst()
    }
    
    func peek() -> Int? {
        return items.first
    }
    
}

