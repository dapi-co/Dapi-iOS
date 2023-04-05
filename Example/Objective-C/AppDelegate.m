//
//  AppDelegate.m
//  Objective-C
//
//  Created by MSZ on 22/03/2023.
//

#import "AppDelegate.h"
@import DapiSDK;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    [Dapi.shared startWithAppKey:@"ce15a3407b6561da87bd847e27b2f530a6a84279d29d686b3daf60ca2f570cae"
                            environment: DAPIEnvironmentSandbox
                           clientUserID:@"clientID"
                             completion:^(Dapi * _Nullable dapi , NSError * _Nullable error) {
        
    }];
    

    DAPIConfigurations *configurations = [[DAPIConfigurations alloc] init];
    configurations.showTransferErrorResult = YES;
    configurations.showLogos = YES;
    configurations.language = DAPILanguageEn;
    configurations.showTransferSuccessfulResult = YES;
    configurations.showTransferErrorResult = YES;
    configurations.enableNetworkingLogging = YES;
    [DPC.sharedInstance setCountries: [NSArray arrayWithObjects:@"AE",@"US", nil]] ;
    [DPC.sharedInstance setEndpointExtraBody:@{DPCEndpointAll: @{@"key": @"value"}}];
    [DPC.sharedInstance setEndpointExtraHeaderFields:@{DPCEndpointAll: @{@"key": @"value"}}];
    [DPC.sharedInstance setConfigurations:configurations];

    
    DAPIUICustomization *uiCustomization = [DPC.sharedInstance uiCustomization];
    [uiCustomization setTheme: DAPIThemeDynamic];
    [uiCustomization.primaryColor setLightModeHexaCode:@"4287f5222"];
    [DPC.sharedInstance setUICustomization:uiCustomization];

    
    [DPC.sharedInstance setRequestInterceptionCompletion:^NSURLRequest * _Nonnull (DAPIBankConnection * _Nullable connection , NSURLRequest * _Nonnull request )  {

        return  request;
    }];

    [DPC.sharedInstance setResponseInterceptionCompletion:^NSData * _Nullable (DAPIBankConnection * _Nullable connection , DapiURLResponse * _Nonnull response )  {
        
        return  response.data;
    }];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
