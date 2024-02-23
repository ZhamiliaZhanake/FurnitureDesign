//
//  SecondViewController.swift
//  FurnitureDesign
//
//  Created by Zhamilia Zhanakeeva on 23/2/24.
//

import UIKit
class SecondViewController: UIViewController {
    private let goodsImage = MakerView().makerImageView()
    private let sendButton = MakerView().makerButton(image: UIImage(systemName: "square.and.arrow.up"))
    private let favouriteButton = MakerView().makerButton(image: UIImage(systemName: "heart"))
    private let goodLabel = MakerView().makerLabel()
    private let starStack = MakerView().makerStack()
    private let goodPrice = MakerView().makerLabel()
    private let countStack = MakerView().makerStack()
    private let minusButton = MakerView().makerButton(image: UIImage(systemName: "minus"))
    private let plusButton = MakerView().makerButton(image: UIImage(systemName: "plus"))
    private let quantityLabel = MakerView().makerLabel(text: "1",textAlignment: .center)
    private let detailsLabel = MakerView().makerLabel(numberOfLines: 0)
    private let buyButton = MakerView().makerButton(title: "Buy",backgroundColor: .systemBlue,cornerRadius: 10, image: UIImage(named: ""))
    private func createStarImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    var image: UIImage
    var labelText: String
    var rating: Int
    var priceLabel: String
    var details: GoodDetails
    var quantity: Int = 1
    
    init(image: UIImage, labelText: String, rating: Int, priceLabel: String, details: GoodDetails) {
        self.image = image
        self.labelText = labelText
        self.rating = rating
        self.priceLabel = priceLabel
        self.details = details
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let favouriteButton = favouriteButton
        favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(goodsImage)
        NSLayoutConstraint.activate([
            goodsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            goodsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goodsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goodsImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(favouriteButton)
        NSLayoutConstraint.activate([
            favouriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            favouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favouriteButton.heightAnchor.constraint(equalToConstant: 40),
            favouriteButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        view.addSubview(goodLabel)
        NSLayoutConstraint.activate([
            goodLabel.topAnchor.constraint(equalTo: goodsImage.bottomAnchor, constant: 20),
            goodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(starStack)
        NSLayoutConstraint.activate([
            starStack.topAnchor.constraint(equalTo: goodLabel.bottomAnchor, constant: 5),
            starStack.widthAnchor.constraint(equalToConstant: 100),
            starStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(goodPrice)
        NSLayoutConstraint.activate([
            goodPrice.topAnchor.constraint(equalTo: starStack.bottomAnchor, constant: 30),
            goodPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(countStack)
        NSLayoutConstraint.activate([
            countStack.topAnchor.constraint(equalTo: starStack.bottomAnchor, constant: 20),
            countStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countStack.widthAnchor.constraint(equalToConstant: 120),
            countStack.heightAnchor.constraint(equalToConstant: 40)
        ])
        countStack.addArrangedSubview(minusButton)
        countStack.addArrangedSubview(quantityLabel)
        countStack.addArrangedSubview(plusButton)
        
        
        view.addSubview(detailsLabel)
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: goodPrice.bottomAnchor, constant: 30),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        view.addSubview(buyButton)
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buyButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        goodPrice.text = priceLabel
        let detailsText = "Room Type: \(details.roomType)\nColor: \(details.color)\nWeight: \(details.weight)"
        detailsLabel.text = detailsText
        
        for _ in 0..<rating {
            let starImageView = createStarImageView()
            starStack.addArrangedSubview(starImageView)
        }
        goodsImage.image = image
        goodLabel.text = labelText
    }
    @objc func favouriteButtonTapped() {
        if favouriteButton.currentImage == UIImage(systemName: "heart.fill") {
            favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favouriteButton.tintColor = .black
        } else {
            favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favouriteButton.tintColor = .red
        }
    }
    @objc private func minusButtonTapped() {
        quantity = max(1, quantity - 1)
        quantityLabel.text = "\(quantity)"
    }
    
    @objc private func plusButtonTapped() {
        quantity += 1
        quantityLabel.text = "\(quantity)"
    }
    
}
