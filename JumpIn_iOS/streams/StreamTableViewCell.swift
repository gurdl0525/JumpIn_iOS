//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by 박준하 on 2023/03/15.
//
import Foundation
import UIKit
import SnapKit
import Then

final class StreamTableViewCell: UITableViewCell {
    
    static let identity = "StreamTableViewCell"
    
    private let backView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private lazy var postImageView = UIImageView().then {
        $0.backgroundColor = .tertiaryLabel
    }
    
    private let channelImgView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.layer.cornerRadius = 25.0
    }
    
    private lazy var userImageBtn = UIButton().then {
        $0.tintColor = .clear
    }
    
    private lazy var ellipsisButton = UIButton().then {
        $0.setBackgroundImage(
            UIImage(named: "ellipsisLength"),
            for: UIControl.State.normal
        )
    }
    
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 17.0, weight: .regular)
        $0.text = "나 도원준은 3학년 4반 아이돌"
        $0.numberOfLines = 2
    }
    
    private lazy var contensLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 15.0, weight: .medium)
        $0.numberOfLines = 1
        $0.text = "도원준 • 조회수 450만회 • 3일전"
    }

    func addView() {
        addSubview(backView)
        userImageBtn.addSubview(channelImgView)
        [
            postImageView,
            userImageBtn,
            ellipsisButton,
            titleLabel,
            contensLabel,
        ].forEach {
            backView.addSubview($0)
        }
    }
    
    func setLayout() {
        backView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        postImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(240.0)
        }
        userImageBtn.snp.makeConstraints {
            $0.width.height.equalTo(50.0)
            $0.top.equalTo(postImageView.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().offset(15.0)
        }
        channelImgView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(userImageBtn.snp.top)
            $0.trailing.equalTo(ellipsisButton.snp.leading)
            $0.leading.equalTo(userImageBtn.snp.trailing).offset(15.0)
        }
        contensLabel.snp.makeConstraints {
            $0.leading.equalTo(userImageBtn.snp.trailing).offset(15.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            $0.bottom.equalToSuperview().inset(18.0)
            $0.trailing.equalTo(ellipsisButton.snp.leading)
        }
        ellipsisButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(userImageBtn.snp.top).offset(5.0)
            $0.width.equalTo(15.0)
            $0.height.equalTo(15.0)
        }
    }
}
