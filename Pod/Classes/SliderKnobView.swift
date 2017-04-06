//
//  SliderKnobView.swift
//  DublinBusMenu
//
//  Created by Omar Abdelhafith on 04/02/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//

import Foundation


enum KnobPlacment {

  case rangeStart
  case rangeEnd

  func placeRect(forRange range: BoundRange, size: CGSize) -> CGRect {
    switch self {
    case .rangeStart:
      return CGRect(x: range.start, y: 0, width: size.width, height: size.height)

    case .rangeEnd:
      return CGRect(x: range.end - size.width, y: 0, width: size.width, height: size.height)
    }
  }

}


class SliderKnobViewImpl {
  static func adjustKnobFrame(_ knobFrame: CGRect, viewFrame: CGRect, boundRange: BoundRange) -> CGRect {
    return knobFrame
      |> RectUtil.centerRectVertically(viewFrame.height)
      |> RectUtil.constraintRectWithinBounds(boundsToConstraint: boundRange)
  }
}

protocol SliderKnob {
  var boundRange: BoundRange { get set }
  var knobFrame: CGRect { get set }
  var knobMovementCallback : ((CGRect) -> ())? { get set }

  var knobView: KnobView! { get set }

  #if os(OSX)
  var view: SliderKnobView { get }
  #else
  var view: SliderKnobView { get }
  #endif
}
