#
#  Be sure to run `pod spec lint OKKLineSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "OKKLineSwift"
  s.version      = "0.0.1"
  s.summary      = "Draw the K-Line by Swift, support iOS & macOS"
  s.homepage     = "https://github.com/xiao99xiao/OKKLineSwift"
  s.license      = "MIT"
  s.author    = "Herb"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.source       = { :git => "https://github.com/xiao99xiao/OKKLineSwift.git", :tag => s.version.to_s }
  s.source_files  = "OKKLineSwift", "OKKLineSwift/**/*"
  s.requires_arc = true
  s.dependency "SnapKit"

end
