//
//  ViewController.swift
//  AppBottomActionSheet
//
//  Created by karthikAdaptavant on 03/21/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import Foundation

public class DismissalAnimator: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, AnimatorConvenience {

    public weak var manager: HalfSheetPresentationManager?

    var isFromGesture: Bool = false
    var animator: UIViewPropertyAnimator?
    var interuptableAnimator: UIViewImplicitlyAnimating?

    public init(manager: HalfSheetPresentationManager) {
        super.init()
        self.manager = manager
    }

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        switch isFromGesture {
        case true:
            return TransitionConfiguration.Dismissal.durationAfterGesture
            
        case false:
            guard let manager = self.manager, let respondingView = manager.respondingVC, let appearanceProvider = respondingView as? HalfSheetAppearanceProtocol else {
                return TransitionConfiguration.Presentation.duration
            }            
            return appearanceProvider.dismissAnimationDuration
        }
    }

    public func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        guard let interupt = interuptableAnimator else {
            interuptableAnimator = transition(using: transitionContext)
            return interuptableAnimator!
        }
        
        return interupt
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        interuptableAnimator = transition(using: transitionContext)
    }

    private func transition(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {

        let presentedControllerView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        weak var weakManager = manager

        let finalTransform = CGAffineTransform(translationX: 0, y: shouldSlideAuxilery ? containerHeight : presentedContentHeight)

        func animate() {
            presentedControllerView.layer.transform = finalTransform.as3D
            weakManager?.presentationController?.presentingViewContainer.layer.transform = .identity
            weakManager?.presentationController?.backgroundView.alpha = 0.0
            weakManager?.auxileryView?.alpha =  self.shouldFadeAuxilery ? 0.0 : 1.0
            weakManager?.auxileryView?.layer.transform =  self.shouldSlideAuxilery ? finalTransform.as3D : .identity
        }

        func complete(completed: Bool) {

            let finished = completed && !transitionContext.transitionWasCancelled
            if finished {
                weakManager?.dismissComplete()
                transitionContext.finishInteractiveTransition()
            }
            transitionContext.completeTransition(finished)
        }

        let duration = transitionDuration(using: transitionContext)
        let timing = UISpringTimingParameters(dampingRatio: 1.3)

        animator = UIViewPropertyAnimator(
            duration: duration * 2.5,
            timingParameters: timing
        )

        animator?.addAnimations(animate)
        animator?.addCompletion { complete(completed: $0 == .end) }
        animator?.startAnimation()

        return animator!
    }

    override public func cancel() {
        super.cancel()

        animator?.pauseAnimation()

        let duration: CGFloat = CGFloat(TransitionConfiguration.Dismissal.duration)
        let timing = UISpringTimingParameters(dampingRatio: 0.7)

        animator?.continueAnimation(
            withTimingParameters: timing,
            durationFactor: duration
        )
    }

    override public func finish() {
        super.finish()

        animator?.pauseAnimation()

        let duration: CGFloat = CGFloat(TransitionConfiguration.Dismissal.duration)
        let timing = UISpringTimingParameters(dampingRatio: 1.2)

        animator?.continueAnimation(
            withTimingParameters: timing,
            durationFactor: duration
        )
    }

    override public func update(_ percentComplete: CGFloat) {
        super.update(percentComplete)
        animator?.fractionComplete = percentComplete
    }
}
