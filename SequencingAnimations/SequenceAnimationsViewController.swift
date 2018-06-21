//
//  SequenceAnimationsViewController.swift
//  SequencingAnimations
//
//  Created by Mani Ramezan on 2/28/18.
//  Copyright © 2018 Mani Ramezan. All rights reserved.
//

import UIKit
import SnapKit

class SequenceAnimationsViewController: UIViewController {

    private let contentScrollView = UIScrollView()
    private let contentView = UIView()
    private let closeButton = UIButton()
    private let headerView = HeaderView()
    private let avatarImageView = UIImageView(image: #imageLiteral(resourceName: "Zee"))
    private let detailsViewContainer = UIView()
    private let detailsView = DetailsView()
    private let bottomView = BottomView()
    
    private var bottomViewHeightConstraint: Constraint?
    
    let avatarImageViewWidth: CGFloat = 157
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sideMargin = 16
        
        view.backgroundColor = UIColor.yellow
        
        //
        // Scroll view
        //
        view.addSubview(contentScrollView)
        contentScrollView.snp.makeConstraints { (make) in
            make.right.left.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.bottom)
        }
        
        //
        // Content view
        //
        contentScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
            make.height.greaterThanOrEqualToSuperview()
        }
        
        //
        // Close button
        //
        closeButton.alpha = 0
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.setTitleColor(.gray, for: .highlighted)
        closeButton.addTarget(self,
                              action: #selector(onCloseButtonTapped(button:forEvent:)),
                              for: .touchUpInside)
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.right.equalToSuperview().inset(sideMargin)
            make.width.height.equalTo(16)
        }
        
        //
        // Header view
        //
        headerView.alpha = 0
        contentView.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(sideMargin)
            make.right.equalTo(closeButton.snp.left).offset(-10)
            make.top.equalToSuperview().offset(40)
        }
        
        //
        // Avatar Image View
        //
        avatarImageView.contentMode = .redraw
        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.width.equalTo(avatarImageViewWidth)
            make.height.equalTo(387)
            make.right.equalToSuperview().offset(avatarImageViewWidth)
        }
        
        //
        // Details view
        //
        detailsView.alpha = 0
        contentView.addSubview(detailsView)
        detailsView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(sideMargin - 1)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(avatarImageView.snp.centerY)
        }
        
        //
        // Buttom buttons view
        //
        contentView.addSubview(bottomView)
        bottomView.button.addTarget(self,
                                    action: #selector(bottomViewButtonTapped(button:forEvent:)),
                                    for: .touchUpInside)
        bottomView.snp.makeConstraints { (make) in
            bottomViewHeightConstraint = make.top.equalTo(contentView.snp.bottom).offset(bottomView.bounds.height).constraint
            make.left.right.equalToSuperview().inset(sideMargin)
        }
    }
    
    func performAnimation() {
        self.contentScrollView.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.2, delay: 0.5, options: [],
                       animations: {
                        self.headerView.alpha = 1
        }, completion: { _ in
            let firstTransition: CGFloat = -52
            let secondTransition: CGFloat = -40
            UIView.animateKeyframes(withDuration: 0.8,
                                    delay: 0.7,
                                    options: UIViewKeyframeAnimationOptions(rawValue: 0),
                                    animations: {
                                        UIView.addKeyframe(withRelativeStartTime: 0,
                                                           relativeDuration: 0.2,
                                                           animations: {
                                                            self.avatarImageView.setTransform(rotationInDegrees: -35)
                                        })
                                        UIView.addKeyframe(withRelativeStartTime: 0,
                                                           relativeDuration: 0.3,
                                                           animations: {
                                                            self.avatarImageView.center.x += firstTransition
                                        })
                                        UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                           relativeDuration: 0.2,
                                                           animations: {
                                                            self.avatarImageView.center.x += secondTransition
                                        })
                                        UIView.addKeyframe(withRelativeStartTime: 0.4,
                                                           relativeDuration: 0.2,
                                                           animations: {
                                                            self.avatarImageView.setTransform(rotationInDegrees: -29.5)
                                        })
                                        UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                           relativeDuration: 0.1,
                                                           animations: {
                                                            self.avatarImageView.setTransform(rotationInDegrees: -30.5)
                                        })
                                        UIView.addKeyframe(withRelativeStartTime: 0.7,
                                                           relativeDuration: 0.1,
                                                           animations: {
                                                            self.avatarImageView.setTransform(rotationInDegrees: -30)
                                        })
                                        
            }, completion: { _ in
                self.avatarImageView.snp.updateConstraints { (make) in
                    make.right.equalToSuperview().offset(self.avatarImageViewWidth + firstTransition + secondTransition)
                }
                self.contentView.bringSubview(toFront: self.avatarImageView)
                let detailsViewMaskView = UIView(frame: self.detailsView.bounds)
                detailsViewMaskView.backgroundColor = self.view.backgroundColor
                self.detailsViewContainer.addSubview(detailsViewMaskView)
                UIView.animateKeyframes(withDuration: 0.6,
                                        delay: 0,
                                        options: [.calculationModeLinear],
                                        animations: {
                                            UIView.addKeyframe(withRelativeStartTime: 0,
                                                               relativeDuration: 0.8,
                                                               animations: {
                                                                detailsViewMaskView.frame.origin.x += detailsViewMaskView.frame.size.width
                                            })
                                            UIView.addKeyframe(withRelativeStartTime: 0,
                                                               relativeDuration: 1,
                                                               animations: {
                                                                self.detailsView.alpha = 1
                                            })
                }, completion: { _ in
                    detailsViewMaskView.removeFromSuperview()
                    self.bottomView.snp.makeConstraints { (make) in
                        self.bottomViewHeightConstraint?.deactivate()
                        make.top.greaterThanOrEqualTo(self.detailsView.snp.bottom).offset(32).priority(.medium)
                        make.bottom.equalToSuperview().inset(26).priority(.high)
                    }
                    UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 0.6,
                                   initialSpringVelocity: 0,
                                   options: [.curveEaseIn],
                                   animations: {
                                    self.view.layoutIfNeeded()
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.4,
                                       animations: {
                                        self.closeButton.alpha = 1
                        }, completion: { _ in
                            let intersectionRect = self.contentScrollView.bounds.intersection(self.bottomView.frame)
                            let bottomViewHeight = self.bottomView.frame.height
                            if intersectionRect.height < bottomViewHeight {
                                let bottomOffset = CGPoint(x: 0, y: self.contentScrollView.contentSize.height - self.contentScrollView.bounds.size.height)
                                self.contentScrollView.setContentOffset(bottomOffset, animated: true)
                            }
                            self.contentScrollView.isUserInteractionEnabled = true
                        })
                    })
                })
            })
        })
    }
    
    // MARK: event handlers

    @objc func bottomViewButtonTapped(button: UIButton, forEvent event: UIEvent) {
        dismiss(animated: true, completion: nil)
    }

    @objc func onCloseButtonTapped(button: UIButton, forEvent event: UIEvent) {
        dismiss(animated: true, completion: nil)
    }
}

