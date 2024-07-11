Pod::Spec.new do |s|
s.name              = "NetworkSessionKit"
s.version           = "1.0.2"
s.summary           = "NetworkSessionKit is a network lib to work with HTTP requests"
s.homepage          = "https://github.com/jadernunes/NetworkSessionKit.git"
s.author            = "Jáder Nunes - https://jadernunes.com"
s.platform          = :ios, "14.0"

s.swift_version     = '5.0'
s.source_files  = "Sources/**/*.{h,m,swift}"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.source = { :git => "git@github.com:jadernunes/NetworkSessionKit.git", :branch => "master", :tag => "#{s.version}" }
s.frameworks = 'Foundation', 'UIKit', 'SwiftUI'

s.dependency 'Alamofire', '5.8.1'
s.dependency 'LocalizeKit', '1.0.1'

s.pod_target_xcconfig = {
  'FRAMEWORK_SEARCH_PATHS' => '$(inherited)',
  'BITCODE_GENERATION_MODE' => 'bitcode'
}

end
