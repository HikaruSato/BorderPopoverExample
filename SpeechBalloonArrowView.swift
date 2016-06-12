//
//  SpeechBalloonArrowView.swift
//  Popover View
//
//  Created by grachro on 2016/06/11.
//

import UIKit

class SpeechBalloonArrowView: UIView {
    
    var arrowWidth:CGFloat
    let arrowHeight:CGFloat
    let borderWidth:CGFloat
    
    init(width: CGFloat = 25, height: CGFloat = 10, borderWidth: CGFloat = 2) {
        self.arrowWidth = width
        self.arrowHeight = height
        self.borderWidth = borderWidth
        super.init(frame: CGRect(x: 0, y: 0, width: arrowWidth, height: arrowHeight))
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let x:CGFloat = arrowWidth / 2
        let y:CGFloat = 0
        
        let back = UIBezierPath();
        back.moveToPoint(CGPointMake(x, y+borderWidth));
        back.addLineToPoint(CGPointMake(x+arrowWidth / 2, y+arrowHeight));
        back.addLineToPoint(CGPointMake(x-arrowWidth / 2, y+arrowHeight));
        back.closePath()
        UIColor.whiteColor().setFill()
        back.fill();

        let line = UIBezierPath();
        line.moveToPoint(CGPointMake(x+arrowWidth / 2, y+arrowHeight));
        line.addLineToPoint(CGPointMake(x, y+borderWidth));
        line.addLineToPoint(CGPointMake(x-arrowWidth / 2, y+arrowHeight));
        UIColor.redColor().setStroke()
        line.lineWidth = self.borderWidth
        line.stroke();

    }
}
