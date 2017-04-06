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
  
  var fullRange: CountableRange<Int> { get set }
  var selectedRange: CountableRange<Int> { get set }
  
  var bounds: CGRect { get set }
  
  var selectedValuesChanged: ((Int, Int) -> ())? { get set }
  
  func addViewsAndRegisterCallbacks()
  
  func updateKnobsPlacements()
  
  func informAboutValueChanged()
  
  #if os(OSX)
  func addSubview(_ view: NSView)
  #else
  func addSubview(_ view: UIView)
  #endif
}


extension RangeSlider {
  
  fileprivate var width: CGFloat {
    return bounds.width
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
  private func addToView(_ subView: NSView) {
    addSubview(subView)
    subView.frame = bounds
  }
  #else
  fileprivate func addToView(_ subView: UIView) {
    addSubview(subView)
    subView.frame = bounds
  }
  #endif
  
  fileprivate func updateKnobViews() {
    let minimumXAllowed = (minimumKnobView.knobFrame).maxX
    self.maximumKnobView.boundRange.moveStart(minimumXAllowed)
    self.backgroundView.boundRange.moveStart(minimumXAllowed)
    
    let maximumXAllowed = (maximumKnobView.knobFrame).minX
    self.minimumKnobView.boundRange.moveEnd(maximumXAllowed)
    self.backgroundView.boundRange.moveEnd(maximumXAllowed)
    
    self.updateSelectedRange()
  }
  
  fileprivate func updateSelectedRange() {
    
    let start = Int(locationForView(minimumKnobView.view))
    let end = Int(locationForView(maximumKnobView.view))
    
    if start == 0 && end == 0 { return }
    
    self.selectedRange = start..<end
    
    informAboutValueChanged()
    selectedValuesChanged?(minimumSelectedValue, maximumSelectedValue)
  }
  
  fileprivate func locationForView(_ view: SliderKnobView) -> CGFloat {
    let xLocation = getViewCenterX(view)
    return locationInRange(range: fullRange,
                           viewWidth: self.width,
                           xLocationInView: xLocation,
                           itemWidth: minimumKnobView.knobFrame.size.width)
  }
  
  fileprivate func getViewCenterX(_ view: SliderKnobView) -> CGFloat {
    return view.knobFrame.minX + (view.knobFrame.width) / 2.0
  }
  
  func updateKnobsPlacements() {
    let range = BoundRange.range(
      withFullRange: fullRange,
      selectedRange: selectedRange,
      fullWidth: width)
    
    backgroundView.boundRange = range.boundByApplyingInset(7)
    
    minimumKnobView.boundRange = BoundRange(start: 0, width: width)
    maximumKnobView.boundRange = BoundRange(start: 0, width: width)
    
    minimumKnobView.knobFrame = KnobPlacment.rangeStart.placeRect(forRange: range, size: minimumKnobView.knobFrame.size)
    maximumKnobView.knobFrame = KnobPlacment.rangeEnd.placeRect(forRange: range, size: maximumKnobView.knobFrame.size)
  }
  
}
