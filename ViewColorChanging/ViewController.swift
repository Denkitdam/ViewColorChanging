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
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redSliderMoved() {
        paletteView.backgroundColor = redSlider.thumbTintColor?.withAlphaComponent(CGFloat(redSlider.value))
        let formattedRedSliderValue = String(format: "%.2f", redSlider.value)
        redColourValueLabel.text = formattedRedSliderValue
    }
    @IBAction func greenSliderMoved() {
        paletteView.backgroundColor = greenSlider.thumbTintColor?.withAlphaComponent(CGFloat(greenSlider.value))
        let formattedGreenSliderValue = String(format: "%.2f", greenSlider.value)
        greenColourValueLabel.text = formattedGreenSliderValue
    }
    @IBAction func blueSliderMoved() {
        paletteView.backgroundColor = blueSlider.thumbTintColor?.withAlphaComponent(CGFloat(blueSlider.value))
        let formattedBlueSliderValue = String(format: "%.2f", blueSlider.value)
        blueColourValueLabel.text = formattedBlueSliderValue
    }

}

