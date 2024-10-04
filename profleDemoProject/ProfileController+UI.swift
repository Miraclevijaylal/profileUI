//
//  ProfileController+UI.swift
//  profleDemoProject
//
//  Created by Vijay Lal on 06/09/24.
//

import Foundation
import UIKit
extension ProfileController {
    func initViews() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(scrollingView)
        scrollingView.translatesAutoresizingMaskIntoConstraints = false
        [scrollingView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
         scrollingView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
         scrollingView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
         scrollingView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        scrollingView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        [topView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
         topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
         topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
         topView.heightAnchor.constraint(equalToConstant: 190),
//         topView.widthAnchor.constraint(equalToConstant: 200)
        ].forEach({ $0.isActive = true })
        topView.addSubview(miniName)
        miniName.translatesAutoresizingMaskIntoConstraints = false
        [miniName.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
         miniName.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0),
         miniName.widthAnchor.constraint(equalToConstant: 70)
        ].forEach({ $0.isActive = true })
        topView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        [profileImage.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40),
         profileImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0),
         profileImage.heightAnchor.constraint(equalToConstant: 80),
         profileImage.widthAnchor.constraint(equalToConstant: 80)
        ].forEach({ $0.isActive = true })
        view.addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        [username.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
         username.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        view.addSubview(discription)
        discription.translatesAutoresizingMaskIntoConstraints = false
        [discription.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 8),
         discription.centerXAnchor.constraint(equalTo: username.centerXAnchor, constant: 0),
         discription.leadingAnchor.constraint(equalTo: scrollingView.leadingAnchor, constant: 30),
         discription.trailingAnchor.constraint(equalTo: scrollingView.trailingAnchor, constant: -30)
        ].forEach({ $0.isActive = true })
        view.addSubview(followButton)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        [followButton.topAnchor.constraint(equalTo: discription.bottomAnchor, constant: 10),
         followButton.centerXAnchor.constraint(equalTo: scrollingView.centerXAnchor, constant: -80),
         followButton.widthAnchor.constraint(equalToConstant: 130),
         followButton.heightAnchor.constraint(equalToConstant: 30)
        ].forEach({ $0.isActive = true })
        view.addSubview(messageButton)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        [messageButton.topAnchor.constraint(equalTo: discription.bottomAnchor, constant: 10),
         messageButton.centerXAnchor.constraint(equalTo: scrollingView.centerXAnchor, constant: 80),
         messageButton.widthAnchor.constraint(equalToConstant: 130),
         messageButton.heightAnchor.constraint(equalToConstant: 30)
        ].forEach({ $0.isActive = true })
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        [detailView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 20),
         detailView.leadingAnchor.constraint(equalTo: scrollingView.leadingAnchor, constant: 0),
         detailView.trailingAnchor.constraint(equalTo: scrollingView.trailingAnchor, constant: 0),
         detailView.heightAnchor.constraint(equalToConstant: 60)
        ].forEach({ $0.isActive = true })
        detailView.addSubview(RatingValue)
        RatingValue.translatesAutoresizingMaskIntoConstraints = false
        [RatingValue.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10),
         RatingValue.centerXAnchor.constraint(equalTo: detailView.centerXAnchor, constant: 0),
         RatingValue.heightAnchor.constraint(equalToConstant: 20)
        ].forEach({ $0.isActive = true })
        detailView.addSubview(Ratings)
        Ratings.translatesAutoresizingMaskIntoConstraints = false
        [Ratings.topAnchor.constraint(equalTo: RatingValue.bottomAnchor, constant: 5),
         Ratings.centerXAnchor.constraint(equalTo: detailView.centerXAnchor, constant: 0),
         Ratings.heightAnchor.constraint(equalToConstant: 20)
        ].forEach({ $0.isActive = true })
        detailView.addSubview(FollowersValue)
        FollowersValue.translatesAutoresizingMaskIntoConstraints = false
        [FollowersValue.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10),
         FollowersValue.centerXAnchor.constraint(equalTo: RatingValue.centerXAnchor, constant: 100),
         FollowersValue.heightAnchor.constraint(equalToConstant: 20)
        ].forEach({ $0.isActive = true })
        detailView.addSubview(Followers)
        Followers.translatesAutoresizingMaskIntoConstraints = false
        [Followers.topAnchor.constraint(equalTo: FollowersValue.bottomAnchor, constant: 5),
         Followers.centerXAnchor.constraint(equalTo: Ratings.centerXAnchor, constant: 100),
         Followers.heightAnchor.constraint(equalToConstant: 20)
        ].forEach({ $0.isActive = true })
        detailView.addSubview(RecordValue)
        RecordValue.translatesAutoresizingMaskIntoConstraints = false
        [RecordValue.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10),
         RecordValue.centerXAnchor.constraint(equalTo: RatingValue.centerXAnchor, constant: -100),
         RecordValue.heightAnchor.constraint(equalToConstant: 20)
        ].forEach( {$0.isActive = true })
        detailView.addSubview(Records)
        Records.translatesAutoresizingMaskIntoConstraints = false
        [Records.topAnchor.constraint(equalTo: RecordValue.bottomAnchor, constant: 5),
         Records.centerXAnchor.constraint(equalTo: Ratings.centerXAnchor, constant: -100),
         Records.heightAnchor.constraint(equalToConstant: 20)
        ].forEach({ $0.isActive = true })
        view.addSubview(categoriiesCollectionView)
        categoriiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [categoriiesCollectionView.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 10),
         categoriiesCollectionView.leadingAnchor.constraint(equalTo: scrollingView.leadingAnchor, constant: 10),
         categoriiesCollectionView.trailingAnchor.constraint(equalTo: scrollingView.trailingAnchor, constant: -10),
         categoriiesCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ].forEach({ $0.isActive = true })
        view.addSubview(musicCollectionView)
        musicCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [musicCollectionView.topAnchor.constraint(equalTo: categoriiesCollectionView.bottomAnchor, constant:0),
         musicCollectionView.leadingAnchor.constraint(equalTo: scrollingView.leadingAnchor, constant: 0),
         musicCollectionView.trailingAnchor.constraint(equalTo: scrollingView.trailingAnchor, constant: 0),
         musicCollectionView.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor, constant: 0),
         musicCollectionView.heightAnchor.constraint(equalToConstant: 270)
        ].forEach({ $0.isActive = true })
        topView.addSubview(cameraImage)
        cameraImage.translatesAutoresizingMaskIntoConstraints = false
        [cameraImage.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
         cameraImage.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
         cameraImage.heightAnchor.constraint(equalToConstant: 25),
         cameraImage.widthAnchor.constraint(equalToConstant: 25)
        ].forEach({ $0.isActive = true })
        topView.addSubview(settingsImage)
        settingsImage.translatesAutoresizingMaskIntoConstraints = false
        [settingsImage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
//         settingsImage.centerXAnchor.constraint(equalTo: miniName.centerXAnchor, constant: 165),
         settingsImage.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
         settingsImage.heightAnchor.constraint(equalToConstant: 20),
         settingsImage.widthAnchor.constraint(equalToConstant: 20)
        ].forEach({ $0.isActive = true })
    }
}
