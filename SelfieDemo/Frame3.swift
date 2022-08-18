//
//  Frame3.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit

struct Frame3: BaseFrame {
    var background: AppImage.ImageName = .frame3

    var camera = ComponentLocation(x: 45.14, y: 28.66, width: 241.11, height: 241.77, rotationAngle: 0)

    var poster = ComponentLocation(x: 253.18, y: 363.06, width: 83.6, height: 97.93, rotationAngle: 0.0)

    var secondPoster: ComponentLocation? = ComponentLocation(x: 21.95, y: 54.83, width: 56.35, height: 68.48, rotationAngle: 0.0)

    var title = LabelProperties(font: AppFont.get(fontName: .iCielBambola, size: 38),
                                textColor: UIColor(rgb: 0x744E30),
                                location: ComponentLocation(x: 155.7, y: 324.84, width: 176.0, height: 38.0, rotationAngle: 0.0))

    var secondTitle: LabelProperties? = nil

    var date = LabelProperties(font: AppFont.get(fontName: .playballRegular, size: 14),
                               textColor: UIColor(rgb: 0xFFFFFF),
                               location: ComponentLocation(x: 36.49, y: 232.75, width: 158.0, height: 18.0, rotationAngle: 4.82))

    var address = LabelProperties(font: AppFont.get(fontName: .playballRegular, size: 14),
                                  textColor: UIColor(rgb: 0xFFFFFF),
                                  location: ComponentLocation(x: 35.83, y: 251.99, width: 191.23, height: 18.0, rotationAngle: 4.82))
}
