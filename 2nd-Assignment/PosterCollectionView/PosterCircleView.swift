//
//  PosterCircleView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

class PosterCircleView: UIStackView {
    
    var circleViews : [UIImageView] = []
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        for _ in 1...8{
            lazy var circleView = makeCircleImageView()
            circleViews.append(circleView)
            self.addArrangedSubview(circleView)
        }
        self.distribution = .equalSpacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCircleImageView() -> UIImageView{
        lazy var imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse_Gray3")
        return imageView
    }
    
    func selectCircle(_ index: Int){
        circleViews[index].image = UIImage(named: "Elipse_Gray3")?.withTintColor(.white)
        print(circleViews)
    }
    
}
