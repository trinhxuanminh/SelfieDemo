//
//  BaseFrame.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit

protocol BaseFrame {
    var background: AppImage.ImageName { get }
    var camera: ComponentLocation { get }
    var poster: ComponentLocation { get }
    var secondPoster: ComponentLocation? { get }
    var title: LabelProperties { get }
    var secondTitle: LabelProperties? { get }
    var date: LabelProperties { get }
    var address: LabelProperties { get }
}
