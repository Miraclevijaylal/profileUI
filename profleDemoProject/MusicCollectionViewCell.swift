//
//  MusicCollectionViewCell.swift
//  profleDemoProject
//
//  Created by Vijay Lal on 07/09/24.
//

import Foundation
import UIKit
class MusicCollectionViewCell: UICollectionViewCell {
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    lazy var musicName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
//        label.backgroundColor = .red
        return label
    }()
    var selection: Bool? {
        didSet {
            if selection ?? false {
                musicName.textColor = .white
                containerView.setColorToBaseView(color: UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00))
            } else {
                musicName.textColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
                containerView.setColorToBaseView(color: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00))
            }
        }
    }
    var model: SectionHeadingModel?  {
        didSet {
            musicName.text = model?.heading ?? ""
        }
    }
    lazy var containerView: BaseView = {
        let view = BaseView(with: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00), circular: false, shadow: true, borderColor: nil, borderThickness: nil)
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        containerView.layer.cornerRadius = 10
        initViews()
//        self.backgroundColor = .lightGray
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MusicCollectionViewCell {
    private func initViews() {
        self.addSubview(containerView)
//        containerView.layer.cornerRadius = 8
//        containerView.borderColor = UIColor.red.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.widthAnchor.constraint(equalToConstant: 200),
         containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
         containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
         containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
         containerView.heightAnchor.constraint(equalToConstant: 250)
        ].forEach({ $0.isActive = true })
        self.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        [backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
         backgroundImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
         backgroundImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
         backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        self.addSubview(musicName)
        musicName.translatesAutoresizingMaskIntoConstraints = false
        [musicName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2),
         musicName.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
         musicName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50)
        ].forEach({ $0.isActive = true })
    }
}
