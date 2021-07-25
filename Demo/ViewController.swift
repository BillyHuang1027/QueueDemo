//
//  ViewController.swift
//  Demo
//
//  Created by 黃昌齊 on 2021/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var imagePath = "path \(Int.self)"
        var queue = QueueArray<String>()
        
        for x in 0...5 {
            imagePath = "path \(x)"
            queue.addToQueue(imagePath)
            print("add to queue", queue)
        }
        
        for y in 0...5 {
            imagePath = "path \(y)"
            imageProcess()
            queue.removeFromQueue(imagePath)
            print("remove from queue", queue)
        }
    }
}

public protocol Queue {
    associatedtype Element
    mutating func addToQueue(_ imagePath: Element) -> Bool
    mutating func removeFromQueue(_ imagePath: Element) -> Element?
    var isEmpty: Bool { get }
}

public struct QueueArray<T>: Queue {
    private var array: [String] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func addToQueue(_ imagePath: String) -> Bool {
        array.append(imagePath)
        return true
    }
    
    public mutating func removeFromQueue(_ imagePath: String) -> String? {
        let index = array.firstIndex(of: imagePath)
        return isEmpty ? nil : array.remove(at: index!)
        //isEmpty = true 時回傳 nil，false 則刪除項目
    }
}

func imageProcess() {
    print("call back")
}
