//
//  PosterCollectionView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

class PosterCollectionView: UICollectionView{

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: flowLayout)
        register()
        setDelegate()
        isPagingEnabled = true //한 cell씩만 보여줌 (셀 중간에 멈추지 x)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register(){
        self.register(
            PosterCollectionViewCell.self,
            forCellWithReuseIdentifier: PosterCollectionViewCell.identifier
        )
    }
    
    let homeVC = HomeViewController()
    
    private func setDelegate(){
        self.delegate = self
        self.dataSource = self
    }
    
    private var posterData = PosterModel.posterDummy() {
       didSet {
           self.reloadData()
       }
   }
}

extension PosterCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - safeAreaInsets.left - safeAreaInsets.right, height: UIScreen.main.bounds.width*1.425)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        // - safeAreaInsets.top 추가해줘야 위쪽 safeArea 커버
    }
    
}

extension PosterCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(posterData[indexPath.item], indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterData.count
    }
}
