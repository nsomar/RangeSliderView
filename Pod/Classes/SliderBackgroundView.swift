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
      |> RectUtil.setRectHeight(height: 3)
      |> RectUtil.centerRectVertically(height: view.frame.height)
      |> drawCapsule
    
    view.fullColor.set()
    dirtyRect
      |> RectUtil.applyBoundRange(boundRange: view.boundRange.boundByApplyingInset(-3))
      |> RectUtil.setRectHeight(height: 3)
      |> RectUtil.centerRectVertically(height: view.frame.height)
      |> drawCapsule
  }
  
  static func drawCapsule(frame frame: CGRect) {
    let height = CGRectGetHeight(frame)
    
    if (frame.width - height) < 4 { return }
    
    #if os(OSX)
      let ovalPath = NSBezierPath(ovalInRect: NSMakeRect(frame.minX, frame.minY, height, frame.height))
    #else
      let ovalPath = UIBezierPath(ovalInRect: CGRectMake(frame.minX, frame.minY, height, frame.height))
    #endif
    ovalPath.fill()
    
    #if os(OSX)
      let oval2Path = NSBezierPath(ovalInRect: NSMakeRect(frame.minX + frame.width - height, frame.minY, height, frame.height))
    #else
      let oval2Path = UIBezierPath(ovalInRect: CGRectMake(frame.minX + frame.width - height, frame.minY, height, frame.height))
    #endif
    oval2Path.fill()
    
    #if os(OSX)
      let rectanglePath = NSBezierPath(rect: NSMakeRect(frame.minX + (height/2), frame.minY, frame.width - height, frame.height))
    #else
      let rectanglePath = UIBezierPath(rect: CGRectMake(frame.minX + (height/2), frame.minY, frame.width - height, frame.height))
    #endif
    rectanglePath.fill()
  }
}

extension SliderBackgroundView: SliderBackground {
  var view: SliderBackgroundView { return self }
}