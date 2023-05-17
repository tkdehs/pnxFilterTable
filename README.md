# pnxFilterTable

커스텀 필터 테이블
[![Version](https://img.shields.io/cocoapods/v/pnxFilterTable.svg?style=flat)](https://cocoapods.org/pods/pnxFilterTable)
[![License](https://img.shields.io/cocoapods/l/pnxFilterTable.svg?style=flat)](https://cocoapods.org/pods/pnxFilterTable)
[![Platform](https://img.shields.io/cocoapods/p/pnxFilterTable.svg?style=flat)](https://cocoapods.org/pods/pnxFilterTable)

## Example


View 생성 코드
```swift
// view 생성
var pnxFilterTable = PnxFilterTable()
```

카테고리 타이틀 설정
```swift
// 카테고리 타이틀 폰트 설정
self.pnxFilterTable.titleFont = UIFont.systemFont(ofSize: 14, weight: .bold)

// 카테고리 타이틀 컬러 설정
self.pnxFilterTable.titleFontColor = UIColor.black
```

필터 버튼 설정
```swift


// 기본(선택안함) 폰트, 색상, 배경색 설정
self.pnxFilterTable.setDefaultButtonStryle(font: UIFont.systemFont(ofSize: 14, weight: .bold) ,fontColor: UIColor.white, backgroundColor: UIColor.red)

// 선택시 색상, 배경색 설정
self.pnxFilterTable.setSelectedButtonStryle(fontColor: UIColor.white, backgroundColor: UIColor.red)


// 다중 선택 여부 설정
self.pnxFilterTable.isMultipleSelect = true

// 다중 선택 여부 설정
self.pnxFilterTable.isMultipleSelect = true

// 필터간 간격 설정
self.pnxFilterTable.horizontalSpacing = 5
self.pnxFilterTable.verticalSpacing = 5
```

## Screen Shot
<img src="/Example/image/sampleImage.png">


## Installation

pnxFilterTable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'pnxFilterTable'
```

## Author

Sangdon Kim, tkdehs0454@naver.com

## License

pnxFilterTable is available under the MIT license. See the LICENSE file for more info.
