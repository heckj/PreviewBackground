//
//  PreviewBackground.swift
//
//  Created by Joseph Heck on 3/13/20.
//  Copyright © 2020 Joseph Heck. All rights reserved.
//

import SwiftUI

/// Creates a colored background underneath an enclosed view that matches
/// from the environment settings - so that previews can have a dark or light
/// background while experimenting on macOS
public struct PreviewBackground<Content>: View where Content: View {
    @Environment(\.colorScheme) public var colorSchemeMode

    public let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        ZStack {
            if colorSchemeMode == .dark {
                Color.black
            } else {
                Color.white
            }
            content()
        } //.statusBar(hidden: true) <-- only works for iOS, compiler error for macOS
    }
}

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
