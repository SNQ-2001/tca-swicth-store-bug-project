//
//  HomeReducer.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import Foundation
import Tab1

public struct HomeReducer: Reducer {
    public init() {}

    public struct State: Equatable {
        var tab1: Tab1Reducer.State = .init()

        public init() {}
    }

    public enum Action {
        case tab1(Tab1Reducer.Action)
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tab1:
                return .none
            }
        }

        Scope(state: \.tab1, action: /Action.tab1) {
            Tab1Reducer()
        }
    }
}
