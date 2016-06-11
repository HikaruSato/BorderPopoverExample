//
//  HSPopoverBackgroundView.swift
//  Popover View
//
//  Created by HikaruSato on 2016/06/11.
//  Copyright © 2016年 The App Lady. All rights reserved.
//

import UIKit

class HSPopoverBackgroundView: UIPopoverBackgroundView {
    let CONTENT_INSET:CGFloat = 10.0
    let CAP_INSET:CGFloat = 25.0
    let ARROW_BASE:CGFloat = 25.0
    let ARROW_HEIGHT:CGFloat = 25.0
    let BORDER_WIDTH:CGFloat = 2.0//ボーダーの太さ
    
    let arrowView = UIImageView(image: UIImage(named: "arrow_red"))
    let backgroundView = UIView(frame: CGRectMake(0, 0, 0, 0))
    
    var _arrowOffset:CGFloat = 0
    var _arrowDirection:UIPopoverArrowDirection = UIPopoverArrowDirection.Any
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView.backgroundColor = UIColor.whiteColor()
        self.backgroundView.layer.cornerRadius = 10.0
        self.backgroundView.layer.borderColor = UIColor.redColor().CGColor
        self.backgroundView.layer.borderWidth = 2.0
        self.backgroundView.clipsToBounds = true
        self.addSubview(self.backgroundView)
        self.addSubview(self.arrowView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override static func arrowBase() -> CGFloat {
        return 44
    }
    
    override static func arrowHeight() -> CGFloat {
        return 44
    }
    
    override static func contentViewInsets() -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override var arrowOffset : CGFloat {
        get {
            return self._arrowOffset
        }
        set {
            self._arrowOffset = newValue
        }
    }
    
    /* `arrowDirection` manages which direction the popover arrow is pointing. You may be required to change the direction of the arrow while the popover is still visible on-screen.
     */
    override var arrowDirection: UIPopoverArrowDirection {
        get {
            return self._arrowDirection
        }
        set {
            self._arrowDirection = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var height = self.frame.size.height;
        var width = self.frame.size.width;
        var left:CGFloat = 0.0;
        var top:CGFloat = 0.0;
        var coordinate:CGFloat = 0.0;
        var rotation = CGAffineTransformIdentity;
        
        
        switch (self.arrowDirection) {
        case UIPopoverArrowDirection.Up:
            top += ARROW_HEIGHT - BORDER_WIDTH;
            height -= ARROW_HEIGHT;
            coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            self.arrowView.frame = CGRectMake(coordinate, 0, ARROW_BASE, ARROW_HEIGHT);
            break;
            
            
        case UIPopoverArrowDirection.Down:
            top += BORDER_WIDTH;
            height -= ARROW_HEIGHT;
            coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            arrowView.frame = CGRectMake(coordinate, height, ARROW_BASE, ARROW_HEIGHT);
            rotation = CGAffineTransformMakeRotation( CGFloat (M_PI) );
            break;
            
        case UIPopoverArrowDirection.Left:
            left += ARROW_BASE;
            width -= ARROW_BASE;
            coordinate = ((self.frame.size.height / 2) + self.arrowOffset) - (ARROW_HEIGHT/2);
            arrowView.frame = CGRectMake(0, coordinate, ARROW_BASE, ARROW_HEIGHT);
            rotation = CGAffineTransformMakeRotation( -1 * CGFloat (M_PI_2) );
            break;
            
        case UIPopoverArrowDirection.Right:
            width -= ARROW_BASE;
            coordinate = ((self.frame.size.height / 2) + self.arrowOffset) - (ARROW_HEIGHT/2);
            arrowView.frame = CGRectMake(width, coordinate, ARROW_BASE, ARROW_HEIGHT);
            rotation = CGAffineTransformMakeRotation( CGFloat (M_PI_2) );
            
            break;
            
        default:
            break
        }
        
        self.backgroundView.frame = CGRectMake(left, top, width, height)
        
        self.arrowView.transform = rotation
    }
}
