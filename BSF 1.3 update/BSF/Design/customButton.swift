//
//  customButton.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 26/10/2019.
//  Copyright © 2019 BSF. All rights reserved.
//
import UIKit

@IBDesignable
final class customButton: UIButton {

    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.black.cgColor

    @IBInspectable var titleText: String? {
        didSet {
//            self.setTitle(titleText, for: .normal)
//            self.setTitleColor(UIColor.black,for: .normal)
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer : CAGradientLayer = CAGradientLayer()
                layer.frame.size = self.frame.size
                layer.frame.origin = CGPoint(x: 0, y: 0)

                //   layer.cornerRadius = CGFloat(frame.width / 20)
//                let color0 = UIColor(red:0/255, green:210/255, blue:255/255, alpha:1.0).cgColor
//                let color1 = UIColor(red:0/255, green:110/255, blue: 198/255, alpha:1.0).cgColor
//                let color2 = UIColor(red:250/255, green:98/255, blue: 44/255, alpha:1.0).cgColor
//                layer.locations = [0.5, 1.0]
//                layer.startPoint = CGPoint(x: 0.0, y: 0.3)
//                layer.endPoint = CGPoint(x: 0.9, y: 1)
//                layer.colors = [color2, color0,color1]

                self.layer.insertSublayer(layer, at: 0)
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 9.0
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}
