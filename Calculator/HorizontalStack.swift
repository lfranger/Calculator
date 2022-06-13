//
//  HorizontalStack.swift
//  Calculator
//
//  Created by Consultant on 5/19/22.
//

import Foundation
import UIKit

@propertyWrapper
public class HorizontalStack {
    
    public var wrappedValue: UIStackView
    
    public init() {
        self.wrappedValue = UIStackView()
        setupHorizontalStack()
    }
    
    private func setupHorizontalStack() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        wrappedValue.axis = NSLayoutConstraint.Axis.horizontal
        wrappedValue.distribution = UIStackView.Distribution.fillEqually
        wrappedValue.alignment = UIStackView.Alignment.fill
        wrappedValue.spacing = 5.0
    }
}
