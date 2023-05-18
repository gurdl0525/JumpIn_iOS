//
//  StreamViewController.swift
//  JumpIn_iOS
//
//  Created by 이강혁 on 2023/05/16.
//

import UIKit
import SnapKit
import Then

class StreamViewController: UIViewController {
    
    private lazy var tableView = UITableView().then {
        $0.backgroundColor = .systemBackground
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        $0.register(StreamTableViewCell.self, forCellReuseIdentifier: StreamTableViewCell.identity)
        $0.rowHeight = 325.0
    }
    
    private lazy var imagePickerController = UIImagePickerController().then {
        $0.sourceType = .photoLibrary
        $0.allowsEditing = true
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTableView()
    }
}

extension StreamViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        var selectImage: UIImage? = nil
//
//        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            selectImage = editedImage
//        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            selectImage = originalImage
//        }
        
        picker.dismiss(animated: true) { [weak self] in
            let playVideoViewController = PlayVideoViewController()
            let navigationController = UINavigationController(rootViewController: playVideoViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
            
        }
    }
}

extension StreamViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StreamTableViewCell.identity, for: indexPath) as? StreamTableViewCell
        
        cell?.selectionStyle = .none
        cell?.addView()
        cell?.setLayout()
        
        return cell ?? UITableViewCell()
    }
    
}

extension StreamViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("영상 클릭")
    }
}

private extension StreamViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "YouTube"
        
//        let logoButton = UIBarButtonItem(customView:
//            UIImageView().then {
//            $0.image = UIImage(named: "logo")
//            }
//        )
        
        let notificationButton = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton)
        )
        
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton)
        )
        
//        let profileButton = UIBarButtonItem(
//            image: UIImage(named: "profile"),
//            style: .plain,
//            target: self,
//            action: #selector(didTapUploadButton)
//        )
        
//        navigationItem.leftBarButtonItem = logoButton
        navigationItem.rightBarButtonItems = [searchButton, notificationButton]
        
    }
    
    @objc func didTapUploadButton() {
        present(imagePickerController, animated: true)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
