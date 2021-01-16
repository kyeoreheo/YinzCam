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
}

func weekday(of num: Int) -> String {
    switch num {
        case 1:
            return "Sun"
        case 2:
            return "Mon"
        case 3:
            return "Tue"
        case 4:
            return "Wed"
        case 5:
            return "Thu"
        case 6:
            return "Fri"
        case 7:
            return "Sat"
        default:
            return ""
    }
}

func triMonth(of month: Int) -> String {
    switch month {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sep"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return ""
    }
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
