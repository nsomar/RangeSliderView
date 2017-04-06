//
//  BoundRange.swift
//  DublinBusMenu
//
//  Created by Omar Abdelhafith on 05/02/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation


struct BoundRange {
  
  var start: CGFloat
  var width: CGFloat
  
  var end: CGFloat {
    get {
      return start + width
    }
    set {
      width = newValue - start
    }
  }
  
  static var emptyRange: BoundRange {
    return BoundRange(start: 0, width: 0)
  }
  
  init(start: CGFloat, width: CGFloat) {
    self.start = start
    self.width = width
  }
  
  init(start: CGFloat, end: CGFloat) {
    self.start = start
    self.width = end - start
  }
  
  static func range(withFullRange fullRange: CountableRange<Int>, selectedRange: CountableRange<Int>, fullWidth: CGFloat) -> BoundRange {
    let fullRangeLength = CGFloat(abs(fullRange.lowerBound.distance(to: fullRange.upperBound)))
    let startPoint = CGFloat(abs(selectedRange.lowerBound.distance(to: fullRange.lowerBound)))
    let endPoint = CGFloat(abs(selectedRange.upperBound.distance(to: fullRange.upperBound)))
    
    let adjustedStartPoint = (startPoint / fullRangeLength) * fullWidth
    let adjustedEndPoint = (fullWidth - (endPoint / fullRangeLength) * fullWidth) - adjustedStartPoint
    
    return BoundRange(start: CGFloat(adjustedStartPoint), width: CGFloat(adjustedEndPoint))
  }
  
  mutating func moveStart(_ newStart: CGFloat) {
    let previousEnd = end
    start = newStart
    end = previousEnd
  }
  
  mutating func moveEnd(_ newEnd: CGFloat) {
    end = newEnd
  }
  
  func boundByApplyingInset(_ value: CGFloat) -> BoundRange {
    return BoundRange(start: self.start + value, end: self.end - value)
  }
}

/**
 Gets the location of a point in a range relative to the widh of a view
 
 
 - parameter range:           The full range
 - parameter viewWidth:       The view width
 - parameter xLocationInView: The location in the view
 - parameter itemWidth:       The knob width
 */
func locationInRange(range: CountableRange<Int>, viewWidth: CGFloat, xLocationInView: CGFloat, itemWidth: CGFloat) -> CGFloat {
  let ratio = (xLocationInView - (itemWidth / 2.0)) / (viewWidth - itemWidth)
  let distance = abs(range.upperBound.distance(to: range.lowerBound))
  
  return (ratio * CGFloat(distance)) + CGFloat(range.lowerBound)
}
