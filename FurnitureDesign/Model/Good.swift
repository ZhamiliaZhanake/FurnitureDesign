//
//  Good.swift
//  FurnitureDesign
//
//  Created by Zhamilia Zhanakeeva on 23/2/24.
//

import Foundation
import UIKit
struct GoodDetails {
    var roomType: String
    var color: String
    var weight: String
}

struct Good {
    var title: String
    var price: String
    var image: UIImage?
    var details: GoodDetails
    var rating: Int
}
