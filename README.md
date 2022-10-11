
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

## Steps To Add Dapi To Xcode Project
### 1. Get Your API Key AppKey
- To start using Dapi APIs, log in or create an account at [Dashboard](https://dashboard.dapi.com/login).
- Follow instructions about [getting your AppKey](https://docs.dapi.com/docs/getting-your-api-keys).
### 2. Set up Backend Server
- **Important**! Using the SDK requires configuring a **backend server**. Read more about the flow and requirements: [Server set-up for SDKs](https://docs.dapi.com/docs/server-set-up-for-sdks).. For development purposes, the server can be easily set up on your local machine.
- Once the server runs successfully, make sure to add the host URL as `App Server URL` on the [Dapi Dashboard](https://dashboard.dapi.com)

Now the SDK will automatically know where to send its requests!

![](https://files.readme.io/e235002-ServerURL.jpg)

### 3. Add Project Bundle ID to Dashboard
1. Open your .xcodeproj file
2. Copy the value of **Bundle Identifier**
![](https://files.readme.io/c75470d-bundle_id.png)
3. Open your app in the [Dashboard](https://dashboard.dapi.com).
4. Select your Application → Go to **App Settings**
5. Click on the **Bundle IDs +** icon, paste the **Bundle ID** value, and click **Submit**

![](https://files.readme.io/66a12a3-dashborad_bundle_id.png)
---

## Install Dapi SDK into the Xcode project
### Cocoapods Installation
To integrate Dapi into your Xcode project using [CocoaPods](https://cocoapods.org/), add to your `Podfile`:
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
3. Add a New package and paste https://github.com/dapi-co/Dapi-iOS
4. Make sure to be on the latest version.

### Manual Installation
1. [Download the latest Dapi SDK from release assets](https://github.com/dapi-co/Dapi-iOS/releases)
2. Extract or unzip the file
3. Drag & drop `DapiSDK.xcframework` to your project’s “Frameworks, Libraries, and Embedded Content” section
4. Under the “General” tab, make sure that the “Copy items if needed” checkbox is checked
---
## Usage
1. Import DapiSDK in your app delegate
```swift
import  DapiSDK
```
2. Add the following to your app delegate's application:didFinishLaunchingWithOptions: method.
```swift
Dapi.shared.start(appKey:  \"#app_key#\",
				  environment: "#environment#", //.sandbox or .production
				  clientUserID: "#client_user_id#")
```
- Replace `app_key` with your appKey from the[ first step](https://docs.dapi.com/docs/ios-sdk-installation#1-get-your-api-key-appkey).
- `environment` value is `sandbox` or `production`. `production` provides access to real banks, `sandbox` can be used to simulate banks' behavior in a testing environment - learn more: [Get Started with Sandbox](https://docs.dapi.com/docs/dapi-api-sandbox).
-  `ClientUserID` is used to distinguish between different end-users. The value for `clientUserID` needs to be set by you. We recommend setting `clientUserID` to your actual user ID that you use to distinguish between users.

3. Run your application and check the console, you should be able to see the following:

![](https://files.readme.io/227e447-Screen_Shot_2022-09-22_at_7.40.18_PM.png)

---
> Congratulations! Now you can use Dapi in your iOS project!
## More
Check out our [API Reference](https://docs.dapi.com/docs/get-started-with-an-sdk) for more detailed information about our SDK.
