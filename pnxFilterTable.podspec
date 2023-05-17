#
# Be sure to run `pod lib lint pnxFilterTable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'pnxFilterTable'
  s.version          = '1.0.0'
  s.summary          = 'Custom filter tableView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This is a table view that has a tag-type view structure.'
  s.homepage         = 'https://github.com/tkdehs/pnxFilterTable'
  s.platform         = :ios
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sangdon-Kim' => 'tkdehs0454@naver.com' }
  s.source           = { :git => 'https://github.com/tkdehs/pnxFilterTable.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files     = 'pnxFilterTable/Classes/**/*'
  s.swift-version    = '4.0'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
#  s.source_files  = "pnxFilterTable", "pnxFilterTable/*.{h,m}"
  
  # s.resource_bundles = {
  #   'pnxFilterTable' => ['pnxFilterTable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
