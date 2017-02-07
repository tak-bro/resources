# iOS programming

## Sites
- swift extension: http://realignist.me/code/2016/06/05/swift-snippets.html
- http://swift.leantra.kr/
- https://github.com/JigarM/Infinite-UIITableview-Scroll
- http://pjkstory.blogspot.jp/2016/06/swift-2-swift-tableview-infinite-scroll.html
- https://github.com/johnnyclem/JSON-TableView-in-Swift
- https://www.raywenderlich.com/113388/storyboards-tutorial-in-ios-9-part-1
- http://stackoverflow.com/questions/25902916/ios-8-swift-avaudioplayer-play-remote-audio-wowza-server
- http://stackoverflow.com/questions/34563329/how-to-play-mp3-audio-from-url-in-ios-swift
- https://www.raywenderlich.com/107439/uicollectionview-custom-layout-tutorial-pinterest
- http://www.appcoda.com/instagram-app-parse-swift/
- https://github.com/kenechilearnscode/APISearchTutorial
- http://dev.classmethod.jp/smartphone/iphone/ios-pinterest-layout/
- https://github.com/k-neo/StaggeredGridLayout
- http://zappdesigntemplates.com/collectionview-flow-layout-from-grid-to-list-layout/
- https://github.com/seapy/awesome/blob/master/iOS/library.md#
- 아이폰 개발자를 위한 아이콘 셋: http://www.acrosoft.pe.kr/blog/573
- Hex Color Code를 이용할 수 있게 UIColor 확장하기

```swift
extension UIColor {
    convenience init? (fromHex hex: String) {
        let hexPattern = try! NSRegularExpression(pattern: "^[0-9a-fA-F]{6}$",
                                                  options: [.anchorsMatchLines])
        let range =  NSRange(location: 0, length: hex.characters.count)
        
        guard hexPattern.matches(in: hex, 
                                 options: [],
                                 range: range).count == 1 
        else { return nil }
        
        let positionR = hex.index(hex.startIndex, offsetBy: 2)
        let positionG = hex.index(hex.startIndex, offsetBy: 4)

        guard let r = Double("0x" + hex.substring(to: positionR)),
            let g = Double("0x" + hex.substring(with: positionR..<positionG)),
            let b = Double("0x" + hex.substring(from: positionG)) else { return nil }
        
        self.init(red: CGFloat(r / 255), 
                  green: CGFloat(g / 255), 
                  blue: CGFloat(b / 255), 
                  alpha: 1)
    }
}
```

-
