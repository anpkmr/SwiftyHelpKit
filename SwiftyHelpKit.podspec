#
# Be sure to run `pod lib lint SwiftyHelpKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyHelpKit'
  s.version          = '0.1.8'
  s.summary          = 'SwiftyHelpKit will allow you to add some startup code in your app that you initally need'
  s.swift_version    = '4.0'

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
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.static_framework = true
  s.source_files = 'SwiftyHelpKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftyHelpKit' => ['SwiftyHelpKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.pod_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.frameworks = 'UIKit','StoreKit'
  s.dependency 'ObjectMapper', '3.4.2'
  s.dependency 'Alamofire'
  s.dependency 'FBSDKLoginKit', '4.34.0'
  s.dependency 'FBSDKCoreKit', '4.34.0'
  s.dependency 'FBSDKShareKit', '4.34.0'
  s.dependency 'Google/SignIn'
  #s.dependency 'GTMOAuth2', '~>1.1.6'
  end
