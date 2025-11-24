#
#  Be sure to run `pod spec lint UstadiumDesignKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "UstadiumDesignKit"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of UstadiumDesignKit."

  spec.description  = <<-DESC

This CocoaPods library will help our developers create faster, more consistent SwiftUI interfaces.
                   DESC

  spec.homepage     = "https://github.com/ustadium/designKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "noahbino" => "noahiarrobino@yahoo.com" }
  spec.source       = { :git => "https://github.com/ustadium/designKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"


end
