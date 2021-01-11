//
//  ViewController.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit
import SnapKit

class SplashView: UIViewController {
    private let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        print(view.frame.size)
        
        view.addSubview(label)
        label.text = "HI"
        label.textColor = .white
        label.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.center.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }
}

