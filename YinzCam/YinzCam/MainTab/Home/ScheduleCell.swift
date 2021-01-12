//
//  ScheduleCell.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit

class ScheduleCell: UICollectionViewCell {
    private let leftTeamLabel = UILabel()
    private let leftScoreLabel = UILabel()
    private let leftLogo = UIImageView()
    
    private let rightTeamLabel = UILabel()
    private let rightScoreLabel = UILabel()
    private let rightLogo = UIImageView()
    
    private let middlePoint = UILabel()
    private let dateLabel = UILabel()
    private let weekLabel = UILabel()
    private let gameStateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(leftTeamLabel)
        leftTeamLabel.text = "BUCCANEERS"
        leftTeamLabel.textAlignment = .left
        leftTeamLabel.font = .gothicReg(size: 40 * ratio)
        leftTeamLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28 * ratio)
            make.left.equalToSuperview().offset(20 * ratio)
            make.width.equalTo(300 * ratio)
            make.height.equalTo(44 * ratio)
        }
        
        addSubview(rightTeamLabel)
        rightTeamLabel.text = "JETS"
        rightTeamLabel.textAlignment = .right
        rightTeamLabel.font = .gothicReg(size: 40 * ratio)
        rightTeamLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28 * ratio)
            make.right.equalToSuperview().offset(-20 * ratio)
            make.width.equalTo(300 * ratio)
            make.height.equalTo(44 * ratio)
        }
        
        addSubview(leftScoreLabel)
        leftScoreLabel.text = "17"
        leftScoreLabel.textAlignment = .left
        leftScoreLabel.font = .gothicReg(size: 60 * ratio)
        leftScoreLabel.backgroundColor = .orange
        leftScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(leftTeamLabel.snp.bottom).offset(12 * ratio)
            make.left.equalToSuperview().offset(20 * ratio)
            make.width.equalTo(184 * ratio)
            make.height.equalTo(72 * ratio)
        }
        
        addSubview(rightScoreLabel)
        rightScoreLabel.text = "18"
        rightScoreLabel.textAlignment = .right
        rightScoreLabel.font = .gothicReg(size: 60 * ratio)
        rightScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(rightTeamLabel.snp.bottom).offset(12 * ratio)
            make.right.equalToSuperview().offset(-20 * ratio)
            make.width.equalTo(184 * ratio)
            make.height.equalTo(72 * ratio)
        }
        
        
        addSubview(leftLogo)
        leftLogo.backgroundColor = .red
        leftLogo.snp.makeConstraints { make in
            make.width.height.equalTo(80 * ratio)
            make.centerY.equalTo(leftScoreLabel)
            make.left.equalTo(leftScoreLabel.snp.right)
        }
        
        addSubview(rightLogo)
        rightLogo.backgroundColor = .blue
        rightLogo.snp.makeConstraints { make in
            make.width.height.equalTo(80 * ratio)
            make.centerY.equalTo(leftScoreLabel)
            make.right.equalTo(rightScoreLabel.snp.left)
        }
    }
}
