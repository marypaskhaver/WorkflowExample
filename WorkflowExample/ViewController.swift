//
//  ViewController.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import UIKit
import Workflow
import WorkflowUI

public final class ViewController: UIViewController {
    let containerViewController: UIViewController

    public init() {
        containerViewController = WorkflowHostingController(
            workflow: RootWorkflow()
        )

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        addChild(containerViewController)
        view.addSubview(containerViewController.view)
        containerViewController.didMove(toParent: self)
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        containerViewController.view.frame = view.bounds
    }
}
