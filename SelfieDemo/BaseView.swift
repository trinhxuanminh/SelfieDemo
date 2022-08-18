//
//  BaseView.swift
//  MovieIOS11
//
//  Created by Trịnh Xuân Minh on 15/05/2022.
//

import UIKit

class BaseView: UIView, ViewProtocol {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addComponents()
        self.setConstraints()
        self.setProperties()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addComponents()
        self.setConstraints()
        self.setProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func addComponents() {}

    func setConstraints() {}

    func setProperties() {}

    func changeLocation(_ sender: UIView, newLocation: ComponentLocation) {
        guard let superview = sender.superview else {
            return
        }
        let newFrame = CGRect(x: newLocation.x / AppSize.widthFrameDefault * superview.frame.width,
                              y: newLocation.y / AppSize.heightFrameDefault * superview.frame.height,
                              width: newLocation.width / AppSize.widthFrameDefault * superview.frame.width,
                              height: newLocation.height / AppSize.heightFrameDefault * superview.frame.height)
        sender.frame = newFrame
        sender.transform = CGAffineTransform(rotationAngle: -newLocation.rotationAngle * CGFloat.pi / 180)
    }

    func changeLabelProperties(_ sender: UILabel, newProperties: LabelProperties) {
        self.changeLocation(sender, newLocation: newProperties.location)
        sender.textColor = newProperties.textColor
        sender.font = newProperties.font
    }
}
