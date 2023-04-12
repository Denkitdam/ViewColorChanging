//
//  MainViewController.swift
//  ViewColorChanging
//
//  Created by Denis Kitaev on 11.04.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setupBackgroundColor(with: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 150/255,
            green: 100/255,
            blue: 255/255,
            alpha: 1.0
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.color = view.backgroundColor
    }
    


}

  // MARK: - SettingsViewControllerDelegate

extension MainViewController: SettingsViewControllerDelegate {
    func setupBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
    
    
}
