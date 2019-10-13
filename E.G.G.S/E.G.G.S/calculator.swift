//
//  File.swift
//  E.G.G.S
//
//  Created by stlp on 10/13/19.
//  Copyright © 2019 B.L.U.E. All rights reserved.
//

import Foundation
import UIKit

class calculator {
    
    private var firstP:Int
    private var highP:Int
    private var medP:Int
    private var lowP:Int
    // 40 Smalls
    
    init(firstP:Int, highP:Int, medP:Int, lowP:Int) {
        self.firstP = firstP
        self.highP = highP
        self.medP = medP
        self.lowP = lowP
    }
    
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
    
    func highPCalc() -> Int {
        if (highP == 0) {
            return 0
        }
        else {
            return (9 - firstPCalc())/highP
        }
    }
    
    
    func medPCalc() -> Int {
        if (medP > 0) {
            return (24/medP)
        }
        return 0
    }
    
    func lowPCalc() -> Int {
        if (lowP > 0) {
            return (16/lowP)
        }
        return 0
    }
    
    
}
