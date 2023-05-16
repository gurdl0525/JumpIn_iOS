//
//  UIButton.swift
//  JumpIn_iOS
//
//  Created by 이강혁 on 2023/05/10.
//

import UIKit

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
