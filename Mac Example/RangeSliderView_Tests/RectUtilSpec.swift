//
//  RangeSliderView_Tests.swift
//  RangeSliderView_Tests
//
//  Created by Omar Abdelhafith on 07/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import RangeSliderView

class TableOfContentsSpec: QuickSpec {
  
  override func spec() {
    
    describe("RectUtil") {
      
      it("can calculate the center of a view given x location") {
        let rect = RectUtil.updateRectHorizontalCenter(xCenter: 30)(rect: CGRect(x: 0, y: 0, width: 20, height: 20))
        expect(rect) == CGRect(x: 20, y: 0, width: 20, height: 20)
      }
      
      it("can center a rect vertically") {
        let rect = RectUtil.centerRectVertically(height: 50)(rect: CGRect(x: 0, y: 0, width: 20, height: 20))
        expect(rect) == CGRect(x: 0, y: 15, width: 20, height: 20)
      }
      
      it("can constraint a rect within bounds") {
        let function = RectUtil.constraintRectWithinBounds(boundsToConstraint: BoundRange(start: 20, end:100))
        
        expect(function(original: CGRect(x: 0, y: 0, width: 20, height: 20))) == CGRect(x: 20, y: 0, width: 20, height: 20)
        expect(function(original: CGRect(x: 30, y: 0, width: 20, height: 20))) == CGRect(x: 30, y: 0, width: 20, height: 20)
        expect(function(original: CGRect(x: 130, y: 0, width: 20, height: 20))) == CGRect(x: 80, y: 0, width: 20, height: 20)
      }
      
      it("can set a rect height") {
        let newRect = CGRect(x: 0, y: 0, width: 20, height: 20) |> RectUtil.setRectHeight(height: 30)
        expect(newRect.height) == 30
      }
      
      it("can set a rect height") {
        let newRect = CGRect(x: 0, y: 0, width: 20, height: 20) |> RectUtil.setRectHeight(height: 30)
        expect(newRect.height) == 30
      }
      
      it("can apply bound range on a rect") {
        let newRect = CGRect(x: 0, y: 0, width: 20, height: 20)
          |> RectUtil.applyBoundRange(boundRange: BoundRange(start: 10, end: 130))
        expect(newRect) == CGRect(x: 10, y: 0, width: 120, height: 20)
      }
      
      it("can displace a rect") {
        let newRect = CGRect(x: 0, y: 0, width: 20, height: 20)
          |> RectUtil.moveRect(toLeft: 10)
        expect(newRect) == CGRect(x: 10, y: 0, width: 20, height: 20)
      }
      
      it("can get horizontal distance from center") {
        let newRect = CGRect(x: 0, y: 0, width: 20, height: 20)

        expect(RectUtil.pointHorizontalDistanceFromCenter(forRect: newRect, point: CGPoint(x: 3, y: 0))) == 7
        expect(RectUtil.pointHorizontalDistanceFromCenter(forRect: newRect, point: CGPoint(x: 13, y: 0))) == -3
      }
      
    }
    
  }
}
