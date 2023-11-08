//
//  Presentation2View.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import SwiftUI
import ComposableArchitecture

public struct Presentation2View: View {
    @ObservedObject private var viewStore: ViewStoreOf<Presentation2Reducer>

    let store: StoreOf<Presentation2Reducer>

    public init(
        store: StoreOf<Presentation2Reducer>
    ) {
        self.store = store
        self.viewStore = .init(store, observe: { $0 })
    }

    public var body: some View {
        Button {
            viewStore.send(.onSignOutButtonTapped)
        } label: {
            Text("サインアウト")
        }
    }
}
