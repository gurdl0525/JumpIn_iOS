//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by 박준하 on 2023/03/15.
//

import UIKit
import SnapKit
import Then

final class StreamTableViewCell: UITableViewCell {
    
    static let identity = "StreamTableViewCell"
    
    private lazy var postImageView = UIImageView().then {
        $0.backgroundColor = .tertiaryLabel
    }
    
    private lazy var userImage = UIView().then {
        $0.backgroundColor = .tertiaryLabel
        $0.layer.cornerRadius = 25.0
    }
    
    private lazy var bookmarkButton = UIButton().then {
        
        $0.setBackgroundImage(
            UIImage(named: "EllipsisLength"),
            for: UIControl.State.normal
        )
    }
    
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 17.0, weight: .regular)
        $0.text = "나는 사실 조씨다."
        $0.numberOfLines = 2
    }
    
    private lazy var contensLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 15.0, weight: .medium)
        $0.numberOfLines = 1
        $0.text = "도원준 • 조회수 450만회 • 3일전"
    }

    
    func setup() {
        [
            postImageView,
            userImage,
            bookmarkButton,
            titleLabel,
            contensLabel,
        ].forEach { addSubview($0) }
        
        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(200.0)
            $0.width.equalToSuperview()
        }
        
        userImage.snp.makeConstraints {
            $0.width.height.equalTo(50.0)
            $0.top.equalTo(postImageView.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().offset(10.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.top)
            $0.trailing.equalTo(bookmarkButton.snp.leading)
            $0.leading.equalTo(userImage.snp.trailing).offset(15.0)
        }

        contensLabel.snp.makeConstraints {
            $0.leading.equalTo(userImage.snp.trailing).offset(15.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            $0.bottom.equalToSuperview().inset(18.0)
            $0.trailing.equalTo(bookmarkButton.snp.leading)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(userImage.snp.top).offset(5.0)
            $0.width.equalTo(15.0)
            $0.height.equalTo(15.0)
        }
    }
}
