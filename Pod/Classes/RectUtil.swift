//
//  RectUtil.swift
//  Pods
//
//  Created by Omar Abdelhafith on 06/02/2016.
//
//

import Foundation


class RectUtil {
  
  static func updateRectHorizontalCenter(xCenter xCenter: CGFloat)(rect: CGRect) -> CGRect {
    return CGRectMake(
      xCenter - (rect.size.height / 2.0),
      0,
      rect.size.width,
      rect.size.height)
  }

  static func pointHorizontalDistanceFromCenter(forRect rect: CGRect, point: CGPoint) -> CGFloat {
    return (rect.width / 2.0) - point.x
  }
  
  static func moveRect(toLeft xValue: CGFloat)(rect: CGRect) -> CGRect {
    var newRect = rect
    newRect.origin.x += xValue
    return newRect
  }
  
  static func centerRectVertically(height height: CGFloat)(rect: CGRect) -> CGRect {
    return CGRectMake(
      rect.origin.x,
      (height - rect.size.height) / 2.0,
      rect.size.width,
      rect.size.height)
  }
  
  static func constraintRectWithinBounds(boundsToConstraint boundRange: BoundRange)(original source: CGRect) -> CGRect {
    var destinationRect = source
    
    if CGRectGetMinX(source) < boundRange.start {
      destinationRect.origin.x = boundRange.start
    }
    
    if CGRectGetMaxX(source) > boundRange.end {
      destinationRect.origin.x = boundRange.end - CGRectGetWidth(source)
    }
    
    return destinationRect
  }

  static func applyBoundRange(boundRange boundRange: BoundRange)(frame: CGRect) -> CGRect {
    var rect = frame
    rect.origin.x = boundRange.start
    rect.size.width = boundRange.width
    return rect
  }
  
  static func setRectHeight(height height: CGFloat)(rect: CGRect) -> CGRect {
    var frame = rect
    frame.size.height = height
    return frame
  }
  
}
