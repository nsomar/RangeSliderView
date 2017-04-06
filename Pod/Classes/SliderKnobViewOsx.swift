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
    
    var knobMovementCallback : ((NSRect) -> ())?
    
    init() {
      super.init(frame: .zero)
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
    
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
      return knobView.hitTest(aPoint)
    }
    
    var draggingPoint: CGFloat = 0

    override func mouseDown(with event: NSEvent) {
      let pointInKnob = knobView.convert(event.locationInWindow, from: nil)
      draggingPoint = RectUtil.pointHorizontalDistanceFromCenter(forRect: knobFrame, point: pointInKnob)
    }

    override func mouseDragged(with event: NSEvent) {
      let point = convert(event.locationInWindow, from: nil)
      
      knobFrame =
        knobFrame
        |> RectUtil.updateRectHorizontalCenter(point.x)
        |> RectUtil.moveRect(toLeft: draggingPoint)
      
      knobMovementCallback?(knobView.frame)
    }
    
  }
  
  extension SliderKnobView: SliderKnob {
    var view: SliderKnobView { return self }
  }
#endif
