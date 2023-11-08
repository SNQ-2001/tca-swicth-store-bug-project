//
//  RootReducer.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import Foundation
import Home
import SignIn

public struct RootReducer: Reducer {
    public init() {}

    public struct State: Equatable {
        var currentState: CurrentState? = .signIn(.init())

        public init() {}

        enum CurrentState: Equatable {
            case signIn(SignInReducer.State)
            case home(HomeReducer.State)
        }
    }

    public enum Action {
        case signIn(SignInReducer.Action)
        case home(HomeReducer.Action)
    }

    public var body: some Reducer<State, Action> {
        Scope(state: \.currentState, action: /.self) {
            Scope(state: /State.CurrentState.signIn, action: /Action.signIn) {
                SignInReducer()
            }
            Scope(state: /State.CurrentState.home, action: /Action.home) {
                HomeReducer()
            }
        }

        Reduce { state, action in
            switch action {
            case .signIn(.onSignInButtonTapped):
                state.currentState = .home(.init())
                return .none
            case .home(.tab1(.onSignOutButtonTapped)):
                state.currentState = .signIn(.init())
                return .none
            case .home(.tab1(.presentation1(.presented(.presentation2(.presented(.onSignOutButtonTapped)))))):
                state.currentState = .signIn(.init())
                return .none
            case .home:
                return .none
            }
        }
    }
}
