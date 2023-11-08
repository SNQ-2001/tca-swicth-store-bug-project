//
//  SignInView.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import SwiftUI
import ComposableArchitecture

public struct SignInView: View {
    @ObservedObject private var viewStore: ViewStoreOf<SignInReducer>

    let store: StoreOf<SignInReducer>

    public init(
        store: StoreOf<SignInReducer>
    ) {
        self.store = store
        self.viewStore = .init(store, observe: { $0 })
    }

    public var body: some View {
        Button {
            viewStore.send(.onSignInButtonTapped)
        } label: {
            Text("サインイン")
        }
    }
}
