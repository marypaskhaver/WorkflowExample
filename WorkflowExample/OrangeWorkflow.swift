//  
//  OrangeWorkflow.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import Workflow
import WorkflowUI

// MARK: Input and Output

struct OrangeWorkflow: Workflow {
    enum Output {
        case switchToBlueScreen
    }
}

// MARK: State and Initialization

extension OrangeWorkflow {
    struct State {}

    func makeInitialState() -> OrangeWorkflow.State {
        return State()
    }

    func workflowDidChange(from previousWorkflow: OrangeWorkflow, state: inout State) {}
}

// MARK: Actions

extension OrangeWorkflow {
    enum Action: WorkflowAction {
        typealias WorkflowType = OrangeWorkflow
        
        case switchScreens

        func apply(toState state: inout OrangeWorkflow.State) -> OrangeWorkflow.Output? {
            switch self {
            case .switchScreens:
                return .switchToBlueScreen
            }
        }
    }
}

// MARK: Rendering

extension OrangeWorkflow {
    typealias Rendering = OrangeScreen

    func render(state: OrangeWorkflow.State, context: RenderContext<OrangeWorkflow>) -> Rendering {
        let sink = context.makeSink(of: Action.self)
        
        return OrangeScreen(onButtonTapped: {
            sink.send(.switchScreens)
        })
    }
}
