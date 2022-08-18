//
//  FrameView.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 17/08/2022.
//

import UIKit

@IBDesignable class FrameView: BaseView {

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var secondPosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    private lazy var secondTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func addComponents() {
        self.addSubview(self.posterImageView)
        self.addSubview(self.secondPosterImageView)
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.secondTitleLabel)
        self.addSubview(self.dateLabel)
        self.addSubview(self.addressLabel)
    }

    override func setProperties() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
    }

    override func draw(_ rect: CGRect) {
        self.backgroundImageView.frame.size = self.frame.size
    }
}

extension FrameView {
    func changeFrame(_ newFrame: BaseFrame) {
        self.backgroundImageView.image = AppImage.get(name: newFrame.background)

        self.changeLocation(self.posterImageView, newLocation: newFrame.poster)

        if let secondPoster = newFrame.secondPoster {
            self.secondPosterImageView.isHidden = false
            self.changeLocation(self.secondPosterImageView, newLocation: secondPoster)
        } else {
            self.secondPosterImageView.isHidden = true
        }

        self.changeLabelProperties(self.titleLabel, newProperties: newFrame.title)

        if let secondTitle = newFrame.secondTitle {
            self.secondTitleLabel.isHidden = false
            self.changeLabelProperties(self.secondTitleLabel, newProperties: secondTitle)
        } else {
            self.secondTitleLabel.isHidden = true
        }

        self.changeLabelProperties(self.dateLabel, newProperties: newFrame.date)

        self.changeLabelProperties(self.addressLabel, newProperties: newFrame.address)
    }

    func changePoster(_ newValue: UIImage?) {
        self.posterImageView.image = newValue
    }

    func changeSecondPoster(_ newValue: UIImage?) {
        self.secondPosterImageView.image = newValue
    }

    func changeTitle(_ newValue: String?) {
        self.titleLabel.text = newValue
    }

    func changeSecondTitle(_ newValue: String?) {
        self.secondTitleLabel.text = newValue
    }

    func changeDate(_ newValue: String?) {
        self.dateLabel.text = newValue
    }

    func changeAddress(_ newValue: String?) {
        self.addressLabel.text = newValue
    }
}
