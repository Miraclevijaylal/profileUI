//
//  ViewController.swift
//  profleDemoProject
//
//  Created by Vijay Lal on 06/09/24.
//

import UIKit

class ProfileController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//    let categoriesArray = [DataModel(title: "Top 100"), DataModel(title: "Categories"), DataModel(title: "Tracks"), DataModel(title: "Release")]
    let picker = UIImagePickerController()
    let picker2 = UIImagePickerController()
    lazy var scrollingView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    lazy var topView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .purple
        view.isUserInteractionEnabled = true
        return view
    }()
    lazy var cameraImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = .camera
        return image
    }()
    lazy var settingsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = .settings
        return image
    }()
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.image = UIImage(named: "one")
        image.layer.cornerRadius = 40
        image.layer.borderWidth = 1
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(didTapped)))
        return image
    }()
    lazy var username: UILabel = {
        let label = UILabel()
        label.text = "Apocalypse"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    lazy var discription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "In the business of creating and curating soundscapes that touch your soul. 🎶✨"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("FOLLOWING", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .medium)
        button.layer.cornerRadius = 15
        return button
    }()
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("MESSAGE", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .medium)
        button.layer.cornerRadius = 15
        return button
    }()
    lazy var miniName: UILabel = {
        let label = UILabel()
        label.text = "Apocalypse"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy var detailView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    lazy var Records: UILabel = {
        let label = UILabel()
        label.text = "RECORDS"
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    lazy var Ratings: UILabel = {
        let label = UILabel()
        label.text = "RATINGS"
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    lazy var Followers: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.text = "FOLLOWERS"
        label.textColor = .lightGray
        return label
    }()
    lazy var FollowersValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "2.8K"
        return label
    }()
    lazy var RatingValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "23.6K"
        return label
    }()
    lazy var RecordValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "234"
        return label
    }()
    lazy var typesOPtion: UICollectionViewFlowLayout = {
        let type = UICollectionViewFlowLayout()
        type.minimumLineSpacing = 10
        type.minimumInteritemSpacing = 10
        type.scrollDirection = .horizontal
        type.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        type.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return type
    }()
    lazy var categoriiesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: typesOPtion)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.backgroundColor = .lightGray
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        collectionView.allowsMultipleSelection = false
        collectionView.tag = 1
        return collectionView
    }()
    lazy var musicCategory: UICollectionViewFlowLayout = {
        let type = UICollectionViewFlowLayout()
        type.minimumLineSpacing = 10
        type.minimumInteritemSpacing = 10
        type.scrollDirection = .horizontal
        type.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        type.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return type
    }()
    lazy var musicCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: musicCategory)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false
        collectionView.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: "MusicCollectionViewCell")
        collectionView.tag = 2
        return collectionView
    }()
    let nameArray: [SectionHeadingModel] = [
    SectionHeadingModel(selected: true, heading: "Top 100"),
    SectionHeadingModel(selected: false, heading: "Categories"),
    SectionHeadingModel(selected: false, heading: "Tracks"),
    SectionHeadingModel(selected: false, heading: "Release")
    ]
    let musictype: [SectionHeadingModel] = [
        SectionHeadingModel(selected: true, heading: "Eminem", viewImage: UIImage(named: "seven")),
        SectionHeadingModel(selected: false, heading: "Linking Park", viewImage: UIImage(named: "six")),
        SectionHeadingModel(selected: false, heading: "blackbear", viewImage: UIImage(named: "three")),
        SectionHeadingModel(selected: false, heading: "Bruno Mars", viewImage: UIImage(named: "five"))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        picker.sourceType = .photoLibrary
        picker.delegate = self
    }
    @objc func didTapped() {
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
                let imageData = image.jpegData(compressionQuality: 0.002)
                guard let unwrppedImageData = imageData else { return }
                profileImage.image = UIImage(data: unwrppedImageData)
                dismiss(animated: true)
        }
    }
}
extension ProfileController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 { return nameArray.count } else { return musictype.count }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.topmusic.text = nameArray[indexPath.row].heading
            cell.selection = nameArray[indexPath.row].selected ?? false
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as! MusicCollectionViewCell
            cell.musicName.text = musictype[indexPath.row].heading
            cell.backgroundImage.image = musictype[indexPath.row].viewImage
            cell.selection = nameArray[indexPath.row].selected ?? false
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nameArray.forEach({ $0.selected = false })
        nameArray[indexPath.row].selected = true
        collectionView.reloadData()
    }
}
class SectionHeadingModel {
    var selected: Bool?
    var heading: String?
    var viewImage: UIImage?
    init(selected: Bool? = nil, heading: String? = nil, viewImage: UIImage? = nil) {
        self.selected = selected
        self.heading = heading
        self.viewImage = viewImage
    }
}
