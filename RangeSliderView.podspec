#
# Be sure to run `pod lib lint RangeSliderView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RangeSliderView"
  s.version          = "0.1.0"
  s.summary          = "RangeSliderView provide an easy to use range selection view."

  s.description      = <<-DESC
RangeSliderView is a NSControl/NSControl/UIControl subclass that provides an easy control to select a range.
                       DESC

  s.homepage         = "https://github.com/oarrabi/RangeSliderView"
  s.screenshots     = "http://i.imgur.com/PkG5mJG.png", "http://i.imgur.com/RDusAaZ.png"
  s.license          = 'MIT'
  s.author           = { "Omar Abdelhafith" => "o.arrabi@me.com" }
  s.source           = { :git => "https://github.com/oarrabi/RangeSliderView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ifnottrue'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.requires_arc = true

  s.source_files = ['Pod/Classes/**/*']

  s.pod_target_xcconfig = { "ENABLE_TESTABILITY" => "YES" }
end
