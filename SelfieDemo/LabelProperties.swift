//
//  ComponentProperties.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit

struct LabelProperties {
    let font: UIFont
    let textColor: UIColor
    let location: ComponentLocation

    init(font: UIFont, textColor: UIColor, location: ComponentLocation) {
        self.font = font
        self.textColor = textColor
        self.location = location
    }
}
