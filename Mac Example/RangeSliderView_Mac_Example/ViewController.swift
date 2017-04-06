//
//  ViewController.swift
//  RangeSliderView_Mac_Example
//
//  Created by Omar Abdelhafith on 06/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Cocoa
import RangeSliderView

class ViewController: NSViewController {

  @IBOutlet var rangeSliderView: RangeSliderView!

  @IBOutlet var minimumLabel: NSTextField!
  @IBOutlet var maximumLabel: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    rangeSliderView.selectedValuesChanged = { min, max in
      self.minimumLabel.stringValue = "\(min)"
      self.maximumLabel.stringValue = "\(max)"
    }
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
}

