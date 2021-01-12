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
        leftTeamLabel.font = .gothicReg(size: pxToPoint(40))
        leftTeamLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(pxToPoint(28))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.width.equalTo(pxToPoint(300))
            make.height.equalTo(pxToPoint(44))
        }
        
        addSubview(rightTeamLabel)
        rightTeamLabel.text = "JETS"
        rightTeamLabel.textAlignment = .right
        rightTeamLabel.font = .gothicReg(size: pxToPoint(40))
        rightTeamLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(pxToPoint(28))
            make.right.equalToSuperview().offset(pxToPoint(-20))
            make.width.equalTo(pxToPoint(300))
            make.height.equalTo(pxToPoint(44))
        }
        
        addSubview(leftScoreLabel)
        leftScoreLabel.text = "17"
        leftScoreLabel.textAlignment = .left
        leftScoreLabel.font = .gothicReg(size: pxToPoint(60))
        leftScoreLabel.backgroundColor = .orange
        leftScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(leftTeamLabel.snp.bottom).offset(pxToPoint(12))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.width.equalTo(pxToPoint(184))
            make.height.equalTo(pxToPoint(72))
        }
        
        addSubview(rightScoreLabel)
        rightScoreLabel.text = "18"
        rightScoreLabel.backgroundColor = .orange
        rightScoreLabel.textAlignment = .right
        rightScoreLabel.font = .gothicReg(size: pxToPoint(60))
        rightScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(rightTeamLabel.snp.bottom).offset(pxToPoint(12))
            make.right.equalToSuperview().offset(pxToPoint(-20))
            make.width.equalTo(pxToPoint(184))
            make.height.equalTo(pxToPoint(72))
        }
        
        addSubview(leftLogo)
        leftLogo.backgroundColor = .red
        leftLogo.snp.makeConstraints { make in
            make.width.height.equalTo(pxToPoint(80))
            make.centerY.equalTo(leftScoreLabel)
            make.left.equalTo(leftScoreLabel.snp.right)
        }
        
        addSubview(rightLogo)
        rightLogo.backgroundColor = .blue
        rightLogo.snp.makeConstraints { make in
            make.width.height.equalTo(pxToPoint(80))
            make.centerY.equalTo(leftScoreLabel)
            make.right.equalTo(rightScoreLabel.snp.left)
        }
        
        addSubview(dateLabel)
        dateLabel.text = "Sun, Sep 8"
        dateLabel.font = UIFont.mavenReg(size: pxToPoint(28))
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(rightScoreLabel.snp.bottom).offset(pxToPoint(15))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.height.equalTo(pxToPoint(39))
            make.width.equalTo(pxToPoint(184))
        }
        
        addSubview(weekLabel)
        weekLabel.text = "WEEK 1"
        weekLabel.font = UIFont.mavenReg(size: pxToPoint(28))
        weekLabel.textColor = .gray0
        weekLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(dateLabel.snp.centerY)
        }
        
        addSubview(gameStateLabel)
        gameStateLabel.text = "FINAL"
        gameStateLabel.font = UIFont.mavenReg(size: pxToPoint(28))
        gameStateLabel.textAlignment = .right
        gameStateLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(pxToPoint(-20))
            make.centerY.equalTo(dateLabel.snp.centerY)
        }
    }
    
    public func applyData() {
        
    }
    
}
