//
//  SliderBackgroundView.swift
//  DublinBusMenu
//
//  Created by Omar Abdelhafith on 04/02/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol SliderBackground {
  var boundRange: BoundRange { get set }
  
  var frame: CGRect { get }
  
  var view: SliderBackgroundView { get }
  
  #if os(OSX)
  var emptyColor: NSColor { get set }
  var fullColor: NSColor { get set }
  #else
  var emptyColor: UIColor { get set }
  var fullColor: UIColor { get set }
  #endif
}

class SliderBackgroundViewImpl {
  
  static func drawRect(forView view: SliderBackground, dirtyRect: CGRect) {
    view.emptyColor.set()
    dirtyRect
      |> RectUtil.setRectHeight(3)
      |> RectUtil.centerRectVertically(view.frame.height)
      |> drawCapsule
    
    view.fullColor.set()
    dirtyRect
      |> RectUtil.applyBoundRange(view.boundRange.boundByApplyingInset(-3))
      |> RectUtil.setRectHeight(3)
      |> RectUtil.centerRectVertically(view.frame.height)
      |> drawCapsule
  }
  
  static func drawCapsule(frame: CGRect) {
    let height = frame.height
    
    if (frame.width - height) < 4 { return }
    
    #if os(OSX)
      let ovalPath = NSBezierPath(ovalIn: NSRect(x: frame.minX, y: frame.minY, width: height, height: frame.height))
    #else
      let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX, y: frame.minY, width: height, height: frame.height))
    #endif
    ovalPath.fill()
    
    #if os(OSX)
      let oval2Path = NSBezierPath(ovalIn: NSMakeRect(frame.minX + frame.width - height, frame.minY, height, frame.height))
    #else
      let oval2Path = UIBezierPath(ovalIn: CGRect(x: frame.minX + frame.width - height, y: frame.minY, width: height, height: frame.height))
    #endif
    oval2Path.fill()
    
    #if os(OSX)
      let rectanglePath = NSBezierPath(rect: NSMakeRect(frame.minX + (height/2), frame.minY, frame.width - height, frame.height))
    #else
      let rectanglePath = UIBezierPath(rect: CGRect(x: frame.minX + (height/2), y: frame.minY, width: frame.width - height, height: frame.height))
    #endif
    rectanglePath.fill()
  }
}

extension SliderBackgroundView: SliderBackground {
  var view: SliderBackgroundView { return self }
}
