//
//  ActivitiesPageViewController.swift
//  E.G.G.S
//
//  Created by stlp on 10/12/19.
//  Copyright © 2019 B.L.U.E. All rights reserved.
//

import UIKit

class ActivitiesPageViewController: UIViewController {
    
    @IBOutlet weak var activityInput: UITextField!
    
    @IBOutlet weak var addActivity: UIButton!
    
    
    @IBOutlet weak var firstPriority: UIButton!
    
    @IBOutlet weak var highPriority: UIButton!
    
    @IBOutlet weak var mediumPriority: UIButton!
    
    @IBOutlet weak var lowPriority: UIButton!
    
    @IBOutlet weak var errorMsg: UILabel!
    
    var masterArray: [task] = []
    var actToNum:task = task()
    
    var activityText = ""
    var firstPriNum = 0
    var highPriNum = 0
    var medPriNum = 0
    var lowPriNum = 0
    
    var first:Bool = false
    var high:Bool = false
    var med:Bool = false
    var low:Bool = false
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if activityInput.text != " " {
            var process = segue.destination as! processInput
            process.name = activityInput.text!
        }
        
    
    }
    
    @IBAction func firstPriority(_ sender: Any) {
        //firstPriNum+=1
        //print(firstPriNum)
        func prepare(for segue: UIStoryboardSegue, sender: Any?){
            var process = segue.destination as! processInput
            process.level = String(firstPriNum)
        }
    }
    /*
    @IBAction func taskOne(sender: UIButton){
        func prepare(for segue: UIStoryboardSegue, sender: Any?){
            //highestNum+=1
            var process = segue.destination as! processInput
            process.level = "1"
        }
    }
 */
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        activityInput.delegate = self
        errorMsg.text = "Enter at least 1 of each priority!"

        // Do any additional setup after loading the view.
    }
    
    /*
        SENDING DATA BETWEEN VIEW CONTROLLERS:
        In order to send data, the performSegue method must be used.
        First, create a segue by ctrl-dragging one view controller into
        another. The second view controller will receive the info from the
        first. Give the segue a name (in this case, it is called
        "activities". To send data, in the modifier (in this case, the
        firstPriority button), performSegue(withIdentifier: "name of segue", sender: self)
     
        Then, overrade func prepare (exactly same as below in every single
        case. To initiate the send, var "nameOfSend" = segue.destination as!
        "name of view controller to be sent to (in this case processInput).
    */
    @IBAction func submitActivity(_ sender: Any) {
        if (first) {
            if (activityInput.text == "") {
                errorMsg.text = "You must enter an activity!"
            }
            else if (firstPriNum > 0) {
                errorMsg.text = "You can only have one first priority activity!"
            }
            else {
                errorMsg.text = ""
                self.activityText = activityInput.text!
                self.firstPriNum+=1
                //performSegue(withIdentifier: "activities", sender: self)
                masterArray = actToNum.add(array:masterArray, name:activityText, level: 3)
            }
            first = false;
        }
        else if (high) {
            if (activityInput.text == "") {
                errorMsg.text = "You must enter an activity!"
            }
            else if (highPriNum > 6) {
                errorMsg.text = "You can only have up to 7 high priority activities!"
            }
            else {
                errorMsg.text = ""
                self.activityText = activityInput.text!
                self.highPriNum+=1
                //performSegue(withIdentifier: "activities", sender: self)
                masterArray = actToNum.add(array:masterArray, name:activityText, level: 2)
            }
            high = false
        }
        else if (med) {
            if (activityInput.text == "") {
                errorMsg.text = "You must enter an activity!"
            }
            else if (lowPriNum + medPriNum > 40) { // Here
                errorMsg.text = "Medium and low priority activities maxed!" // also here
            }
            else {
                errorMsg.text = ""
                self.activityText = activityInput.text!
                self.medPriNum+=1
                //performSegue(withIdentifier: "activities", sender: self)
                masterArray = actToNum.add(array:masterArray, name:activityText, level: 1)
            }
            med = false
        }
        else if (low) {
            if (activityInput.text == "") {
                errorMsg.text = "You must enter an activity!"
            }
            else if (lowPriNum + medPriNum > 40) { // Here
                errorMsg.text = "Medium and low priority activities maxed!" // also here
            }
            else {
                errorMsg.text = ""
                self.activityText = activityInput.text!
                self.lowPriNum+=1
                //performSegue(withIdentifier: "activities", sender: self)
                masterArray = actToNum.add(array:masterArray, name:activityText, level: 0)
            }
            low = false
        }
        print(firstPriNum, highPriNum, medPriNum, lowPriNum)
        for i in 0..<masterArray.count {
            print(masterArray[i].description)
        }
    }
    
    @IBAction func firstPriority(_ sender: Any) {
        high = false
        med = false
        low = false
        first = true
        errorMsg.text = "First priority selected!"
    }
    
    @IBAction func highPriority(_ sender: Any) {
        first = false
        low = false
        med = false
        high = true
        errorMsg.text = "High priority selected!"
    }
    
    @IBAction func mediumPriority(_ sender: Any) {
        low = false
        first = false
        high = false
        med = true
        errorMsg.text = "Medium priority selected!"
    }
    
    @IBAction func lowPriority(_ sender: Any) {
        first = false
        med = false
        high = false
        low = true
        errorMsg.text = "Low priority selected!"
    }
    
    @IBAction func finish(_ sender: Any) {
        performSegue(withIdentifier: "activities", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendAct = segue.destination as! ToDoList
        // Sends data. "activity" and "firstPriNum" are defined in
        // the processInput class.
        sendAct.activity += self.activityText
        sendAct.firstPriNum += self.firstPriNum
        sendAct.highPriNum += self.highPriNum
        sendAct.medPriNum += self.medPriNum
        sendAct.lowPriNum += self.lowPriNum
        sendAct.masterArray = self.masterArray
    }
    
    
        
    // Leaves the keyboard when a tap is detected outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        activityInput.resignFirstResponder()
    }
}

// Exits the keyboard when the return button is clicked
extension ActivitiesPageViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

