//
//  ViewController.swift
//  ViewColorChanging
//
//  Created by Denis Kitaev on 24.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var paletteView: UIView!
    
    @IBOutlet var redColourValueLabel: UILabel!
    @IBOutlet var greenColourValueLabel: UILabel!
    @IBOutlet var blueColourValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPaletteViewBackgroundColor()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        setupPaletteViewBackgroundColor()
        switch sender.tag {
        case 1:
            redColourValueLabel.text = String(format: "%.2f", sender.value)
        case 2:
            greenColourValueLabel.text = String(format: "%.2f", sender.value)
        default:
            blueColourValueLabel.text = String(format: "%.2f", sender.value)
            
        }
    }
    private func setupPaletteViewBackgroundColor() {
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
