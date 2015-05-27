//
//  AppDelegate.m
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"xSCNItsJNZ1V8CXicJgeFPi6FWg2fxmgdWryq9Km"
                  clientKey:@"z5Alloxw5UFpf4MIWuSCmVPSsOhDO3lbm67Zytxv"];
    
    [FBLoginView class];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Facebook Initialization
    [PFFacebookUtils initializeFacebook];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:150.0/255.0 green:130.0/255.0 blue:169.0/255.0 alpha:1.0]];
    
    
    UIUserNotificationType userNotificationTypes = ( UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound );
    
    UIMutableUserNotificationAction *optionA = [[UIMutableUserNotificationAction alloc] init];
    optionA.identifier = @"optionA";
    optionA.title = @"Option A";
    optionA.activationMode = UIUserNotificationActivationModeBackground;
    optionA.destructive = NO;
    
    UIMutableUserNotificationAction *optionB = [[UIMutableUserNotificationAction alloc] init];
    optionB.identifier = @"optionB";
    optionB.title = @"Option B";
    optionB.activationMode = UIUserNotificationActivationModeBackground;
    optionB.destructive = NO;
    
    UIMutableUserNotificationCategory *notificationCategory = [[UIMutableUserNotificationCategory alloc] init];
    notificationCategory.identifier = @"notificationCategory";
    NSArray *actions = [[NSArray alloc] initWithObjects:optionA, optionB, nil];
    [notificationCategory setActions:actions forContext:UIUserNotificationActionContextDefault];
    [notificationCategory setActions:actions forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [[NSSet alloc] initWithObjects:notificationCategory, nil];
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:categories];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"Alert Body";
    notification.alertAction = @"Alert Action";
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.userInfo = @{@"key" : @"value"};
    notification.category = @"notificationCategory";

    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
 
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //[SaveUtility SyncUser];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[PFFacebookUtils session] close];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"recebido");
}

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler{
    UIWindow *win = self.window;
    if (win != nil) {
        [win.rootViewController restoreUserActivityState:userActivity];
    }
    
    return YES;
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    NSLog(@"%@", identifier);
    
    if (completionHandler) {
        
        completionHandler();
    }
}


@end
