# RangeSliderView

[![CI Status](http://img.shields.io/travis/oarrabi/RangeSliderView.svg?style=flat)](https://travis-ci.org/oarrabi/RangeSliderView)
[![Version](https://img.shields.io/cocoapods/v/RangeSliderView.svg?style=flat)](http://cocoapods.org/pods/RangeSliderView)
[![License](https://img.shields.io/cocoapods/l/RangeSliderView.svg?style=flat)](http://cocoapods.org/pods/RangeSliderView)
[![Platform](https://img.shields.io/cocoapods/p/RangeSliderView.svg?style=flat)](http://cocoapods.org/pods/RangeSliderView)

<p align="center">
<br/>
<img src="http://i.imgur.com/RDusAaZ.png" width="500" align="middle"/>
<br/>
</p>

RangeSliderView is a NSControl/UIContrl subclass that provides an easy control to select a range.

## Features

- Cross platform; works on the iOS and MacOSX.
- Customizable Knob and Progress colors.
- `@IBDesignable` and `@IBInspectable`

## Installation

RangeSliderView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RangeSliderView"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Using Interface builder
You can add RangeSliderView in your view using Interface builder by dragging a view and set `RangeSliderView` as the custom view class.

You can add an action using normal target action.

`RangeSliderView` contain inspectable properties, to change it's properties, edit the inspectables values in Interface Builder.

![Inspectable](http://i.imgur.com/UmI1kPg.png)

### Using code
Create a `RangeSliderView` and add it as a subview

```
let rangeSliderView = RangeSliderView(frame: CGRect(x: 10, y: 10, width: 200, height: 50))
self.view.addSubview(rangeSliderView)
```

To add actions, you can either use `Target/Action` or blocks. To use target/action:

On Mac

```swift
rangeSliderView.target = self
rangeSliderView.action = "valueChanged:"
```

On iOS

```swift
rangeSliderView.addTarget(self, action: "valueChanged:", forControlEvents: .ValueChanged)
```

For block action callbacks use the following

```swift
rangeSliderView.selectedValuesChanged = { min, max in
}
```

### Costumization

The following are costumizable properties of the `RangeSliderView`:

`sliderKnobColor` Sets the Knob background color (Defaults to white)

`sliderKnobHighligtedColor` Sets the Knob highlight color (Defaults to light gray)

`sliderKnobBorderColor` Sets the Knob border color (Defaults to gray)

`sliderProgressFilledColor` Sets the slider progress filled color (Defaults to blue)

`sliderProgressEmptyColor` Sets the slider progress empty color (Defaults to gray)

## screenshots

Mac:

![Normal colors](http://i.imgur.com/nsUOfdi.png)
![Fancy colors](http://i.imgur.com/Ysyfahj.png)
-----
iOS:

![Normal colors](http://i.imgur.com/1N89Ugt.png)
![Fancy colors](http://i.imgur.com/1N89Ugt.png)

## Author

Omar Abdelhafith, o.arrabi@me.com

## License

RangeSliderView is available under the MIT license. See the LICENSE file for more info.
