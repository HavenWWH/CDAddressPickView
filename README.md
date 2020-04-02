# CDAddressPickView

[![CI Status](https://img.shields.io/travis/513433750@qq.com/CDAddressPickView.svg?style=flat)](https://travis-ci.org/513433750@qq.com/CDAddressPickView)
[![Version](https://img.shields.io/cocoapods/v/CDAddressPickView.svg?style=flat)](https://cocoapods.org/pods/CDAddressPickView)
[![License](https://img.shields.io/cocoapods/l/CDAddressPickView.svg?style=flat)](https://cocoapods.org/pods/CDAddressPickView)
[![Platform](https://img.shields.io/cocoapods/p/CDAddressPickView.svg?style=flat)](https://cocoapods.org/pods/CDAddressPickView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CDAddressPickView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CDAddressPickView'
```

## 使用方法
```
[CDAddressPickView createAddressPickViewSelectBlock:^(id obj) {

    CDAddressPickViewModel *model = (CDAddressPickViewModel *)obj;
    NSString *province = model.selectedProvince.name;
    NSString *city = model.selectedCitie.name;
    NSString *area = model.selectedArea.name;
    NSString *addressStr = [province isEqualToString:city] ? [NSString stringWithFormat:@"%@%@", province, area] : [NSString stringWithFormat:@"%@%@%@", province, city, model.selectedArea.name];
    NSLog(@"addressStr %@",addressStr);
}];
```

## Author

513433750@qq.com, 513433750@qq.com

## License

CDAddressPickView is available under the MIT license. See the LICENSE file for more info.
