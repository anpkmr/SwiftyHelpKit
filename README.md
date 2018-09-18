# SwiftyHelpKit

[![CI Status](https://img.shields.io/travis/anpkmr/SwiftyHelpKit.svg?style=flat)](https://travis-ci.org/anpkmr/SwiftyHelpKit)
[![Version](https://img.shields.io/cocoapods/v/SwiftyHelpKit.svg?style=flat)](https://cocoapods.org/pods/SwiftyHelpKit)
[![License](https://img.shields.io/cocoapods/l/SwiftyHelpKit.svg?style=flat)](https://cocoapods.org/pods/SwiftyHelpKit)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyHelpKit.svg?style=flat)](https://cocoapods.org/pods/SwiftyHelpKit)

## How to install 

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
#### Dependancy
##### SwiftyHelpKit Depends on:	
ObjectMapper
Alamofire
FBSDKLoginKit	= 4.34.0
FBSDKCoreKit	= 4.34.0
FBSDKShareKit	= 4.34.0
Google/SignIn	

## Installation

SwiftyHelpKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftyHelpKit'
```

# Basic configuration

## Facebook login configuration:-
1) Login to https://developers.facebook.com/ and configure Your App with Facebook. (i.e. enter the Bundle id of your app in iOS section on the settings page)
2) Add facebook App Id to your project.

### Configure Your info.plist
#### Configure the information property list file (info.plist) with an XML snippet that contains data about your app.
1.Right click on your project's info.plist file and open it as source code.
2. Now copy and paste the follwign XML into your info.plist Body of <dict> ...</dict>
```ruby
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleURLSchemes</key>
<array>
<string>fbYOUR_APP_ID</string>
</array>
</dict>
</array>
<key>FacebookAppID</key>
<string>YOUR_APP_ID</string>
<key>FacebookDisplayName</key>
<string>LetsTestApp</string>
```
For example like this:- fbYOUR_APP_ID = fb1234567965412332222

3. To use any of the facebook dialog modify your info.plist file as
```ruby
<key>LSApplicationQueriesSchemes</key>
<array>
<string>fbapi</string>
<string>fb-messenger-share-api</string>
<string>fbauth2</string>
<string>fbshareextension</string>
</array>
```
4. Connect Your App Delegate

//  AppDelegate.swift
```ruby
import FBSDKCoreKit

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
return true
}

func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
// Add any custom logic here.
return handled
}
```


## Author

anpkmr, anup227kumar@gmail.com

## License

SwiftyHelpKit is available under the MIT license. See the LICENSE file for more info.
