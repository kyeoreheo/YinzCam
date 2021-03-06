//
//  ScheduleCell.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit
import SDWebImage

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
    
    private let tvLabel = UILabel()
    
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
        leftTeamLabel.text = "-"
        leftTeamLabel.textAlignment = .left
        leftTeamLabel.font = .gothicReg(size: pxToPoint(40))
        leftTeamLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(pxToPoint(28))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.width.equalTo(pxToPoint(300))
            make.height.equalTo(pxToPoint(44))
        }
        
        addSubview(rightTeamLabel)
        rightTeamLabel.text = "-"
        rightTeamLabel.textAlignment = .right
        rightTeamLabel.font = .gothicReg(size: pxToPoint(40))
        rightTeamLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(pxToPoint(28))
            make.right.equalToSuperview().offset(pxToPoint(-20))
            make.width.equalTo(pxToPoint(300))
            make.height.equalTo(pxToPoint(44))
        }
        
        addSubview(leftScoreLabel)
        leftScoreLabel.text = "0"
        leftScoreLabel.textAlignment = .left
        leftScoreLabel.font = .gothicReg(size: pxToPoint(60))
        leftScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(leftTeamLabel.snp.bottom).offset(pxToPoint(12))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.width.equalTo(pxToPoint(184))
            make.height.equalTo(pxToPoint(72))
        }
        
        addSubview(rightScoreLabel)
        rightScoreLabel.text = "0"
        rightScoreLabel.textAlignment = .right
        rightScoreLabel.font = .gothicReg(size: pxToPoint(60))
        rightScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(rightTeamLabel.snp.bottom).offset(pxToPoint(12))
            make.right.equalToSuperview().offset(pxToPoint(-20))
            make.width.equalTo(pxToPoint(184))
            make.height.equalTo(pxToPoint(72))
        }
        
        addSubview(leftLogo)
        leftLogo.snp.makeConstraints { make in
            make.width.height.equalTo(pxToPoint(80))
            make.centerY.equalTo(leftScoreLabel)
            make.left.equalTo(leftScoreLabel.snp.right)
        }
        
        addSubview(rightLogo)
        rightLogo.snp.makeConstraints { make in
            make.width.height.equalTo(pxToPoint(80))
            make.centerY.equalTo(leftScoreLabel)
            make.right.equalTo(rightScoreLabel.snp.left)
        }
        
        addSubview(dateLabel)
        dateLabel.text = "-"
        dateLabel.font = UIFont.mavenReg(size: pxToPoint(28))
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(rightScoreLabel.snp.bottom).offset(pxToPoint(15))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.height.equalTo(pxToPoint(39))
            make.width.equalTo(pxToPoint(184))
        }
        
        addSubview(weekLabel)
        weekLabel.text = "Week -"
        weekLabel.font = UIFont.mavenReg(size: pxToPoint(28))
        weekLabel.textColor = .gray0
        weekLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(dateLabel.snp.centerY)
        }
        
        addSubview(gameStateLabel)
        gameStateLabel.text = "-"
        gameStateLabel.font = UIFont.mavenReg(size: pxToPoint(28))
        gameStateLabel.textAlignment = .right
        gameStateLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(pxToPoint(-20))
            make.centerY.equalTo(dateLabel.snp.centerY)
        }
        
        addSubview(tvLabel)
        tvLabel.isHidden = true
        tvLabel.text = ""
        tvLabel.textAlignment = .left
        tvLabel.font = .mavenReg(size: pxToPoint(28))
        tvLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(pxToPoint(30))
            make.left.equalToSuperview().offset(pxToPoint(20))
            make.width.equalTo(pxToPoint(184))
            make.height.equalTo(pxToPoint(40))
        }
    }
    
    public func applyData(teamInfo: API.Team?, game: API.Game?) {
        guard let teamInfo = teamInfo,
              let teamTriCode = teamInfo.triCode,
              let teamLogoURL = API.logoImageURL(of: teamTriCode),
              let opponent = game?.opponent,
              let opponentTriCode = game?.opponent?.triCode,
              let opponentLogoURL = API.logoImageURL(of: opponentTriCode),
              let record = opponent.record,
              let date = game?.date?.numeric,
              let week = game?.week,
              let gameState = game?.gameState
        else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let tempDate = dateFormatter.date(from: date) {
            let weekDay = Calendar.current.component(.weekday, from: tempDate)
            let month = Calendar.current.component(.month, from: tempDate)
            let day = Calendar.current.component(.day, from: tempDate)
            dateLabel.text = weekday(of: weekDay) + ", " + triMonth(of: month) + " " + String(day)
        }

        leftTeamLabel.text = teamInfo.name
        rightTeamLabel.text = opponent.name
        leftScoreLabel.text = record.stringBefore("-")
        rightScoreLabel.text = record.stringAfter("-")
        weekLabel.text = week
        gameStateLabel.text = gameState
        leftLogo.sd_setImage(with: teamLogoURL, placeholderImage: UIImage(named: "placeholder"))
        rightLogo.sd_setImage(with: opponentLogoURL,placeholderImage: UIImage(named: "placeholder"))
        if game?.tv != "" {
            tvLabel.isHidden = false
            tvLabel.text = game?.tv
        }
    }
    
}
