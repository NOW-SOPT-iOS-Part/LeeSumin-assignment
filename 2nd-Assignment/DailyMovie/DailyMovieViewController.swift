//
//  DailyMovieViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import UIKit

class DailyMovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        let key = "95dd7589a2ca8b8126c77eabf642771a"
        let targetDt = "20240509"//Date.movieDate()

        DailyMovieService.shared.getDailyMovie(key: key, targetDt: targetDt) { [weak self] response in
            switch response{
            case .success(let data):
                guard let data = data as? DailyMovieInfo else {return}
                dump(data)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
