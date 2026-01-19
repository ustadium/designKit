Pod::Spec.new do |spec|
  spec.name         = "UstadiumDesignKit"
  spec.version      = "0.0.3"  # Bump version since you're fixing it
  spec.summary      = "A design kit for the Ustadium project providing reusable UI components."
  
  spec.description  = <<-DESC
This CocoaPods library will help our developers create faster, more consistent SwiftUI interfaces.
                   DESC
  
  spec.homepage     = "https://github.com/ustadium/designKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "noahbino" => "noahiarrobino@yahoo.com" }
  spec.source       = { :git => "https://github.com/ustadium/designKit.git", :tag => "#{spec.version}" }
  
  spec.platform     = :ios, '17.0'  # Fixed from 26.0
  spec.ios.deployment_target = '17.0'
  
  spec.source_files = "UstadiumDesignKit/**/*.{swift}"
  
  spec.swift_versions = ['5.9']
  spec.requires_arc = true
end