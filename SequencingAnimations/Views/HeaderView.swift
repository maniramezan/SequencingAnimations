//
//  HeaderView.swift
//  SequencingAnimations
//
//  Created by Mani Ramezan on 3/1/18.
//  Copyright © 2018 Mani Ramezan. All rights reserved.
//

import UIKit
import SnapKit

internal class HeaderView: UIView {
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initSubviews()
    }
    
    private func initSubviews() {
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
        label.numberOfLines = 0
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
