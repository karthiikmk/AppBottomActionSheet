//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation

class PresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning, AnimatorConvenience {

    weak var manager: HalfSheetPresentationManager?

    public init(manager: HalfSheetPresentationManager) {
        super.init()
        self.manager = manager
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        guard let manager = self.manager, let respondingView = manager.respondingVC, let appearanceProvider = respondingView as? HalfSheetAppearanceProtocol else {
            return TransitionConfiguration.Presentation.duration
        }
        
        return appearanceProvider.presentAnimationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let presentedController = transitionContext.viewController(forKey: .to)!
        let wrappedPresentedView = manager!.presentationController!.wrappingView

        let initialTransform = CGAffineTransform(translationX: 0, y: containerHeight).as3D

        wrappedPresentedView.frame = transitionContext.finalFrame(for: presentedController)
        wrappedPresentedView.layer.transform = initialTransform

        transitionContext.containerView.addSubview(wrappedPresentedView)

        manager?.presentationController?.backgroundView.alpha = 0.0
        manager?.auxileryView?.alpha = shouldFadeAuxilery ? 0.0 : 1.0
        manager?.auxileryView?.layer.transform = shouldSlideAuxilery ? initialTransform : .identity

        weak var weakManager = manager

        let animator = UIViewPropertyAnimator(
            duration: transitionDuration(using: transitionContext),
            timingParameters: UISpringTimingParameters(dampingRatio: 1)
        )

        func animate() {
            wrappedPresentedView.layer.transform = .identity
            weakManager?.presentationController?.presentingViewContainer.layer.transform = backgroundTransform(rect: wrappedPresentedView.frame)
            weakManager?.presentationController?.backgroundView.alpha = 1.0
            weakManager?.auxileryView?.layer.transform = .identity

            UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options:[], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
                    weakManager?.auxileryView?.alpha = 1.0
                }
            })
        }

        func complete(completed: Bool) {
            transitionContext.completeTransition(completed)
            weakManager?.didFinishPresentation()
        }

        animator.addAnimations(animate)
        animator.addCompletion { complete(completed: $0 == .end) }
        animator.startAnimation()
    }

    func backgroundTransform(rect: CGRect) -> CATransform3D {

        //let statusBarHeight = max(28.0, UIApplication.shared.statusBarFrame.height)
        let scale = CGAffineTransform(scaleX: 1, y: 1)
        let transform = CGAffineTransform(translationX: 0, y: 0)

        return transform.concatenating(scale).as3D
    }
}
