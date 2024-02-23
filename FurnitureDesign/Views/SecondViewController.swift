//
//  SecondViewController.swift
//  FurnitureDesign
//
//  Created by Zhamilia Zhanakeeva on 23/2/24.
//

import UIKit

class SecondViewController: UIViewController {
    private let goodsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
//    var imageName: String
//    init(imageName: String) {
//        self.imageName = imageName
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(goodsImage)
        NSLayoutConstraint.activate([
            goodsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            goodsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goodsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goodsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
