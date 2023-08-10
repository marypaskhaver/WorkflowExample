//  
//  BlueScreen.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import Workflow
import WorkflowUI

struct BlueScreen: Screen {
    func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
        return BlueViewController.description(for: self, environment: environment)
    }
}

final class BlueViewController: ScreenViewController<BlueScreen> {
    required init(screen: BlueScreen, environment: ViewEnvironment) {
        super.init(screen: screen, environment: environment)
    }

    override func screenDidChange(from previousScreen: BlueScreen, previousEnvironment: ViewEnvironment) {
        super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)

        // Update UI
        self.view.backgroundColor = .blue
    }
}
