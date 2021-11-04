//
//  ViewController.swift
//  OneX
//
//  Created by Jz D on 2021/11/4.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var queue = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testQueue()
    }

    
    
    func testQueue(){
        
        queue.maxConcurrentOperationCount = 1
        for i in 0...20{
            let blockOp = BlockOperation {
                print(i)
            }
            if i % 2 == 0{
                blockOp.queuePriority = .high
            }
            else{
                blockOp.queuePriority = .low
            }
            queue.addOperation(blockOp)
        }
        
        
        
    }

}

