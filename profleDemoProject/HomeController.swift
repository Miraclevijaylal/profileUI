//
//  HomeController.swift
//  profleDemoProject
//
//  Created by Vijay Lal on 06/09/24.
//

import Foundation
import UIKit
class HomeController: UIViewController {
    lazy var entryTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    lazy var currentValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = -1
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    @objc func buttonClicked() {
        guard let storedValue = entryTextField.text else { return }
        if storedValue.isEmpty {
            let alert = UIAlertController(title: "Error", message: "TextField cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                guard let unwrappedSelf = self else { return }
                unwrappedSelf.dismiss(animated: true)
            }))
            self.present(alert, animated: true)
        } else {
            UserDefaults.standard.setValue(storedValue, forKey: "Value")
            let alert = UIAlertController(title: "Success", message: "Value stored", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                guard let unwrappedSelf = self else { return }
                unwrappedSelf.dismiss(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
}
extension HomeController {
    private func initView() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(entryTextField)
        entryTextField.translatesAutoresizingMaskIntoConstraints = false
        [entryTextField.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: 0),
         entryTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
         entryTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10)
        ].forEach({ $0.isActive = true })
        view.addSubview(currentValueLabel)
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        [currentValueLabel.bottomAnchor.constraint(equalTo: entryTextField.topAnchor, constant: -10),
         currentValueLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
         currentValueLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10)
        ].forEach({ $0.isActive = true })
        if let storedValue = UserDefaults.standard.value(forKey: "Value") as? String {
            currentValueLabel.text = storedValue
        }
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        [saveButton.topAnchor.constraint(equalTo: entryTextField.bottomAnchor, constant: 10),
         saveButton.centerXAnchor.constraint(equalTo: entryTextField.centerXAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
    }
    
}
