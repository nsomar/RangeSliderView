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
      backgroundColor = UIColor.clear
    }
    
    init () {
      super.init(frame: CGRect.zero)
      backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
      super.draw(rect)
      KnobViewImpl.drawKnob(forView: self, dirtyRect: rect)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      isHighlighted = true
      super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      isHighlighted = false
      super.touchesEnded(touches, with: event)
    }
    
  }
  
  extension KnobView: Knob {
  }
  
#endif
