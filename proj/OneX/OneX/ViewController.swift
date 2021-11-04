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
        // testQueue()
        
        testQueueQuality()
    }

    
    
    func testQueue(){
        queue.maxConcurrentOperationCount = 10
        //  queue.maxConcurrentOperationCount = 1
        for i in 0...20{
            let blockOp = BlockOperation {
                print(i)
            }
            
            //  if i % 2 == 1{
            //  此时， 第一个调度的任务，先走
            
            if i % 2 == 1{
                blockOp.queuePriority = .high
            }
            else{
                blockOp.queuePriority = .low
            }
            queue.addOperation(blockOp)
        }
        
        
        
    }

    
    
    
    func testQueueQuality(){
        //  queue.maxConcurrentOperationCount = 10
        queue.maxConcurrentOperationCount = 1
        for i in 0...20{
            let blockOp = BlockOperation {
                print(i)
            }
            
            //  if i % 2 == 1{
            //  此时， 第一个调度的任务，先走
            
            if i % 2 == 1{
                blockOp.qualityOfService = .background
            }
            else{
                // 没啥影响
                blockOp.qualityOfService = .userInitiated
            }
            queue.addOperation(blockOp)
        }
        
        
        
    }
}



// 影响线程调度的因素，包含：

// 任务的优先级



