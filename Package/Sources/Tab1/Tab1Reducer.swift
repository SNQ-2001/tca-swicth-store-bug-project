//
//  Tab1Reducer.swift
//
//
//  Created by 宮本大新 on 2023/11/08.
//

import ComposableArchitecture
import Foundation
import Presentation1

public struct Tab1Reducer: Reducer {
    public init() {}

    public struct State: Equatable {
        @PresentationState var presentation1: Presentation1Reducer.State?

        public init() {}
    }

    public enum Action {
        case onShowPresentation1ButtonTapped
        case onSignOutButtonTapped
        case presentation1(PresentationAction<Presentation1Reducer.Action>)
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onShowPresentation1ButtonTapped:
                state.presentation1 = .init()
                return .none
            case .onSignOutButtonTapped:
                return .none
            case .presentation1:
                return .none
            }
        }
        .ifLet(\.$presentation1, action: /Action.presentation1) {
            Presentation1Reducer()
        }
    }
}
