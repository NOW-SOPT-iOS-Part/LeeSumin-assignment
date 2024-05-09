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

        // Do any additional setup after loading the view.
    }
    
    static func movieDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: Date())
    }
    
    func setData() {
        let request = DailyMovieRequestModel(key: "95dd7589a2ca8b8126c77eabf642771a", targetDt: DailyMovieViewController.movieDate())
        
        
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
