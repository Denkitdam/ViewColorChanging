//
//  ViewController.swift
//  ViewColorChanging
//
//  Created by Denis Kitaev on 24.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
      
    // MARK: -IB Outlets

    @IBOutlet var paletteView: UIView!
    
    @IBOutlet var redColourValueLabel: UILabel!
    @IBOutlet var greenColourValueLabel: UILabel!
    @IBOutlet var blueColourValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
      // MARK: - Public properties
    var color: UIColor!
   unowned var delegate: SettingsViewControllerDelegate!
    
      // MARK: - View life cycle
    
    override func viewDidLoad() {
        paletteView.backgroundColor = color
        
         setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redColourValueLabel, greenColourValueLabel, blueColourValueLabel)
        setValue(for: redTF, greenTF, blueTF)
    }

      // MARK: -IB Actions
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
       
        switch sender {
        case redSlider:
            setValue(for: redColourValueLabel)
            setValue(for: redTF)
        case greenSlider:
            setValue(for: greenColourValueLabel)
            setValue(for: greenTF)
        default:
            setValue(for: blueColourValueLabel)
            setValue(for: blueTF)
        }
        
        setColor()
    }
    @IBAction func doneButtonTapped() {
        delegate.setupBackgroundColor(with: paletteView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
}


  // MARK: - Private Methods

extension SettingsViewController {
    
    private func setColor() {
        paletteView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColourValueLabel:
                label.text = string(from: redSlider)
            case greenColourValueLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
                
                
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF:
                textField.text = string(from: redSlider)
            case greenTF:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: color)
        colorSliders.forEach { colorSlider in
            switch colorSlider {
            case redSlider:
                redSlider.value = Float(ciColor.red)
            case greenSlider:
                greenSlider.value = Float(ciColor.green)
            default:
                blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = "0.50"
            textField?.becomeFirstResponder()
        }
        
        alert.addAction(okButton)
        present(alert, animated: true)
    }

}

