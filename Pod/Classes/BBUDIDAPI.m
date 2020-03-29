//
//  BBUDIDAPI.m
//  BBUDIDKit
//
//  Created by babybus on 2020/3/29.
//

#import "BBUDIDAPI.h"
#import "BBUDIDUtility.h"
@import AdSupport.ASIdentifierManager;

const NSString * BB_IDFA_KEY = @"com.babybus.idfa";

@implementation BBUDIDAPI

+ (NSString *)value
{
    static NSString *idfa = @"";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        idfa = [[NSUserDefaults standardUserDefaults] valueForKey:BB_IDFA_KEY];
        if (idfa.length == 0) {
            //代码混淆IDFA标识
            NSString *new_adsClsString = BB_UNCONFUSED_STR_METHOD(@"QVNJZGVudGlmaWVyTWFuYWdlcg==");
            NSString *new_adsAPI = BB_UNCONFUSED_STR_METHOD(@"YWR2ZXJ0aXNpbmdJZGVudGlmaWVy");
            
            Class cls = NSClassFromString(new_adsClsString);
            if ([cls respondsToSelector:@selector(sharedManager)]) {
                id obj = [cls performSelector:@selector(sharedManager)];
                SEL sel = NSSelectorFromString(new_adsAPI);
                if ([obj respondsToSelector:sel]) {
                    NSUUID *adsIdentifier = [obj performSelector:sel];
                    idfa = [adsIdentifier UUIDString];
                }
            }
            if ((idfa.length == 0) || [idfa isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
                idfa = [self openUDID];
            }
            if (idfa.length > 0) {
                [[NSUserDefaults standardUserDefaults] setValue:idfa forKey:BB_IDFA_KEY];
            }
        }
    });
    return idfa;
}

+ (NSString *)formatUUIDString:(NSString *)uuidString {
    if (uuidString && [uuidString isEqualToString:@"00000000-0000-0000-0000-000000000000"]==NO) {
        NSString *temp = [uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""];
        if (temp && temp.length>0) {
            NSString *formatString = [temp uppercaseString];
            return formatString;
        }
    }
    
    return nil;
}

+ (NSString *)openUDID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

@end
