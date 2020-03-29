//
//  BBUDIDAPI.h
//  BBUDIDKit
//
//  Created by babybus on 2020/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBUDIDAPI : NSObject

/**
* @brief 获取设备唯一标识
* @return 返回标识
*/
+ (NSString *)value;
/**
* @brief 去除标识中带-字符串(大写)
* @param uuidString 需要去除标识字符串
* @return 返回不带-字符串字符串
*/
+ (NSString *)formatUUIDString:(NSString *)uuidString;

@end

NS_ASSUME_NONNULL_END
