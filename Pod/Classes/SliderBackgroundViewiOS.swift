//
//  SliderBackgroundViewiOS.swift
//  Pods
//
//  Created by Omar Abdelhafith on 07/02/2016.
//
//

#if os(iOS)
  import UIKit
  
  class SliderBackgroundView: UIView {
    
    var emptyColor = UIColor(red: 0.722, green: 0.722, blue: 0.722, alpha: 1)
    var fullColor = UIColor(red: 0.231, green: 0.6, blue: 0.988, alpha: 1)
    
    var boundRange: BoundRange = BoundRange.emptyRange {
      didSet {
        setNeedsDisplay()
      }
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      backgroundColor = UIColor.clearColor()
    }
    
    init () {
      super.init(frame: CGRectZero)
      backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(dirtyRect: CGRect) {
      SliderBackgroundViewImpl.drawRect(forView: self, dirtyRect: dirtyRect)
    }
    
  }

#endif