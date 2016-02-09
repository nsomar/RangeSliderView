//
//  SliderKnobViewiOS.swift
//  Pods
//
//  Created by Omar Abdelhafith on 07/02/2016.
//
//

#if os(iOS)
  import UIKit
  
  class SliderKnobView: UIView {
    
    var boundRange: BoundRange = BoundRange.emptyRange {
      didSet {
        setNeedsDisplay()
      }
    }
    
    var knobFrame: CGRect {
      get {
        return knobView.frame
      }
      
      set {
        knobView.frame = SliderKnobViewImpl.adjustKnobFrame(newValue, viewFrame: self.frame, boundRange: boundRange)
      }
    }
    
    var knobView: KnobView!
    
    var knobMovementCallback : (CGRect -> ())?
    
    init() {
      super.init(frame: CGRectZero)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    func commonInit() {
      knobView = KnobView()
      knobView.frame = CGRectMake(0, 0, 30, 30)
      
      self.addSubview(knobView)
    }
    
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
      let isIn = CGRectContainsPoint(knobView.frame, point)
      return isIn ? knobView : nil
    }
    
    var draggingPoint: CGFloat = 0
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      let pointInKnob = touches.first!.locationInView(knobView)
      draggingPoint = RectUtil.pointHorizontalDistanceFromCenter(forRect: knobFrame, point: pointInKnob)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      let point = touches.first!.locationInView(self)
      
      knobFrame =
        knobFrame
        |> RectUtil.updateRectHorizontalCenter(xCenter: point.x)
        |> RectUtil.moveRect(toLeft: draggingPoint)
      
      knobMovementCallback?(knobView.frame)
    }
    
  }
  
  extension SliderKnobView: SliderKnob {
    var view: SliderKnobView { return self }
  }
#endif
