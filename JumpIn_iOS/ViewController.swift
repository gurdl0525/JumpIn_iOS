//
//  ViewController.swift
//  JumpIn_iOS
//
//  Created by 이강혁 on 2023/03/17.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var abutton = UIButton().then {
        $0.backgroundColor = .red
    }
    
    var a: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(abutton)
        view.backgroundColor = .systemBackground
        
        abutton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(50.0)
            $0.width.equalTo(100)
        }
        
        abutton.layer.cornerRadius = 10.0
    }

}

