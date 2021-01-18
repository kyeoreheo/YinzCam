//
//  SchedulesCVC.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit

protocol SchedulesCVCDelegate: class {
    func cellTapped(index: Int)
}

class SchedulesCVC: UICollectionViewController {
    private let reuseIdentifier = "scheduleCell"
    private let reuseHeaderIdentifier = "sectionHeader"
    private var schedules = ""
    
    public var delegate: SchedulesCVCDelegate?
    public var teamInfo: API.Team?
    public var gameSection = [API.GameSection]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewLayout()) {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .vertical
        myLayout.minimumLineSpacing = 16
        super.init(collectionViewLayout: myLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configure()
    }
    
    private func configure() {
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
    }
}

extension SchedulesCVC: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerText = gameSection[indexPath.section].heading
        else { return UICollectionReusableView() }
        
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as! SectionHeader
             sectionHeader.label.text = headerText
             return sectionHeader
        } else {
             return UICollectionReusableView()
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70 * ratio)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return gameSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if gameSection[indexPath.section].games?[indexPath.row].tv != "" {
            return CGSize(width: view.frame.width, height: pxToPoint(240 + 70))
        } else {
            return CGSize(width: view.frame.width, height: pxToPoint(240))
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameSection[section].games?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScheduleCell
        cell.applyData(teamInfo: teamInfo, game: gameSection[indexPath.section].games?[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellTapped(index: indexPath.row)
    }
    
}
