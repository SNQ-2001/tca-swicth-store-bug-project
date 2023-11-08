//
//  Presentation1View.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import SwiftUI
import ComposableArchitecture
import Presentation2

public struct Presentation1View: View {
    @ObservedObject private var viewStore: ViewStoreOf<Presentation1Reducer>

    let store: StoreOf<Presentation1Reducer>

    public init(
        store: StoreOf<Presentation1Reducer>
    ) {
        self.store = store
        self.viewStore = .init(store, observe: { $0 })
    }

    public var body: some View {
        // MARK: `NavigationStack`がないと正常に動作する(ただ、navigationTitleを表示したい)
        /// ```
        /// List {
        ///     Button {
        ///         viewStore.send(.onShowPresentation2ButtonTapped)
        ///     } label: {
        ///         Text("Presentation2View表示")
        ///     }
        /// }
        /// .sheet(store: store.scope(state: \.$presentation2, action: Presentation1Reducer.Action.presentation2)) { store in
        ///     Presentation2View(store: store)
        /// }
        /// ```

        // MARK: `NavigationStack`があるとバグる
        NavigationStack {
            List {
                Button {
                    viewStore.send(.onShowPresentation2ButtonTapped)
                } label: {
                    Text("Presentation2View表示")
                }
            }
            .navigationTitle("Presentation1View")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(store: store.scope(state: \.$presentation2, action: Presentation1Reducer.Action.presentation2)) { store in
                Presentation2View(store: store)
            }
        }
    }
}
