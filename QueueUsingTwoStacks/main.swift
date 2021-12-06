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

struct TwoStackQueue: CustomStringConvertible {
    private var leftStack = Stack()
    private var rightStack = Stack()
    
    var isEmpty: Bool {
        leftStack.items.isEmpty && rightStack.items.isEmpty
    }
    
    var peek: Int? {
        leftStack.items.isEmpty ? rightStack.items.first : leftStack.items.last
    }
    
    var description: String {
        if isEmpty {
            return "Queue is empty"
        }
        var allElements:[Int] = []
        if leftStack.items.isEmpty == false {
            allElements.append(contentsOf: leftStack.items.reversed())
        }
        allElements.append(contentsOf: rightStack.items)
        
        return "----Queue start----\n"
            + allElements.map ({ "\($0)" }).joined(separator: " -> ")
            + "\n----Queue end----"
    }
    
    mutating func enqueue(_ element: Int) {
        leftStack.push(element)
    }
    
    mutating func dequeue() -> Int? {
        if isEmpty { return nil }
        
        if rightStack.items.isEmpty {
            while !leftStack.items.isEmpty {
                rightStack.push(leftStack.pop()!)
            }
        }
        return rightStack.pop()
    }
}

