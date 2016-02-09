//
//  SliderBackgroundViewOsx.swift
//  Pods
//
//  Created by Omar Abdelhafith on 07/02/2016.
//
//

#if os(OSX)
  import Cocoa
  
  class SliderBackgroundView: NSView {
    
    var emptyColor = NSColor(red: 0.722, green: 0.722, blue: 0.722, alpha: 1)
    var fullColor = NSColor(red: 0.231, green: 0.6, blue: 0.988, alpha: 1)
    
    var boundRange: BoundRange = BoundRange.emptyRange {
      didSet {
        needsDisplay = true
      }
    }
    
    override func drawRect(dirtyRect: CGRect) {
      super.drawRect(dirtyRect)
      SliderBackgroundViewImpl.drawRect(forView: self, dirtyRect: dirtyRect)
    }
    
  }
#endif