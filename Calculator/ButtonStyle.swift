//
//  buttonStyle.swift
//  Calculator
//
//  Created by Consultant on 5/19/22.
//

import Foundation
import UIKit

@propertyWrapper
public class ButtonStyle {
    
    public var wrappedValue: UIButton
    
    public init(text: String, color: UIColor){
        self.wrappedValue = UIButton()
        buttonStyling(buttomTitle: text, baseBackgroundColor: color)
    }
    
    private func buttonStyling(buttomTitle: String, baseBackgroundColor: UIColor) {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = baseBackgroundColor
        wrappedValue = UIButton(configuration: configuration, primaryAction: nil)
        wrappedValue.setTitle(buttomTitle, for: .normal)
        wrappedValue.titleLabel?.font = .systemFont(ofSize: 30)
        wrappedValue.tintColor = .white
    }
    

    
}
