//
//  OrangeScreenView.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import UIKit

class OrangeScreenView: UIView {
    let button: UIButton
    var onButtonTapped: () -> Void

    override public init(frame: CGRect) {
        self.onButtonTapped = {}
        self.button = UIButton(frame: .zero)

        super.init(frame: frame)

        button.setTitle("Go to the blue screen.", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)

        addSubview(button)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        button.frame = CGRect(
            x: bounds.origin.x,
            y: bounds.origin.y,
            width: bounds.size.width,
            height: bounds.size.height
        )
        
    }

    @objc private func buttonTapped(sender: UIButton) {
        onButtonTapped()
    }
}
