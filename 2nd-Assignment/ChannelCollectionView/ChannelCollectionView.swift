//
//  ChannelCollectionView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/28/24.
//

import UIKit

class ChannelCollectionView: UICollectionView{

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = ChannelCollectionView.horizontalFlowLayout()
        super.init(frame: frame, collectionViewLayout: flowLayout)
        self.backgroundColor = .black
        register()
        setDelegate()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register(){
        self.register(
            ChannelCollectionViewCell.self,
            forCellWithReuseIdentifier: ChannelCollectionViewCell.identifier
        )
        self.register(
            SeriesCollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SeriesCollectionHeaderView.identifier
        )
    }
    
    let homeVC = HomeViewController()
    
    private func setDelegate(){
        self.delegate = self
        self.dataSource = self
    }
    
    private var channelData = ChannelModel.channelDummy {
       didSet {
           self.reloadData()
       }
   }
}

extension ChannelCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 166, height: 138)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}

extension ChannelCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(channelData[indexPath.item], indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelData.count
    }
}