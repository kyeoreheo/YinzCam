//
//  UIFont+.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit

extension UIFont {
    static func gothicReg(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "LeagueGothic-Regular", size: size)
        else { return UIFont.systemFont(ofSize: size) }
        return font
    }
    
    static func mavenReg(size: CGFloat) -> UIFont {
        guard let font =  UIFont(name: "MavenProRegular", size: size)
        else { return UIFont.systemFont(ofSize: size) }
        return font
    }
    
    static func mavenBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "MavenProBold", size: size)
        else { return UIFont.boldSystemFont(ofSize: size)}
        return font
    }
    
}
