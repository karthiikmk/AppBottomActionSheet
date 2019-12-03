//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import UIKit

public protocol AnimatorConvenience: class {
    var manager: HalfSheetPresentationManager? { get }
}

extension AnimatorConvenience {

    //
    // MARK: Auxilery View
    //

    var auxileryView: UIView? {
        return topVCProvider?.topVC.view
    }

    var auxileryTransition: HalfSheetTopVCTransitionStyle? {
        return topVCProvider?.topVCTransitionStyle
    }

    var shouldFadeAuxilery: Bool {
        return manager?.auxileryTransition?.isFade == true
    }

    var shouldSlideAuxilery: Bool {
        return manager?.auxileryTransition?.isSlide == true
    }

    //
    // MARK: Container View
    //

    var containerView: UIView? {
        return manager?.presentationController?.containerView
    }

    var containerHeight: CGFloat {
        return containerView?.bounds.height ?? 0.0
    }

    var containerWidth: CGFloat {
        return containerView?.bounds.width ?? 0.0
    }

    var presentedContentHeight: CGFloat {
        return manager?.presentationController?.presentedViewController.view.bounds.height ?? 0.0
    }

    //
    // MARK: Scroll View
    //

    weak var managedScrollView: UIScrollView? {
        return manager?.presentationController?.managedScrollView
    }

    var isScrolling: Bool {
        return managedScrollView?.isScrolling ?? false
    }

    //
    // MARK: Misc
    //

    func dismissPresentedVC() {
        manager?.presentationController?.presentedViewController.dismiss(animated: true)
    }
}

extension AnimatorConvenience {

    var respondingVC: HalfSheetPresentableProtocol? {

        if let pc = manager?.presentationController?.presentedViewController as? HalfSheetPresentableProtocol {
            return pc
        }

        if let nc = manager?.presentationController?.presentedViewController as? UINavigationController, let pc = nc.viewControllers.last as? HalfSheetPresentableProtocol {
            return pc
        }

        return nil
    }

    var topVCProvider: HalfSheetTopVCProviderProtocol? {

        if let pc = manager?.presentationController?.presentedViewController as? HalfSheetTopVCProviderProtocol {
            return pc
        }

        if let nc = manager?.presentationController?.presentedViewController as? UINavigationController, let pc = nc.viewControllers.last as? HalfSheetTopVCProviderProtocol {
            return pc
        }

        return nil
    }
}
