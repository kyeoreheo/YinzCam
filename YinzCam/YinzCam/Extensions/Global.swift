//
//  Global.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit

var ratio: CGFloat = 0
var isBigPhone = false
var topSafeMargin: CGFloat = 0
var phoneWidth: CGFloat = 0

enum TextFieldType {
    case phone
    case address
    case card
    case password
    case email
    case name
}

enum DeliveryStatus: Int {
    case orderReceived
    case shipped
    case delivered
    case pending
    case missing
    case refunded
}

struct Address {
    var street: String
    var city: String
    var state: String
    var zipcode: String
}

struct Card {
    var number: String
    var cvv: String
}

func pxToPoint(_ px: CGFloat) -> CGFloat {
    let ratio = phoneWidth / 320.0
    return px / 2 * ratio
//    if UIDevice.modelName == "iPhone 11 Pro Max" ||
//        UIDevice.modelName == "iPhone 11 Pro" ||
//        UIDevice.modelName == "iPhone X" ||
//        UIDevice.modelName == "iPhone XS" ||
//       UIDevice.modelName == "iPhone XS Max"{
//        return px / 3
//    } else {
//        return px / 2
//    }
}



func removeDuplicates(_ array: [String]) -> [String] {
    var result = [String]()
    var temp = [String]()

    for element in array {
        let url = element.replacingOccurrences(of: "http://", with: "")
                  .replacingOccurrences(of: "https://", with: "")
        if temp.contains(url) == false {
            result.append(element)
            temp.append(url)
        }
    }

    return result
}

func isValidUrl (urlString: String?) -> Bool {
    guard let urlString = urlString,
          let url = URL(string: urlString)
    else { return false }
    
    return UIApplication.shared.canOpenURL(url)
}
