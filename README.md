# PreviewBackground

[![Actions Status](https://github.com/heckj/PreviewBackground/workflows/CI/badge.svg)](https://github.com/heckj/PreviewBackground/actions)
![swift-5.1](https://img.shields.io/badge/Swift-5.1-orange.svg "Swift 5.1")
![swiftpm](https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat "SwiftPM Compatible")
![@heckj](https://img.shields.io/badge/twitter-@heckj-blue.svg?style=flat "Twitter: @heckj")
[![codecov](https://codecov.io/gh/heckj/PreviewBackground/branch/master/graph/badge.svg)](https://codecov.io/gh/heckj/PreviewBackground)

SwiftUI component that provides a flat background color for Preview based on the environment setting.

This allows it to be used to provide background shadings appropriate to the mode, regardless of device:

```swift
#if DEBUG
struct PreviewBackground_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in

                PreviewBackground(content: {
                    Text("hi")
                })
                    .environment(\.colorScheme, colorScheme)
                    .frame(width: 100, height: 100, alignment: .center)
                    .previewDisplayName("\(colorScheme)")
            }
        }
    }
}
#endif
```

## Build and test

    git clone https://github.com/heckj/PreviewBackground
    cd PreviewBackground
    swift test -v
    swiftformat --lint . && swiftlint
