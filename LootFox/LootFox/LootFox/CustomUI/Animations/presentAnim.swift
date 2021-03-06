//
//  presentAnim.swift
//  LootFox
//
//  Created by Landon Carr on 7/28/18.
//  Copyright © 2018 Landon Carr. All rights reserved.
//

import Foundation
import UIKit

internal class PresentStoryViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    internal var selectedCardFrame: CGRect = .zero
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? MyOffersVC,
            let toViewController = transitionContext.viewController(forKey: .to) as? MyOffersLoadVC else {
                return
        }
        
        // 2
        containerView.addSubview(toViewController.view)
        toViewController.positionContainer(left: 20.0,
                                           right: 20.0,
                                           top: selectedCardFrame.origin.y + 20.0,
                                           bottom: 0.0)
        toViewController.setHeaderHeight(self.selectedCardFrame.size.height - 40.0)
        toViewController.configureRoundedCorners(shouldRound: true)
        
        // 3
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toViewController.positionContainer(left: 0.0,
                                               right: 0.0,
                                               top: 0.0,
                                               bottom: 0.0)
            toViewController.setHeaderHeight(500)
            toViewController.view.backgroundColor = .white
            toViewController.configureRoundedCorners(shouldRound: false)
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.1
    }
    
}
