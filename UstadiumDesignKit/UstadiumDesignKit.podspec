
Pod::Spec.new do |spec|

  spec.platform = :ios, '17.0' 
  spec.platform = :ios, '17.0'
  spec.name         = "UstadiumDesignKit"
  spec.version      = "0.0.1"
  spec.summary = "A design kit for the Ustadium project providing reusable UI components."
  
  spec.description  = <<-DESC

This CocoaPods library will help our developers create faster, more consistent SwiftUI interfaces.
                   DESC

  spec.homepage     = "https://github.com/ustadium/designKit"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "noahbino" => "noahiarrobino@yahoo.com" }

  spec.source       = { :git => "https://github.com/ustadium/designKit.git", :tag => "#{spec.version}" }

  spec.source_files  = "UDS/**/*.{h,m,swift}"


end
