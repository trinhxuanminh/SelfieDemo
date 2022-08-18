//
//  Frame6.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit

struct Frame6: BaseFrame {
    var background: AppImage.ImageName = .frame6
    
    var camera = ComponentLocation(x: 33.44, y: 39.49, width: 269.87, height: 203.17, rotationAngle: 0.0)

    var poster = ComponentLocation(x: 109.6, y: 211.53, width: 200.85, height: 136.82, rotationAngle: -13)

    var secondPoster: ComponentLocation? = nil
    
    var title = LabelProperties(font: AppFont.get(fontName: .utmBebas, size: 50),
                                textColor: UIColor(rgb: 0x000000),
                                location: ComponentLocation(x: 31.5, y: 360.55, width: 315.29, height: 78.82, rotationAngle: 4.59))

    var secondTitle: LabelProperties? = LabelProperties(font: AppFont.get(fontName: .pompiereRegular, size: 14),
                                                        textColor: UIColor(rgb: 0x000000),
                                                        location: ComponentLocation(x: 191.47, y: 10.59, width: 140.92, height: 56.37, rotationAngle: -5.08))

    var date = LabelProperties(font: AppFont.get(fontName: .pompiereRegular, size: 14),
                               textColor: UIColor(rgb: 0x000000),
                               location: ComponentLocation(x: 69.49, y: 319.29, width: 167.2, height: 32.49, rotationAngle: 0.0))

    var address = LabelProperties(font: AppFont.get(fontName: .pompiereRegular, size: 14),
                                  textColor: UIColor(rgb: 0x000000),
                                  location: ComponentLocation(x: 69.49, y: 346.78, width: 167.2, height: 32.0, rotationAngle: 0.0))
}
