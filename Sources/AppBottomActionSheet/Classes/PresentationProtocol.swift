//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation
import UIKit

public protocol HalfSheetPresentingProtocol: class {
    var transitionManager: HalfSheetPresentationManager! { get set }
}

public extension HalfSheetPresentingProtocol where Self: UIViewController {

    func presentUsingHalfSheet(_ vc: UIViewController, animated: Bool = true) {
        transitionManager = HalfSheetPresentationManager()
        vc.transitioningDelegate = transitionManager
        vc.modalPresentationStyle = .custom
        present(vc, animated: animated)
    }

    @discardableResult func presentUsingHalfSheetInNC(_ vc: UIViewController, animated: Bool = true) -> UINavigationController {
        let nc = UINavigationController(rootViewController: vc)
        transitionManager = HalfSheetPresentationManager()
        nc.transitioningDelegate = transitionManager
        nc.modalPresentationStyle = .custom
        present(nc, animated: animated)
        return nc
    }
}
