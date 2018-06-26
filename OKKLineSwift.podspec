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
  s.swift_version = "4.1"

end
