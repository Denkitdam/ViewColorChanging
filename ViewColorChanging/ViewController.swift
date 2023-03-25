//
//  ViewController.swift
//  ViewColorChanging
//
//  Created by Denis Kitaev on 24.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var paletteView: UIView!
    @IBOutlet var redColourValueLabel: UILabel!
    @IBOutlet var greenColourValueLabel: UILabel!
    @IBOutlet var blueColourValueLabel: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            let formattedRedLabelValue = String(format: "%.2f", sender.value)
            redColourValueLabel.text = formattedRedLabelValue
        case 2:
            let formattedGreenlabelValue = String(format: "%.2f", sender.value)
            greenColourValueLabel.text = formattedGreenlabelValue
        default:
            let formattedBlueLabelValue = String(format: "%.2f", sender.value)
            blueColourValueLabel.text = formattedBlueLabelValue
            
        }
    }
  

}

