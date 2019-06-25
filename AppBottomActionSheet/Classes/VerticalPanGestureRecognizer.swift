//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation
import UIKit.UIGestureRecognizerSubclass

public class VerticalPanGestureRecognizer: UIPanGestureRecognizer {

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with:event)

        if let view = self.view, abs(velocity(in: view).x) > abs(velocity(in: view).y) {
            state = .failed
            return
        }
    }
}
