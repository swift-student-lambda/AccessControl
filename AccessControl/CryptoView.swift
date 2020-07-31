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
        return inputTextField
    }()
    
    private lazy var outputTextField: UITextField = {
        let outputTextField = UITextField()
        return outputTextField
    }()
    
    private lazy var keyLabel: UILabel = {
        let keyLabel = UILabel()
        return keyLabel
    }()
    
    private let keyStepper: UIStepper = {
        let keyStepper = UIStepper()
        return keyStepper
    }()
    
    // MARK: - Init
    
    // TODO: Override inits
    
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
    }
    
    
    // TODO: Add functions for updating views
}
