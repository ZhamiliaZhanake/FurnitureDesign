//
//  ViewController.swift
//  FurnitureDesign
//
//  Created by Zhamilia Zhanakeeva on 23/2/24.
//

import UIKit

class ShopViewController: UIViewController {
    private let tableView = UITableView()
    private let idCell = "cell"
    private var goods: [Good] = [
        Good(title: "Furniture", price: "$230", image: UIImage(named: "furniture"), details: "First good"),
    Good(title: "Kitchen Ware", price: "$300", image: UIImage(named: "KitchenWare" ), details: "Second good"),
    Good(title: "Reading Table", price: "$500", image: UIImage(named:"readingTable"), details: "Third good")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomtTableViewCell.self, forCellReuseIdentifier: idCell)
    }
}


extension ShopViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        as! CustomtTableViewCell
        cell.setData(title: goods[indexPath.row].title, image: goods[indexPath.row].image)
        
        return cell
        
    }
}
    extension ShopViewController: UITableViewDelegate {  // для нажатия на ячейку
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let vc = SecondViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

