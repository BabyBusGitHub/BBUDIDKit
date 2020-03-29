//
//  BBUDIDUtility.m
//  BBUDIDKit
//
//  Created by babybus on 2020/3/29.
//

#import "BBUDIDUtility.h"

@implementation BBUDIDUtility

/**
 * @brief 获取加密后的字符串方法
 * @param string 需要加密的原字符串
 * @return 返回加密后的字符串
 */
+ (NSString *)encryptedStringForProtect:(NSString *)string
{
    if ([string isKindOfClass:[NSString class]] && string.length > 0) {
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
            NSString *encryptedString = [data base64EncodedStringWithOptions: 0];
            if (encryptedString.length > 0) {
                return encryptedString;
            }
        }
    }
    return @"";
}

/**
 * @brief 常量字符串加固所使用的方法 根据传入的加密字符串进行解密，返回解密字符串
 * @param encryptedString 加密过的字符串
 * @return 返回解密后的字符串
 */
+ (NSString *)decryptedStringForProtect:(NSString *)encryptedString
{
    if ([encryptedString isKindOfClass:[NSString class]] && encryptedString.length > 0)
    {
        NSData *data = [[NSData alloc] initWithBase64EncodedString:encryptedString options:0];
        if (data) {
            NSString *decryptedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (decryptedString.length > 0) {
                return decryptedString;
            }
        }
    }
    return @"";
}

@end
