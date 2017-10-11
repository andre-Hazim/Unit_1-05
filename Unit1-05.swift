//
//  ViewController.swift
//
//  Created by Patrick Coxall on 2016-10-05.
//  This program shows basic UIKit elements working in an iPad Playground
//  Code calculates area and perimeter of a rectangle
// Modified on October 2017 by Andre
// Calcualtes cost of pizza from diameter 
import UIKit
import Foundation

// comment out line below and one at bottom, to make code work in Xcode
import PlaygroundSupport

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    var instructionLabel : UILabel!
    var diameterLabel : UILabel!
    var diameterTextField : UITextField!
    var calculateButton : UIButton!
    var costLabel : UILabel!
    
    
    override func viewDidLoad() {
        // create the UIView
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        self.view = view
        
        // create all the UIElements
        instructionLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 500, height: 50))
        instructionLabel.text = "Calculate the area and perimeter of a rectangle"
        view.addSubview(instructionLabel)
        
        diameterLabel = UILabel(frame: CGRect(x: 100, y: 200, width: 500, height: 50))
        diameterLabel.text = "Enter length"
        view.addSubview(diameterLabel)
        
        
        diameterTextField = UITextField(frame: CGRect(x: 200, y: 200, width: 200, height: 50))
        diameterTextField.borderStyle = UITextBorderStyle.roundedRect
        diameterTextField.placeholder = "diameter"
        view.addSubview(diameterTextField)
        
        
        
        
        calculateButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        calculateButton.setTitle("Calculate", for: UIControlState.normal)
        calculateButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        calculateButton.addTarget(self, action: #selector(calculateCost), for: UIControlEvents.touchUpInside)
        view.addSubview(calculateButton)
        
        costLabel = UILabel(frame: CGRect(x: 100, y: 500, width: 500, height: 50))
        costLabel.text = nil
        view.addSubview(costLabel)
        
        
        
    }
    
     @objc func calculateCost() {
        // calculate the cost of the pizza
        let PI: Double = Double(3.14)
        let LABOURCOST: Double = Double(0.75)
        let RENTCOST:Double = Double(1.00)
        let MATERIALCOST: Double =  Double(0.50)
        let HST: Double = Double(0.13)
        
        
        let diameter : Double =  Double(diameterTextField.text!)!
        
        var subTotal: Double = Double(LABOURCOST + RENTCOST + (MATERIALCOST * diameter) )
        var cost: Double = Double(subTotal+(subTotal * HST))
          
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        
        costLabel.text = "The price is: $\(round(cost*multiplier)/multiplier) ."
        
    }
    
    // this is for when code is moved to Xcode, the Status bar will be removed
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// need to also comment this out to make work in Xcode
PlaygroundPage.current.liveView = ViewController()


