//
//  SwiftUIView.swift
//  
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import SwiftUI
import Presentation1

public struct Tab1View: View {
    @ObservedObject private var viewStore: ViewStoreOf<Tab1Reducer>

    let store: StoreOf<Tab1Reducer>

    public init(
        store: StoreOf<Tab1Reducer>
    ) {
        self.store = store
        self.viewStore = .init(store, observe: { $0 })
    }

    public var body: some View {
        VStack(spacing: 50) {
            Button {
                viewStore.send(.onShowPresentation1ButtonTapped)
            } label: {
                Text("Presentation1表示")
            }
            
            Button {
                viewStore.send(.onSignOutButtonTapped)
            } label: {
                Text("サインアウト")
            }
        }
        .sheet(store: store.scope(state: \.$presentation1, action: Tab1Reducer.Action.presentation1)) { store in
            Presentation1View(store: store)
        }
    }
}
