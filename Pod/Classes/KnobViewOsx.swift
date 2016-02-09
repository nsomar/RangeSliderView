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
    
    override func drawRect(dirtyRect: NSRect) {
      super.drawRect(dirtyRect)
      KnobViewImpl.drawKnob(forView: self, dirtyRect: dirtyRect)
    }
    
    override func mouseDown(theEvent: NSEvent) {
      isHighlighted = true
      super.mouseDown(theEvent)
    }
    
    override func mouseUp(theEvent: NSEvent) {
      isHighlighted = false
      super.mouseUp(theEvent)
    }
    
  }
  
  extension KnobView: Knob {
  }
  
#endif