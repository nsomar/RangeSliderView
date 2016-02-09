import Quick
import Nimble
@testable import RangeSliderView


class BoundRangeSpec: QuickSpec {
  override func spec() {
    
    describe("BoundRange") {
      
      it("can shift the start") {
        var range = BoundRange(start: 10, width: 50)
        range.moveStart(30)
        XCTAssertEqual(range.start, 30)
        XCTAssertEqual(range.width, 30)
        XCTAssertEqual(range.end, 60)
      }
      
      it("can shift the end") {
        var range = BoundRange(start: 10, width: 50)
        range.moveEnd(50)
        XCTAssertEqual(range.start, 10)
        XCTAssertEqual(range.width, 40)
        XCTAssertEqual(range.end, 50)
      }
      
      it("can create range with ranges and width") {
        let range = BoundRange.range(withFullRange: 5..<75, selectedRange: 15..<65, fullWidth: 300)
        XCTAssertEqual(Int(range.start), 42)
        XCTAssertEqual(Int(range.width), 214)
      }
      
      it("can map a location to a range") {
        let location = locationInRange(range: 5..<75, viewWidth: 300, xLocationInView: 150, itemWidth: 20)
        XCTAssertEqual(Int(location), 40)
      }
      
      it("can inset a range") {
        var range = BoundRange(start: 10, end: 30)
        range = range.boundByApplyingInset(5)
        expect(range.start) == 15
        expect(range.end) == 25
        
        var range2 = BoundRange(start: 10, end: 30)
        range2 = range2.boundByApplyingInset(-5)
        expect(range2.start) == 5
        expect(range2.end) == 35
      }
      
    }
  }
}
