//
//  Presentation2Reducer.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import Foundation

public struct Presentation2Reducer: Reducer {
    public init() {}

    public struct State: Equatable {
        public init() {}
    }

    public enum Action {
        case onSignOutButtonTapped
    }
    
    @Dependency(\.dismiss) private var dismiss

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onSignOutButtonTapped:
                return .run { _ in await dismiss() }
            }
        }
    }
}
