//
//  RootView.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import SwiftUI
import Home
import SignIn

public struct RootView: View {
    @ObservedObject private var viewStore: ViewStoreOf<RootReducer>

    let store: StoreOf<RootReducer>

    public init(
        store: StoreOf<RootReducer>
    ) {
        self.store = store
        self.viewStore = .init(store, observe: { $0 })
    }

    public var body: some View {
        IfLetStore(store.scope(state: \.currentState, action: { $0 })) { store in
            SwitchStore(store) { state in
                switch state {
                case .signIn:
                    CaseLet(/RootReducer.State.CurrentState.signIn, action: RootReducer.Action.signIn) {
                        SignInView(store: $0)
                    }
                case .home:
                    CaseLet(/RootReducer.State.CurrentState.home, action: RootReducer.Action.home) {
                        HomeView(store: $0)
                    }
                }
            }
        } else: {
            ProgressView()
        }
    }
}
