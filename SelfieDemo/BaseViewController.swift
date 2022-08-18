//
//  BaseViewController.swift
//  MovieIOS11
//
//  Created by Trịnh Xuân Minh on 15/05/2022.
//

import UIKit

class BaseViewController: UIViewController, ViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addComponents()
        self.setConstraints()
        self.setProperties()
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

    func mergeSelfieImage(sourceView: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(sourceView.frame.size, false, 0.0)
        sourceView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
