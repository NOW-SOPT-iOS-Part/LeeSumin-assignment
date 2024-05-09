//
//  PosterCollectionView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

class PosterCollectionView: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = PosterCollectionView.horizontalFlowLayout()
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
    
    private var posterData = PosterModel.posterDummy {
       didSet {
           self.reloadData()
       }
   } //didSet??
    
    private var posterCircleView = PosterCircleView()
    //이 view를 재로딩해서 다시 그려야 하는데 그게 맞나?! 방법을 생각해야 됨
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
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

extension PosterCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(posterData[indexPath.item], indexPath.item)
        posterCircleView.selectCircle(indexPath.item+1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterData.count
    }
}
