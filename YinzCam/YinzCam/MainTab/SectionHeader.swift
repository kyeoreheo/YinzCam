//
//  SectionHeader.swift
//  YinzCam
//
//  Created by Kyo on 1/16/21.
//
import UIKit

class SectionHeader: UICollectionReusableView {
    var label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(label)
        label.font = .mavenBold(size: 30 * ratio)
        label.textColor = .gray0
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
