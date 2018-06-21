//
//  BottomView.swift
//  SequencingAnimations
//
//  Created by Mani Ramezan on 3/1/18.
//  Copyright © 2018 Mani Ramezan. All rights reserved.
//

import UIKit

internal class BottomView: UIView {
    let button = UIButton(type: .roundedRect)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initSubviews()
    }
    
    private func initSubviews() {
        button.setTitle("Dismiss", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        addSubview(button)
        button.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.edges.equalToSuperview()
        }
    }
}
