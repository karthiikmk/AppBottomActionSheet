//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation

struct TransitionConfiguration {

    static var scalePercentage: CGFloat = 0.92

    struct Presentation {
        static var duration: TimeInterval = 0.50
    }

    struct Dismissal {
        static var duration: TimeInterval = 0.25
        static var durationAfterGesture: TimeInterval = 1.0
        static var dismissBreakpoint: CGFloat = 100.0
    }
}
