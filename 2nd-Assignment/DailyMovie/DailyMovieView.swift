//
//  DailyMovieView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/10/24.
//

import UIKit

class DailyMovieView: UIView {
    final let movieLineSpacing: CGFloat = 10
    final let movieInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let movieInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(10) //dailyMovieData.count
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * movieLineSpacing + movieInset.top + movieInset.bottom
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    private func setLayout() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}



