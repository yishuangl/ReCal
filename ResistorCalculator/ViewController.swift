//
//  ViewController.swift
//  ResistorCalculator
//
//  Created by Yishuang Liang on 10/10/15.
//  Copyright © 2015 Yishuang Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var jiffImageView: UIImageView!
    
    @IBOutlet weak var picker1: UIPickerView!
    
    @IBOutlet weak var result: UILabel!
    
    var picker1Data: [[String]] = [[String]]()
    
    enum PickerComponent:Int{
        case sig1 = 0
        case sig2 = 1
        case multiplier = 2
        case tolerance = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testButton.setTitle("Click", forState: UIControlState.Normal)
        
        //connect data
        self.picker1.delegate = self
        self.picker1.dataSource = self
        
        picker1Data = [["Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White"],
        ["Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White"],
        ["Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White", "Gold", "Silver"],
        ["Brown", "Red", "Yellow", "Green", "Blue", "Violet", "Grey", "Gold", "Silver", "None"]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return picker1Data.count
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker1Data[component].count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker1Data[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        updateLabel()
    }
    
    func updateLabel() {
        let sig1Compontent = PickerComponent.sig1.rawValue
        let sig2Compontent = PickerComponent.sig2.rawValue
        let multiplierCompontent = PickerComponent.multiplier.rawValue
        let toleranceCompontent = PickerComponent.tolerance.rawValue
        let sig1 = picker1Data[sig1Compontent][picker1.selectedRowInComponent(sig1Compontent)]
        var s1: Int
        switch sig1 {
            case "Black":
                s1 = 0
            case "Brown":
                s1 = 1
            case "Red":
                s1 = 2
            case "Orange":
                s1 = 3
            case "Yellow":
                s1 = 4
            case "Green":
                s1 = 5
            case "Blue":
                s1 = 6
            case "Violet":
                s1 = 7
            case "Grey":
                s1 = 8
            case "White":
                s1 = 9
        default:
            s1 = -1
        }
        
        let sig2 = picker1Data[sig2Compontent][picker1.selectedRowInComponent(sig2Compontent)]
        
        var s2: Int
        switch sig2 {
        case "Black":
            s2 = 0
        case "Brown":
            s2 = 1
        case "Red":
            s2 = 2
        case "Orange":
            s2 = 3
        case "Yellow":
            s2 = 4
        case "Green":
            s2 = 5
        case "Blue":
            s2 = 6
        case "Violet":
            s2 = 7
        case "Grey":
            s2 = 8
        case "White":
            s2 = 9
        default:
            s2 = -1
        }
        
        let multiplier = picker1Data[multiplierCompontent][picker1.selectedRowInComponent(multiplierCompontent)]
        var m: Int
        switch multiplier {
        case "Black":
            m = 1
        case "Brown":
            m = 10
        case "Red":
            m = 100
        case "Orange":
            m = 1000
        case "Yellow":
            m = 10000
        case "Green":
            m = 100000
        case "Blue":
            m = 1000000
        case "Violet":
            m = 10000000

        default:
            m = -1
        }
        
        let tolerance = picker1Data[toleranceCompontent][picker1.selectedRowInComponent(toleranceCompontent)]
        
        result.text = String((10 * s1 + s2) * m)
    }

    @IBAction func ButtonTapped(sender: AnyObject) {
        self.jiffImageView.image = UIImage(named: "photo2")
    }

}

