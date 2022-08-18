//
//  ComponentLocation.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit

struct ComponentLocation {
    let x: CGFloat
    let y: CGFloat
    let width: CGFloat
    let height: CGFloat
    let rotationAngle: CGFloat

    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, rotationAngle: CGFloat) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.rotationAngle = rotationAngle
    }
}

