//
//  AppFont.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit

struct AppFont {
    enum FontName: String {
        case pompiereRegular = "Pompiere-Regular"
        case iCielBambola = "iCielBambola"
        case utmBebas = "UTM Bebas"
        case playballRegular = "Playball-Regular"
    }

    static func get(fontName: FontName, size: CGFloat) -> UIFont {
        return UIFont(name: fontName.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
