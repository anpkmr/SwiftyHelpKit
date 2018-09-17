#
# Be sure to run `pod lib lint SwiftyHelpKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyHelpKit'
  s.version          = '0.1.0'
  s.summary          = 'SwiftyHelpKit will allow you to add some startup code in your app that you initally need'
  s.swift_version = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  SwiftyHelpKit will allow you to add some startup code in your app that you initally need, Install framework and you don't have to write same code again and again.
                       DESC

  s.homepage         = 'https://github.com/anpkmr/SwiftyHelpKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anpkmr' => 'anup227kumar@gmail.com' }
  s.source           = { :git => 'https://github.com/anpkmr/SwiftyHelpKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftyHelpKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftyHelpKit' => ['SwiftyHelpKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'ObjectMapper'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'AFNetworking', '~> 2.3'
end
