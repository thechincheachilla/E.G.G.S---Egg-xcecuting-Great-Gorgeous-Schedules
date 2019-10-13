//
//  ToDoController.swift
//  E.G.G.S
//
//  Created by stlp on 10/13/19.
//  Copyright © 2019 B.L.U.E. All rights reserved.
//

import UIKit

class ToDoController: UITableViewController {
    
    //@IBOutlet var Table: UITableView!
    
    var masterArray: [task] = []
    
    var activity = ""
    var firstPriNum = 0
    var highPriNum = 0
    var medPriNum = 0
    var lowPriNum = 0
    
    let list = ["Boof", "Bean", "Bef"]
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        /*for i in 0..<masterArray.count{
            text.text = masterArray[i].description
            text.textColor = UIColor.blue
            text.backgroundColor = UIColor.systemPink
            text.frame = CGRect(x: 40, y: 101 + i * 100, width: 335, height: 45)
            print(text)
            
        }*/
        //for i in 0..<masterArray.count {
        //print(masterArray[i].description)
        //print("TODOCONTROLLER STARTS HERE")
        //print(firstPriNum, highPriNum, medPriNum, lowPriNum)
        
        }

        // Do any additional setup after loading the view.
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


