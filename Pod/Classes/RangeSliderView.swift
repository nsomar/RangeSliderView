//
//  RangeSliderView.swift
//  DublinBusMenu
//
//  Created by Omar Abdelhafith on 04/02/2016.
//  Copyright © 2016 Omar Abdelhafith. All rights reserved.
//


protocol RangeSlider: AnyObject {
  var minimumValue: Int { get set }
  var maximumValue: Int { get set }
  
  var minimumSelectedValue: Int { get set }
  var maximumSelectedValue: Int { get set }
  
  var backgroundView: SliderBackground { get set }
  var minimumKnobView: SliderKnob { get set }
  var maximumKnobView: SliderKnob { get set }
  
  var fullRange: Range<Int> { get set }
  var selectedRange: Range<Int> { get set }
  
  var bounds: CGRect { get set }
  
  var selectedValuesChanged: ((Int, Int) -> ())? { get set }
  
  func addViewsAndRegisterCallbacks()
  
  func updateKnobsPlacements()
  
  func informAboutValueChanged()
  
  #if os(OSX)
  func addSubview(view: NSView)
  #else
  func addSubview(view: UIView)
  #endif
}


extension RangeSlider {
  
  private var width: CGFloat {
    return CGRectGetWidth(bounds)
  }
  
  func addViewsAndRegisterCallbacks() {
    addToView(backgroundView.view)
    addToView(minimumKnobView.view)
    addToView(maximumKnobView.view)
    
    minimumKnobView.knobMovementCallback = { rect in
      self.updateKnobViews()
    }
    
    maximumKnobView.knobMovementCallback = { rect in
      self.updateKnobViews()
    }
    
    fullRange = 0..<100
  }
  
  #if os(OSX)
  private func addToView(subView: NSView) {
    addSubview(subView)
    subView.frame = bounds
  }
  #else
  private func addToView(subView: UIView) {
    addSubview(subView)
    subView.frame = bounds
  }
  #endif
  
  private func updateKnobViews() {
    let minimumXAllowed = CGRectGetMaxX(minimumKnobView.knobFrame)
    self.maximumKnobView.boundRange.moveStart(minimumXAllowed)
    self.backgroundView.boundRange.moveStart(minimumXAllowed)
    
    let maximumXAllowed = CGRectGetMinX(maximumKnobView.knobFrame)
    self.minimumKnobView.boundRange.moveEnd(maximumXAllowed)
    self.backgroundView.boundRange.moveEnd(maximumXAllowed)
    
    self.updateSelectedRange()
  }
  
  private func updateSelectedRange() {
    
    let start = Int(locationForView(minimumKnobView.view))
    let end = Int(locationForView(maximumKnobView.view))
    
    if start == 0 && end == 0 { return }
    
    self.selectedRange = start..<end
    
    informAboutValueChanged()
    selectedValuesChanged?(minimumSelectedValue, maximumSelectedValue)
  }
  
  private func locationForView(view: SliderKnobView) -> CGFloat {
    let xLocation = getViewCenterX(view)
    return locationInRange(range: fullRange, viewWidth: self.width, xLocationInView: xLocation,
      itemWidth: minimumKnobView.knobFrame.size.width)
  }
  
  private func getViewCenterX(view: SliderKnobView) -> CGFloat {
    return CGRectGetMinX(view.knobFrame) + (CGRectGetWidth(view.knobFrame)) / 2.0
  }
  
  func updateKnobsPlacements() {
    let range = BoundRange.range(
      withFullRange: fullRange,
      selectedRange: selectedRange,
      fullWidth: width)
    
    backgroundView.boundRange = range.boundByApplyingInset(7)
    
    minimumKnobView.boundRange = BoundRange(start: 0, width: width)
    maximumKnobView.boundRange = BoundRange(start: 0, width: width)
    
    minimumKnobView.knobFrame = KnobPlacment.RangeStart.placeRect(forRange: range, size: minimumKnobView.knobFrame.size)
    maximumKnobView.knobFrame = KnobPlacment.RangeEnd.placeRect(forRange: range, size: maximumKnobView.knobFrame.size)
  }
  
}