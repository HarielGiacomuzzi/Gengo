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
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    for (int i = 0; i < 6; i++) {
        
        [self setupNotifications:@"essa notificaçao VAI acontecer" optionOne:@"sayonara" optionTwo:@"ohayo" day:i imageNamed:@"oi" rightAnswer:@1];
        
    }
    
    return YES;
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

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    NSLog(@"%@", identifier);
    
    if (completionHandler) {
        
        completionHandler();
    }
}

-(void)setupNotifications:(NSString *)question
                optionOne:(NSString *)optionOne
                optionTwo:(NSString *)optionTwo
                      day:(NSInteger )day
               imageNamed:(NSString *)image
              rightAnswer:(NSNumber *)answer{
    
    UIUserNotificationType userNotificationTypes = ( UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound );
    
    UIMutableUserNotificationAction *optionA = [[UIMutableUserNotificationAction alloc] init];
    optionA.identifier = @"optionA";
    optionA.title = optionOne;
    optionA.activationMode = UIUserNotificationActivationModeBackground;
    optionA.destructive = NO;
    
    UIMutableUserNotificationAction *optionB = [[UIMutableUserNotificationAction alloc] init];
    optionB.identifier = @"Option B";
    optionB.title = optionTwo;
    optionB.activationMode = UIUserNotificationActivationModeBackground;
    optionB.destructive = NO;
    
    UIMutableUserNotificationCategory *notificationCategory = [[UIMutableUserNotificationCategory alloc] init];
    notificationCategory.identifier = @"notificationCategory";
    NSArray *actions = [[NSArray alloc] initWithObjects:optionA, optionB, nil];
    [notificationCategory setActions:actions forContext:UIUserNotificationActionContextDefault];
    [notificationCategory setActions:actions forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [[NSSet alloc] initWithObjects:notificationCategory, nil];
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = question;
    notification.alertAction = @"responder";
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.userInfo = @{@"image" : image, @"rightAnswer" : answer};
    notification.category = @"notificationCategory";
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:[NSDate date]]; // gets the year, month, day,hour and minutesfor today's date
    NSLog(@"%@",components);
//    [components setDay:components.day + day];
//    [components setHour: 16];
    [components setMinute:components.minute + day];
    [calendar setTimeZone: [NSTimeZone defaultTimeZone]];
    NSDate *dateToFire = [calendar dateFromComponents:components];
    
    [notification setFireDate: dateToFire];
    [notification setTimeZone: [NSTimeZone defaultTimeZone]];
    
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}


@end
