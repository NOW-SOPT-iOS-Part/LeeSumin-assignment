//
//  DailyMovieViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import UIKit

import Moya

class DailyMovieViewController: UIViewController, UICollectionViewDelegate {

    private let rootView = DailyMovieView()
    private var collectionView : UICollectionView
    
    private var dailyMovieData: [DailyMovieInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        register()
        setCollectionView()
    }
    
    init() {
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
    
    func setData() {
        let key = "95dd7589a2ca8b8126c77eabf642771a"
        let targetDt = "20240509" //Date.movieDate()

        DailyMovieService.shared.getDailyMovie(key: key, targetDt: targetDt) { [weak self] response in
            switch response{
            case .success(let data):
                print("@Log - \(data)")
                if let movieData = data as? DailyMovieResponse {
                    let dailyMovieData = movieData.boxOfficeResult.dailyBoxOfficeList.map {
                        DailyMovieInfo(rank: $0.rank, name: $0.movieNm, openDate: $0.openDt, audience: $0.audiAcc)
                    }
                    self?.dailyMovieData = dailyMovieData
                    print("@Log - \(dailyMovieData)")
               } else {
                   print("Decoding error / Unexpected data format")
               }
            case .decodedErr:
                print("decoding error")
            case .networkFail:
                print("network fail")
            case .pathErr:
                print("path error")
            case .requestErr:
                print("request error")
            case .serverErr:
                print("server error")
            }
        }
    }
}

extension DailyMovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyMovieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyMovieCollectionViewCell.identifier, for: indexPath) as? DailyMovieCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(dailyMovieData[indexPath.item], dailyMovieRow: indexPath.item)
        return cell
    }
}

