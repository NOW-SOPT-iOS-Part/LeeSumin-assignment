//
//  DailyMovieViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import UIKit

import Moya

class DailyMovieViewController: UIViewController, UICollectionViewDelegate {

    private let rootView: DailyMovieView
    private let viewModel: DailyMovieViewModel
    private var collectionView: UICollectionView
    
    private var dailyMovieInfo: [DailyMovieInfo] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setCollectionView()
        dailyMovieInfo = viewModel.dailyMovieInfo.value!
        viewModel.dailyMovieInfo.bind { [weak self] movies in
            self?.handleDailyMovieInfo(dailyMovieInfo: movies)
        }
    }
    
    init(rootView: DailyMovieView, viewModel: DailyMovieViewModel) {
          self.rootView = rootView
          self.viewModel = viewModel
          self.collectionView = rootView.collectionView
          super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    func setCollectionView() {
        collectionView = rootView.collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(
            DailyMovieCollectionViewCell.self,
            forCellWithReuseIdentifier: DailyMovieCollectionViewCell.identifier
        )
    }
    
    func handleDailyMovieInfo(dailyMovieInfo: [DailyMovieInfo]!) {
        self.dailyMovieInfo = dailyMovieInfo
        collectionView.reloadData()
    }
}

extension DailyMovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - rootView.movieInset.left - rootView.movieInset.right - rootView.movieInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return rootView.movieLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return rootView.movieInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return rootView.movieInset
    }
}

extension DailyMovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyMovieInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyMovieCollectionViewCell.identifier, for: indexPath) as? DailyMovieCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(dailyMovieInfo[indexPath.item], dailyMovieRow: indexPath.item)
        return cell
    }
}

