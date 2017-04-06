//
//  KnobViewOsx.swift
//  Pods
//
//  Created by Omar Abdelhafith on 07/02/2016.
//
//

#if os(OSX)
  import Cocoa
  
  class KnobView: NSView {
    
    var backgroundNormalColor = NSColor(calibratedRed: 1, green: 1, blue: 1, alpha: 1) {
      didSet {
        needsDisplay = true
      }
    }
    
    var backgroundHighligtedColor = NSColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1) {
      didSet {
        needsDisplay = true
      }
    }
    
    var borderColor = NSColor(calibratedRed: 0.722, green: 0.722, blue: 0.722, alpha: 1) {
      didSet {
        needsDisplay = true
      }
    }
    
    var isHighlighted = false {
      didSet {
        needsDisplay = true
      }
    }
    
    var fillColor: NSColor {
      return isHighlighted ? backgroundHighligtedColor : backgroundNormalColor
    }
    
    override func draw(_ dirtyRect: NSRect) {
      super.draw(dirtyRect)
      KnobViewImpl.drawKnob(forView: self, dirtyRect: dirtyRect)
    }
    
    override func mouseDown(with theEvent: NSEvent) {
      isHighlighted = true
      super.mouseDown(with: theEvent)
    }

    override func mouseUp(with event: NSEvent) {
      isHighlighted = false
      super.mouseUp(with: event)
    }
    
  }
  
  extension KnobView: Knob {
  }
  
#endif
