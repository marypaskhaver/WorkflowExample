//  
//  RootWorkflow.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import Workflow
import WorkflowUI

// MARK: Input and Output

struct RootWorkflow: Workflow {    
    enum Output {}
}

// MARK: State and Initialization

extension RootWorkflow {
    enum State {
        case orangeScreen
        case blueScreen
    }

    func makeInitialState() -> RootWorkflow.State {
        return .orangeScreen
    }

    func workflowDidChange(from previousWorkflow: RootWorkflow, state: inout State) {}
}

// MARK: Actions

extension RootWorkflow {
    enum Action: WorkflowAction {
        typealias WorkflowType = RootWorkflow
        
        case switchToBlueScreen

        func apply(toState state: inout RootWorkflow.State) -> RootWorkflow.Output? {
            switch self {
            case .switchToBlueScreen:
                state = .blueScreen
            }
            
            return nil
        }
    }
}

// MARK: Rendering

extension RootWorkflow {
    typealias Rendering = AnyScreen

    func render(state: RootWorkflow.State, context: RenderContext<RootWorkflow>) -> Rendering {
        switch state {
        case .orangeScreen:
            let orangeScreen = OrangeWorkflow()
                .rendered(
                    in: context,
                    outputMap: { output -> Action in
                        switch output {
                        case .switchToBlueScreen:
                            return .switchToBlueScreen
                        }
                    }
                )
            
            return AnyScreen(orangeScreen)
        case .blueScreen:
            let blueScreen = BlueWorkflow().rendered(in: context)
            return AnyScreen(blueScreen)
        }
    }
}
