//
//  SliderKnobView.swift
//  DublinBusMenu
//
//  Created by Omar Abdelhafith on 04/02/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation


enum KnobPlacment {
  
  case RangeStart
  case RangeEnd
  
  func placeRect(forRange range: BoundRange, size: CGSize) -> CGRect {
    switch self {
    case RangeStart:
      return CGRectMake(range.start, 0, size.width, size.height)
      
    case RangeEnd:
      return CGRectMake(range.end - size.width, 0, size.width, size.height)
    }
  }
  
}


class SliderKnobViewImpl {
  static func adjustKnobFrame(knobFrame: CGRect, viewFrame: CGRect, boundRange: BoundRange) -> CGRect {
    return knobFrame
      |> RectUtil.centerRectVertically(height: viewFrame.height)
      |> RectUtil.constraintRectWithinBounds(boundsToConstraint: boundRange)
  }
}

protocol SliderKnob {
  var boundRange: BoundRange { get set }
  var knobFrame: CGRect { get set }
  var knobMovementCallback : (CGRect -> ())? { get set }
  
  var knobView: KnobView! { get set }
  
  #if os(OSX)
  var view: SliderKnobView { get }
  #else
  var view: SliderKnobView { get }
  #endif
}