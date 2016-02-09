//
//  KnobView.swift
//  DublinBusMenu
//
//  Created by Omar Abdelhafith on 04/02/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol Knob {
  #if os(OSX)
  var backgroundNormalColor: NSColor { get }
  var backgroundHighligtedColor: NSColor { get }
  var borderColor: NSColor { get }
  
  var fillColor: NSColor { get }
  #else
  var backgroundNormalColor: UIColor { get }
  var backgroundHighligtedColor: UIColor { get }
  var borderColor: UIColor { get }
  
  var fillColor: UIColor { get }
  #endif
  
  var frame: CGRect { get }
}

class KnobViewImpl {
  
  static func drawKnob(forView view: Knob, dirtyRect: CGRect) {
    var rect = CGRectMake(dirtyRect.minX, dirtyRect.minY, dirtyRect.width, dirtyRect.height)
    rect = CGRectInset(rect, 1, 1)
    
    #if os(OSX)
      let ovalPath = NSBezierPath(ovalInRect: rect)
    #else
      let ovalPath = UIBezierPath(ovalInRect: rect)
    #endif
    
    view.fillColor.setFill()
    ovalPath.fill()
    view.borderColor.setStroke()
    
    ovalPath.lineWidth = 1
    ovalPath.stroke()
  }
  
}