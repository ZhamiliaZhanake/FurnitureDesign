//
//  Makerview.swift
//  FurnitureDesign
//
//  Created by Zhamilia Zhanakeeva on 23/2/24.
//

import UIKit
class MakerView {
    func makerLabel(
        text: String = "",
        size: CGFloat = 20,
        weight: UIFont.Weight = .medium,
        textColor: UIColor = .black,
        backgroundColor: UIColor = .clear,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 0,
        lineBreakMode: NSLineBreakMode = .byWordWrapping,
        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    func makerTextField(
        textColor: UIColor = .black,
        cornerRadius: CGFloat = 0.0,
        placeholder: String = "",
        backgroundColor: UIColor = .clear,
        borderStyle: UITextField.BorderStyle = .none,
        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UITextField {
        let tf = UITextField()
        tf.layer.cornerRadius = cornerRadius
        tf.placeholder = placeholder
        tf.textColor = textColor
        tf.backgroundColor = backgroundColor
        tf.borderStyle = borderStyle
        tf.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.gray
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: tf.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: tf.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: tf.bottomAnchor)
        ])
        return tf
    }
    
        func makerButton(
            title: String = "",
            titleColor: UIColor = .white,
            backgroundColor: UIColor = .systemGray5,
            cornerRadius: CGFloat = 18,
            image: UIImage?,
            tintColor: UIColor = .black,
            translatesAutoresizingMaskIntoConstraints: Bool = false
            
        ) -> UIButton {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(titleColor, for: .normal)
            button.backgroundColor = backgroundColor
            button.layer.cornerRadius = cornerRadius
            button.setImage(image, for: .normal)
            button.tintColor = tintColor
            button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
            return button
        }
    
    func makerStack(
        axis: NSLayoutConstraint.Axis = .horizontal,
        distribution: UIStackView.Distribution = .fillEqually,
        translatesAutoresizingMaskIntoConstraints: Bool = false,
        backgroundColor: UIColor = .clear
    ) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.backgroundColor = backgroundColor
        stack.distribution = distribution
        stack.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return stack
    }
    func makerImageView(
            image: UIImage? = nil,
            contentMode: UIView.ContentMode = .scaleAspectFill,
            translatesAutoresizingMaskIntoConstraints: Bool = false
        ) -> UIImageView {
            let imageView = UIImageView()
            imageView.image = image
            imageView.contentMode = contentMode
            imageView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
            return imageView
        }
    }
    
