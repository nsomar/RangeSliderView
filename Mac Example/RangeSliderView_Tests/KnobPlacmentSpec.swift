import Quick
import Nimble
@testable import RangeSliderView


class KnobPlacmentSpec: QuickSpec {
    override func spec() {

      describe("KnobPlacment") {
        
        it("can place a rect at start") {
          let rect = KnobPlacment.RangeStart.placeRect(forRange: BoundRange(start: 20, end: 100), size: CGSize(width: 20, height: 20))
          expect(rect) == CGRect(x: 20, y: 0, width: 20, height: 20)
        }
        
        it("can place a rect at end") {
          let rect = KnobPlacment.RangeEnd.placeRect(forRange: BoundRange(start: 20, end: 100), size: CGSize(width: 20, height: 20))
          expect(rect) == CGRect(x: 80, y: 0, width: 20, height: 20)
        }
        
      }
      
    }
}
