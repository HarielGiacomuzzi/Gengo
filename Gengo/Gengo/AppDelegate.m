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
    
    [self notificationStuff];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"WatchDictionaryCopy" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *notificationArray = dictionary[@"New item"];

    for (int i = 0; i < 3; i++) {
        
        //choses a random question from plist file
        int size = (int)notificationArray.count;
        int index = arc4random() % size;
        NSArray *question = notificationArray[index];
        NSString *portuguese = question[0];
        NSString *romanji = question[1];
        NSString *image = question[2];
        NSString *rightAnswer = question[3];
        NSString *wrongAnswer = question[4];
        NSString *notification = question[5];
        
        //randomizes answer order
        int rnd = (arc4random() % 30)+1;
        if(rnd % 5 == 0) {
            [self setupNotifications:notification optionOne:rightAnswer optionTwo:wrongAnswer day:i imageNamed:image rightAnswer:@0 portuguese:portuguese romanji:romanji];
        } else {
            [self setupNotifications:notification optionOne:wrongAnswer optionTwo:rightAnswer day:i imageNamed:image rightAnswer:@1 portuguese:portuguese romanji:romanji];
        }

        
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

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    
    NSNumber *right = notification.userInfo[@"rightAnswer"];
    
    
    if (([identifier  isEqual: @"A"] && [right  isEqual: @0]) || ([identifier  isEqual: @"B"] && [right  isEqual: @1])) {
        NSLog(@"certa respostaaaaaa");
    } else {
        NSLog(@"burroooooo");
    }
    
    if (completionHandler) {
        completionHandler();
    }
}

-(void)setupNotifications:(NSString *)question
                optionOne:(NSString *)optionOne
                optionTwo:(NSString *)optionTwo
                      day:(NSInteger )day
               imageNamed:(NSString *)image
              rightAnswer:(NSNumber *)answer
               portuguese:(NSString *)portuguese
                  romanji:(NSString *)romanji{
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = [NSString stringWithFormat:@"%@ A) %@ B) %@",question,optionOne,optionTwo];
    notification.alertAction = @"responder";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    notification.userInfo = @{
                              @"image" : image,
                              @"rightAnswer" : answer,
                              @"portuguese" : portuguese,
                              @"romanji" : romanji,
                              @"optionA" : optionOne,
                              @"optionB" : optionTwo,
                              @"question" : question
                              };
    
    notification.category = @"notificationCategory";
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:[NSDate date]]; // gets the year, month, day,hour and minutesfor today's date
    [components setMinute:components.minute + day];
    [calendar setTimeZone: [NSTimeZone defaultTimeZone]];
    NSDate *dateToFire = [calendar dateFromComponents:components];
    
    [notification setFireDate: dateToFire];
    [notification setTimeZone: [NSTimeZone defaultTimeZone]];
    
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

-(void)notificationStuff {
    UIUserNotificationType userNotificationTypes = ( UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound );
    
    UIMutableUserNotificationAction *optionA = [[UIMutableUserNotificationAction alloc] init];
    optionA.identifier = @"A";
    optionA.title = @"A";
    optionA.activationMode = UIUserNotificationActivationModeBackground;
    optionA.destructive = NO;
    
    UIMutableUserNotificationAction *optionB = [[UIMutableUserNotificationAction alloc] init];
    optionB.identifier = @"B";
    optionB.title = @"B";
    optionB.activationMode = UIUserNotificationActivationModeBackground;
    optionB.destructive = NO;
    
    UIMutableUserNotificationCategory *notificationCategory = [[UIMutableUserNotificationCategory alloc] init];
    notificationCategory.identifier = @"notificationCategory";
    NSArray *actions = [[NSArray alloc] initWithObjects:optionB, optionA, nil];
    [notificationCategory setActions:actions forContext:UIUserNotificationActionContextDefault];
    [notificationCategory setActions:actions forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [[NSSet alloc] initWithObjects:notificationCategory, nil];
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}


@end
