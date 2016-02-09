test-app:
	cd "Mac Example" && xcodebuild -workspace RangeSliderView.xcworkspace -scheme "RangeSliderView_Mac_Example" test | xcpretty

build-mac:
	cd "Mac Example" && xcodebuild -workspace RangeSliderView.xcworkspace -scheme "RangeSliderView_Mac_Example" clean build | xcpretty

build-ios:
	cd "iOS Example" && xcodebuild -workspace RangeSliderView.xcworkspace -scheme "RangeSliderView_iOS_Example" build | xcpretty

pod-mac:
	pod install --project-directory="Mac Example"

pod-ios:
	pod install --project-directory="iOS Example"

pod: pod-mac pod-ios

test-pod:
	pod lib lint

test: test-app build-mac build-ios test-pod
