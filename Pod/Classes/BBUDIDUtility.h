//
//  BBUDIDUtility.h
//  BBUDIDKit
//
//  Created by babybus on 2020/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//传入原字符串获取混淆后的字符串
#define BB_CONFUSED_STR_METHOD(__string__) \
[BBUDIDUtility encryptedStringForProtect:__string__]

// 传入混淆后的字符串，获取原字符串
#define BB_UNCONFUSED_STR_METHOD(__confusedString__) \
[BBUDIDUtility decryptedStringForProtect:__confusedString__]

@interface BBUDIDUtility : NSObject

/**
 * @brief 获取加密后的字符串方法
 * @param string 需要加密的原字符串
 * @return 返回加密后的字符串
 */
+ (NSString *)encryptedStringForProtect:(NSString *)string;

/**
 * @brief 常量字符串加固所使用的方法 根据传入的加密字符串进行解密，返回解密字符串
 * @param encryptedString 加密过的字符串
 * @return 返回解密后的字符串
 */
+ (NSString *)decryptedStringForProtect:(NSString *)encryptedString;

@end

NS_ASSUME_NONNULL_END
