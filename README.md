# Dapi iOS SDK
[![Swift](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.3_5.4_5.5_5.6-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS-yellowgreen?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DapiBanking.svg?style=flat-square)](https://img.shields.io/cocoapods/v/DapiBanking.svg?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)


## Description

Dapi for iOS is a prebuilt SDK that reduces the time it takes to integrate with Dapi's API and gain access to your users financial data.
The SDK provides direct access to Dapi endpoints and offers optional UI to manage users' accounts and money transfer.


## Requirements

- Mac with Apple silicon running macOS Big Sur 11 or later, or an Intel-based Mac running macOS Catalina 10.15.4 or later.
- Xcode 13.0.0 or later
- Swift 5 or later
- iOS 13.0 or later

## Installation

See the subsections below for details about the different installation methods. Where available.
1. [Cocoapods Installation](#cocoapods-installation)
1. [Swift Package Manager](#swift-package-manager)
1. [Manual Installions](#manual-installions)

### Cocoapods Installation

To integrate Dapi into your Xcode project using [CocoaPods](https://cocoapods.org), add it to your `Podfile`:

```ruby
pod 'DapiBanking'
```
Then, run the following command:

```bash
$ pod install
```


### Swift Package Manager

1. Open project target.
2. Select Swift packages
3. Add New package and paste https://github.com/dapi-co/Dapi-iOS
4. Make sure to be on the latest.

### Manual Installions

1. [Download the latest Dapi SDK from release assets](https://github.com/dapi-co/Dapi-iOS/releases)

2. Extract it then drag & drop DapiSDK.xcframework to your project's "Frameworks, Libraries, and Embedded Content" section under the "General" tab, and make sure that the "Copy items if needed" checkbox is checked

## Usage

1. Import DapiSDK framework in your app delegate

    ```swift
    import DapiSDK
    ```

2. Add the following to your app delegate's application:didFinishLaunchingWithOptions: method.

    ```swift
		Dapi.shared.start(appKey: <#app_key#>, clientID: <#client_user_id#>)
    ```

	Replace `app_key` with your application. Find it [Getting your API keys](https://docs.dapi.com/docs/getting-your-api-keys).

	`ClientUserID` is used to distinguish between different users on the same device. The value for ClientUserID needs to be set by you. We recommend setting clientUserID to your actual user ID that you use to distinguish between users. You should update the clientUserID once the user logs out and another user logs in.

3. Add your Bundle Identifier to be the same as the bundleID you set on the dashboard.Find it [Configure Bundle Identifier](https://docs.dapi.com/docs/how-to-integrate-with-ios-sdk#start-sdk).

## More

Check out our [API Reference](https://docs.dapi.com/docs/get-started-with-an-sdk) for more detailed information about our SDK.
