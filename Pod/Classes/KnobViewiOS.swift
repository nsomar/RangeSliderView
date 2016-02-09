//
//  KnobViewiOS.swift
//  Pods
//
//  Created by Omar Abdelhafith on 07/02/2016.
//
//

#if os(iOS)
  import UIKit
  
  class KnobView: UIView {
    
    var backgroundNormalColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) {
      didSet {
        setNeedsDisplay()
      }
    }
    
    var backgroundHighligtedColor = UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1) {
      didSet {
        setNeedsDisplay()
      }
    }
    
    var borderColor = UIColor(red: 0.722, green: 0.722, blue: 0.722, alpha: 1) {
      didSet {
        setNeedsDisplay()
      }
    }
    
    var isHighlighted = false {
      didSet {
        setNeedsDisplay()
      }
    }
    
    var fillColor: UIColor {
      return isHighlighted ? backgroundHighligtedColor : backgroundNormalColor
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      backgroundColor = UIColor.clearColor()
    }
    
    init () {
      super.init(frame: CGRectZero)
      backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
      super.drawRect(rect)
      KnobViewImpl.drawKnob(forView: self, dirtyRect: rect)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      isHighlighted = true
      super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      isHighlighted = false
      super.touchesEnded(touches, withEvent: event)
    }
    
  }
  
  extension KnobView: Knob {
  }
  
#endif