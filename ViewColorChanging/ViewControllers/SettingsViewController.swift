//
//  ViewController.swift
//  ViewColorChanging
//
//  Created by Denis Kitaev on 24.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

    @IBOutlet var paletteView: UIView!
    
    @IBOutlet var redColourValueLabel: UILabel!
    @IBOutlet var greenColourValueLabel: UILabel!
    @IBOutlet var blueColourValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var color: UIColor!
   unowned var delegate: SettingsViewControllerDelegate!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paletteView.backgroundColor = color
        redSlider.value = Float(color.colorComponents.red)
        greenSlider.value = Float(color.colorComponents.green)
        blueSlider.value = Float(color.colorComponents.blue)
        
        
        
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
            )
        
        switch sender.tag {
        case 0:
            redColourValueLabel.text = String(format: "%.2f", sender.value)
        case 1:
            greenColourValueLabel.text = String(format: "%.2f", sender.value)
        default:
            blueColourValueLabel.text = String(format: "%.2f", sender.value)
            
        }
    }
    @IBAction func doneButtonTapped() {
        delegate.setupBackgroundColor(with: paletteView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
}

  // MARK: - UIColor extension
extension UIColor {
    var colorComponents: (red:CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
