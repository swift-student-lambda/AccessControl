//
//  CryptoView.swift
//  AccessControl
//
//  Created by Shawn Gee on 7/30/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class CryptoView: UIView {
    
    private let cryptographer = Cryptographer()
    
    // TODO: Setup subviews
    private lazy var inputTextField: UITextField = {
        let inputTextField = UITextField()
        inputTextField.placeholder = "Input some text"
        inputTextField.autocapitalizationType = .none
        inputTextField.delegate = self
        return inputTextField
    }()
    
    private lazy var outputTextField: UITextField = {
        let outputTextField = UITextField()
        outputTextField.placeholder = "Encrypted text will appear here"
        outputTextField.autocapitalizationType = .none
        outputTextField.delegate = self
        return outputTextField
    }()
    
    private lazy var keyLabel: UILabel = {
        let keyLabel = UILabel()
        keyLabel.text = "Key: \(cryptographer.key)"
        return keyLabel
    }()
    
    private let keyStepper: UIStepper = {
        let keyStepper = UIStepper()
        keyStepper.minimumValue = -26
        keyStepper.maximumValue = 26
        keyStepper.value = 3
        keyStepper.addTarget(self, action: #selector(keyChanged(_:)), for: .valueChanged)
        return keyStepper
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }
    
    // MARK: - Private Functions
    
    private func configureViews() {
        // TODO: Add views and configure constraints
        // Horizontal stack view for key stepper and label
        let keyStack = UIStackView(arrangedSubviews: [keyLabel, keyStepper])
        keyStack.alignment = .center
        keyStack.spacing = 20
        
        // Main stack view to put inputTextField, key stack, and outputTextField
        let mainStack = UIStackView(arrangedSubviews: [
            inputTextField,
            keyStack,
            outputTextField,
        ])
        
        mainStack.axis = .vertical
        mainStack.alignment = .leading
        mainStack.distribution = .fillEqually
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Add main stack view to this view, and add constraints
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            inputTextField.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            outputTextField.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor),
            
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc private func keyChanged(_ stepper: UIStepper) {
        cryptographer.key = Int(stepper.value)
        keyLabel.text = "Key: \(cryptographer.key)"
        updateOutput()
    }
    
    
    // TODO: Add functions for updating views
    
    private func updateInput() {
        guard let outputText = outputTextField.text else { return }
        inputTextField.text = cryptographer.decode(string: outputText)
    }
    
    private func updateOutput() {
        guard let inputText = inputTextField.text else { return }
        outputTextField.text = cryptographer.encode(string: inputText)
    }
}

extension CryptoView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == inputTextField {
            updateOutput()
        } else {
            updateInput()
        }
    }
}
