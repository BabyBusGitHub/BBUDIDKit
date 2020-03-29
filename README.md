# BBUDIDKit

[![CI Status](https://img.shields.io/travis/humin/BBUDIDKit.svg?style=flat)](https://travis-ci.org/humin/BBUDIDKit)
[![Version](https://img.shields.io/cocoapods/v/BBUDIDKit.svg?style=flat)](https://cocoapods.org/pods/BBUDIDKit)
[![License](https://img.shields.io/cocoapods/l/BBUDIDKit.svg?style=flat)](https://cocoapods.org/pods/BBUDIDKit)
[![Platform](https://img.shields.io/cocoapods/p/BBUDIDKit.svg?style=flat)](https://cocoapods.org/pods/BBUDIDKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BBUDIDKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BBUDIDKit'
```

## Author

humin, humin1102@126.com

## License

BBUDIDKit is available under the MIT license. See the LICENSE file for more info.

## SDK说明

获取idfa方法苹果审核期间对获取idfa方法进行机器扫码，故对获取idfa方法进行混淆处理。

* 混淆规则

把原字符串进行base64加密处理

* API使用

内部有提供2个宏获取IDFA唯一标识，数据有存储在UserDefault中
```
//（唯一标识）idfa 大写带-
#define     BB_GENERATE_IDFA            [BBUDIDAPI value]
//（唯一标识）idfa 大写不带-
#define     BB_GENERATE_OPENID          [BBUDIDAPI formatUUIDString:[BBUDIDAPI value]]
```
