//
//  HomeView.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import SwiftUI
import ComposableArchitecture
import Tab1

public struct HomeView: View {
    @ObservedObject private var viewStore: ViewStoreOf<HomeReducer>

    let store: StoreOf<HomeReducer>

    public init(
        store: StoreOf<HomeReducer>
    ) {
        self.store = store
        self.viewStore = .init(store, observe: { $0 })
    }
    
    public var body: some View {
        // MARK: `TabView`がないと正常に動作する
        /// ```
        /// Tab1View(
        ///     store: store.scope(state: \.tab1, action: HomeReducer.Action.tab1)
        /// )
        /// ```

        // MARK: `TabView`があるとバグる
        TabView {
            Tab1View(
                store: store.scope(state: \.tab1, action: HomeReducer.Action.tab1)
            )
            .tabItem { Label("Tab1", systemImage: "1.circle") }

            Text(
                "今回は使わないので空"
            )
            .tabItem { Label("Tab2", systemImage: "2.circle") }
        }
    }
}
