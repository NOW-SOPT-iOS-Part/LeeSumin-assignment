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
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(10) //dailyMovieData.count
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * movieLineSpacing + movieInset.top + movieInset.bottom
    }
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private func setLayout() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
}


extension DailyMovieView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - movieInset.left - movieInset.right - movieInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return movieLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return movieInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return movieInset
    }
}


