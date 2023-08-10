//  
//  BlueWorkflow.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import Workflow
import WorkflowUI

// MARK: Input and Output

struct BlueWorkflow: Workflow {
    typealias Output = Never
}

// MARK: State and Initialization

extension BlueWorkflow {
    struct State {}

    func makeInitialState() -> BlueWorkflow.State {
        return State()
    }

    func workflowDidChange(from previousWorkflow: BlueWorkflow, state: inout State) {}
}

// MARK: Actions

extension BlueWorkflow {
    enum Action: WorkflowAction {
        typealias WorkflowType = BlueWorkflow

        func apply(toState state: inout BlueWorkflow.State) -> BlueWorkflow.Output? {
            switch self {
                // Update state and produce an optional output based on which action was received.
            }
        }
    }
}

// MARK: Rendering

extension BlueWorkflow {
    typealias Rendering = BlueScreen

    func render(state: BlueWorkflow.State, context: RenderContext<BlueWorkflow>) -> Rendering {
       return BlueScreen()
    }
}
