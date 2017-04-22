//
//  QuadroButton.swift
//  QuadroButton
//
//  Created by Rustam Yuzmukhametov on 22/04/2017.
//  Copyright © 2017 Rustam Yuzmukhametov. All rights reserved.
//

import UIKit

class QuadroButton: UIView {

    var buttons:[UIButton]! = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.clear
        
        let buttonWidth = self.frame.width / 2
        let buttonHeight = self.frame.height / 2
        let padding:CGFloat = 1.0
        let buttonSize = CGSize(width: buttonWidth - padding, height: buttonHeight - padding)
        
        self.buttons = []
        // 01
        // 23
        for index in 0..<4 {
            let buttonX = index % 2 == 0 ? 0 : buttonWidth + padding
            let buttonY = index / 2 == 0 ? 0 : buttonHeight + padding
            let buttonFrame = CGRect(origin: CGPoint(x:buttonX, y:buttonY), size: buttonSize)
            //
            let button = UIButton(type: UIButtonType.system)
            button.frame = buttonFrame.insetBy(dx: 0.5, dy: 0.5)
            button.setTitleColor(UIColor.white   , for: UIControlState.normal)
            button.backgroundColor = UIColor.gray
            self.addSubview(button)
            self.buttons.append(button)
            button.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
        
        self.buttons[0].autoresizingMask.update(with: [.flexibleRightMargin, .flexibleBottomMargin])
        self.buttons[1].autoresizingMask.update(with: [.flexibleLeftMargin, .flexibleBottomMargin])
        self.buttons[2].autoresizingMask.update(with: [.flexibleRightMargin, .flexibleTopMargin])
        self.buttons[3].autoresizingMask.update(with: [.flexibleLeftMargin, .flexibleTopMargin])
    }

    func setButtonTitles(_ titles:[String]) {
        if titles.count != 4 {
            return
        }
        for (index, button) in buttons.enumerated() {
            let title = titles[index]
            button.setTitle(title, for: UIControlState.normal)
        }
    }
    
    func setButtonBackgroundColor(_ buttonBackgroundColor:UIColor) {
        for button in buttons {
            button.backgroundColor = buttonBackgroundColor
        }
    }

}
