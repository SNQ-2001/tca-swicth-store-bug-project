//
//  Presentation1Reducer.swift
//  
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import Foundation
import Presentation2

public struct Presentation1Reducer: Reducer {
    public init() {}

    public struct State: Equatable {
        @PresentationState var presentation2: Presentation2Reducer.State?

        public init() {}
    }

    public enum Action {
        case onShowPresentation2ButtonTapped
        case presentation2(PresentationAction<Presentation2Reducer.Action>)
    }
    
    @Dependency(\.dismiss) private var dismiss

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onShowPresentation2ButtonTapped:
                state.presentation2 = .init()
                return .none
            case .presentation2(.presented(.onSignOutButtonTapped)):
                return .run { _ in await dismiss() }
            case .presentation2:
                return .none
            }
        }
    }
}
