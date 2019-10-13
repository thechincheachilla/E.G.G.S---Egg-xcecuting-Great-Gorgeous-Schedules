//
//  File.swift
//  E.G.G.S
//
//  Created by stlp on 10/13/19.
//  Copyright © 2019 B.L.U.E. All rights reserved.
//

import Foundation
import UIKit

/*
    calculator class: calculates the apportionment of eggs
    based on the number of activities a user has, as well
    as the priority level of those activities.
*/
class calculator {
    
    private var firstP:Int
    private var highP:Int
    private var medP:Int
    private var lowP:Int
    
    /*
        Constructor: accepts the final counts for each activity
        priority.
    */
    init(firstP:Int, highP:Int, medP:Int, lowP:Int) {
        self.firstP = firstP
        self.highP = highP
        self.medP = medP
        self.lowP = lowP
    }
    
    /*
        firstPCalc: determines the amount of large eggs
        to assign to the First Priority activity. (Based on the
        total number of large eggs available, 9)
        At the very least, the first priority activity will
        be assigned 2 large eggs.
    */
    func firstPCalc() -> Int{
        if (highP == 0) {
            return 9
        }
        else if (highP < 3 || highP == 4) {
            return 5
        }
        else if (highP == 3 || highP == 6) {
            return 3
        }
        else if (highP == 5) {
            return 4
        }
        else if (highP == 7) {
            return 2
        }
        return -1
    }
    
    /*
        highPCalc: determines the ratio of large eggs
        to assign to high priority tasks. There are 9
        large eggs available in total.
    */
    func highPCalc() -> Int {
        if (highP == 0) {
            return 0
        }
        else {
            return (9 - firstPCalc())/highP
        }
    }
    
    /*
        medPCalc: determines the ratio of small eggs
        to assign to medium priority tasks. There are
        40 eggs in total, and medium tasks combined should
        account for 60% (24) of all small eggs.
     
        Future goal: Ensure all small eggs in total are assigned to
        medium and low priority tasks (use of Integer is lossy).
    */
    func medPCalc() -> Int {
        
        // Prevents divide by 0 error
        if (medP > 0) {
            return (24/medP)
        }
        return 0
    }
    
    /*
        lowPCalc: determines the ratio of small eggs
        to assign to low priority tasks. There are
        40 eggs in total, and medium tasks combined should
        account for 40% (16) of all small eggs.
    */
    func lowPCalc() -> Int {
        
        // Prevents divide by 0 error
        if (lowP > 0) {
            return (16/lowP)
        }
        return 0
    }
    
    
}
