//  
//  OrangeScreen.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import Workflow
import WorkflowUI

struct OrangeScreen: Screen {
    var onButtonTapped: () -> Void

    func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
        return OrangeViewController.description(for: self, environment: environment)
    }
}

final class OrangeViewController: ScreenViewController<OrangeScreen> {
    private var orangeScreenView: OrangeScreenView!
    
    required init(screen: OrangeScreen, environment: ViewEnvironment) {
        super.init(screen: screen, environment: environment)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orangeScreenView = OrangeScreenView(frame: view.bounds)
        updateView(with: screen)

        view.addSubview(orangeScreenView)
    }

    override func screenDidChange(from previousScreen: OrangeScreen, previousEnvironment: ViewEnvironment) {
        super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)

        // Update UI
        self.view.backgroundColor = .orange
    }
    
    private func updateView(with screen: OrangeScreen) {
        orangeScreenView.onButtonTapped = screen.onButtonTapped
    }

}
