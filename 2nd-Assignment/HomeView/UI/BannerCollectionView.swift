//
//  BannerCollectionView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/28/24.
//

import UIKit

class BannerCollectionView: UICollectionView{
    private var viewModel : HomeViewModel!
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        let flowLayout = BannerCollectionView.horizontalFlowLayout()
        super.init(frame: frame, collectionViewLayout: flowLayout)
        self.backgroundColor = .black
        register()
        setDelegate()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register(){
        self.register(
            BannerCollectionViewCell.self,
            forCellWithReuseIdentifier: BannerCollectionViewCell.identifier
        )
    }
    
    private func setDelegate(){
        self.delegate = self
        self.dataSource = self
    }
    
    private var bannerData = HomeViewModel().bannerDummy {
       didSet {
           self.reloadData()
       }
   }
}

extension BannerCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 186, height: 58)
    }
}

extension BannerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(bannerData[indexPath.item], indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerData.count
    }
}
