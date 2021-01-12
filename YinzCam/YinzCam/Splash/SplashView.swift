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
    private let label2 = UILabel()
    private let label3 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobalVariables()

        view.backgroundColor = .orange
        print(view.frame.size)
        
        view.addSubview(label)
        label.text = "I love iOS coding <3"
        label.textColor = .white
        label.font = .gothicReg(size: 12)
        label.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
        
        view.addSubview(label2)
        label2.text = "I love iOS coding <3"
        label2.textColor = .white
        label2.font = .mavenReg(size: 12)
        label2.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(label.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        view.addSubview(label3)
        label3.text = "I love iOS coding <3"
        label3.textColor = .white
        label3.font = .mavenBold(size: 12)
        label3.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(label2.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        DispatchQueue.main.async {
            let navigation = UINavigationController(rootViewController: MainTabBar())
            navigation.modalPresentationStyle = .fullScreen
            navigation.navigationBar.isHidden = true
            self.present(navigation, animated: false, completion: nil)
        }
    }
    
    // MARK:- Helpers
    private func applyGlobalVariables() {
        let heightRatio: CGFloat = view.frame.height / 812.0
        ratio = heightRatio < 1 ? 1:heightRatio
        isBigPhone = view.frame.height > 750.0
        topSafeMargin = ( UIApplication.shared.windows.first{$0.isKeyWindow}?.safeAreaInsets.top ?? 0) as CGFloat
    }
}

