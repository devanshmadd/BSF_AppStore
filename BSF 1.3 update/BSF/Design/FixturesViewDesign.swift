//
//  FixturesViewDesign.swift
//  BSF
//
//  Created by Harshit Gajjar and Devansh Shah on 10/25/19.
//  Copyright © 2019 BSF. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignCell : UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    @IBInspectable var shadowOffSetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight : Int = 1
    @IBInspectable var shadowOpacity : Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
//
//        let layer : CAGradientLayer = CAGradientLayer()
//        layer.cornerRadius = cornerRadius
//              layer.shadowColor = shadowColor?.cgColor
//              layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffsetHeight)
//              let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//
//              layer.shadowPath = shadowPath.cgPath
//              layer.shadowOpacity = shadowOpacity
//                layer.cornerRadius = 14.0
//
//                        layer.frame.size = self.frame.size
//                        layer.frame.origin = CGPoint(x: 0, y: 0)
////
//                           layer.cornerRadius = CGFloat(frame.width / 20)
//                            layer.backgroundColor=UIColor(red:255/255, green:255/255, blue:255/255, alpha:1.0).cgColor
//                        let color0 = UIColor(red:0/255, green:210/255, blue:255/255, alpha:1.0).cgColor
//                        let color1 = UIColor(red:0/255, green:110/255, blue: 198/255, alpha:1.0).cgColor
//                        let color2 = UIColor(red:250/255, green:98/255, blue: 70/255, alpha:1.0).cgColor
//                        layer.locations = [0.5, 1.0]
//                        layer.startPoint = CGPoint(x: 0.0, y: 0.7)
//                        layer.endPoint = CGPoint(x: 0.8, y: 1.0)
//                        layer.colors = [color2,color0,color1]

//                        self.layer.insertSublayer(layer, at: 0)
    }
}
