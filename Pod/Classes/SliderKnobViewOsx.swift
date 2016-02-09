//
//  SliderKnobViewOsx.swift
//  Pods
//
//  Created by Omar Abdelhafith on 07/02/2016.
//
//

#if os(OSX)
  import Cocoa
  
  class SliderKnobView: NSView {
    
    var boundRange: BoundRange = BoundRange.emptyRange {
      didSet {
        needsDisplay = true
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
    
    var knobMovementCallback : (NSRect -> ())?
    
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
      knobView.frame = NSMakeRect(0, 0, 20, 20)
      
      self.addSubview(knobView)
    }
    
    override func hitTest(aPoint: NSPoint) -> NSView? {
      return knobView.hitTest(aPoint)
    }
    
    var draggingPoint: CGFloat = 0
    
    override func mouseDown(theEvent: NSEvent) {
      let pointInKnob = knobView.convertPoint(theEvent.locationInWindow, fromView: nil)
      draggingPoint = RectUtil.pointHorizontalDistanceFromCenter(forRect: knobFrame, point: pointInKnob)
    }
    
    override func mouseDragged(theEvent: NSEvent) {
      let point = convertPoint(theEvent.locationInWindow, fromView: nil)
      
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
