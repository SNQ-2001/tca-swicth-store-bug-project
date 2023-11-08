//
//  AppFeature.swift
//  
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import SwiftUI
import Root

public struct AppFeature: App {
    public init() {}

    public var body: some Scene {
        WindowGroup {
            RootView(store: .init(
                initialState: RootReducer.State(),
                reducer: { RootReducer() }
            ))
        }
    }
}
