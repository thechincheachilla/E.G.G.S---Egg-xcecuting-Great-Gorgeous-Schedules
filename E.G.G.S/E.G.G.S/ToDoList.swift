//
//  ViewController.swift
//  StupidTable
//
//  Created by stlp on 10/13/19.
//  Copyright © 2019 B.L.U.E. All rights reserved.
//

import UIKit

class ToDoList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var HighLabel: UILabel!
    
    @IBOutlet weak var High2Label: UILabel!
    
    
    @IBOutlet weak var MedLabel: UILabel!
    
    @IBOutlet weak var LowLabel: UILabel!
    
    var masterArray: [task] = []
    var activity = ""
    var firstPriNum = 0
    var highPriNum = 0
    var medPriNum = 0
    var lowPriNum = 0
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(masterArray.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = masterArray[indexPath.row].description
        
        return(cell)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let calcEggs:calculator = calculator(firstP:firstPriNum, highP:highPriNum, medP:medPriNum, lowP:lowPriNum)
        
        let alloFirst = calcEggs.firstPCalc()
        let alloHigh = calcEggs.highPCalc()
        let alloMed = calcEggs.medPCalc()
        let alloLow = calcEggs.lowPCalc()
        
        HighLabel.text = String(alloFirst)
        High2Label.text = String(alloHigh)
        MedLabel.text = String(alloMed)
        LowLabel.text = String(alloLow)
    }


}

