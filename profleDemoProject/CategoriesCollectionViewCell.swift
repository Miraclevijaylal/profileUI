//
//  CategoriesCollectionViewCell.swift
//  profleDemoProject
//
//  Created by Vijay Lal on 06/09/24.
//

import Foundation
import UIKit
class CategoriesCollectionViewCell: UICollectionViewCell {
    var selection: Bool? {
        didSet {
            if selection ?? false {
                topmusic.textColor = .white
                containerView.setColorToBaseView(color: UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00))
            } else {
                topmusic.textColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
                containerView.setColorToBaseView(color: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00))
            }
        }
    }
    var model: SectionHeadingModel?  {
        didSet {
            topmusic.text = model?.heading ?? ""
        }
    }
    lazy var containerView: BaseView = {
        let view = BaseView(with: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00), circular: false, shadow: true, borderColor: nil, borderThickness: nil)
        return view
    }()
    lazy var topmusic: UILabel = {
        let label = UILabel()
        label.text = "Top 100 Hit Musics"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CategoriesCollectionViewCell {
    private func initViews() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
         containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
         containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        self.addSubview(topmusic)
        topmusic.translatesAutoresizingMaskIntoConstraints = false
        [topmusic.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
         topmusic.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
         topmusic.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
         topmusic.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ].forEach({ $0.isActive = true })
    }
}
