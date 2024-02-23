//
//  CustomTableViewCell.swift
//  FurnitureDesign
//
//  Created by Zhamilia Zhanakeeva on 23/2/24.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let goodLabel = MakerView().makerLabel()
    private let goodImage = MakerView().makerImageView(contentMode: .scaleToFill)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo:contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo:contentView.bottomAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 230)
        ])
        bgView.addSubview(goodImage)
        NSLayoutConstraint.activate([
            goodImage.topAnchor.constraint(equalTo: bgView.topAnchor),
            goodImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            goodImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            goodImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        bgView.addSubview(goodLabel)
        NSLayoutConstraint.activate([
            goodLabel.topAnchor.constraint(equalTo:bgView.bottomAnchor, constant: -30),
            goodLabel.leadingAnchor.constraint(equalTo:bgView.leadingAnchor)
        ])
    }
    
    func setData(title: String, image: UIImage?){
        goodLabel.text = title
        goodImage.image = image
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

