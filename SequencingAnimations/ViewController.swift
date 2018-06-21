//
//  ViewController.swift
//  SequencingAnimations
//
//  Created by Mani Ramezan on 3/1/18.
//  Copyright © 2018 Mani Ramezan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let showAnimationButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAnimationButton.setTitle("Show Animation", for: .normal)
        showAnimationButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        showAnimationButton.addTarget(self,
                                      action: #selector(showAnimationButtonTapped(button:forEvent:)),
                                      for: .touchUpInside)
        view.addSubview(showAnimationButton)
        showAnimationButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    // Mark: Event Handlers
    @objc func showAnimationButtonTapped(button: UIButton, forEvent event: UIEvent) {
        let seqAnimVC = SequenceAnimationsViewController()
        self.present(seqAnimVC, animated: true) {
            seqAnimVC.performAnimation()
        }
    }
}
