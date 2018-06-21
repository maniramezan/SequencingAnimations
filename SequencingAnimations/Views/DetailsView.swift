//
//  DetailsView.swift
//  SequencingAnimations
//
//  Created by Mani Ramezan on 3/1/18.
//  Copyright © 2018 Mani Ramezan. All rights reserved.
//

import UIKit

internal class DetailsView: UIStackView {
    private let line1Label = UILabel()
    private let line2Label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        initSubviews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        initSubviews()
    }
    
    private func initSubviews() {
        
        axis = .vertical
        distribution = .fill
        spacing = 5
        
        line1Label.text = "Lorem ipsum,"
        line1Label.font = UIFont.systemFont(ofSize: 18)
        addArrangedSubview(line1Label)
        
        line2Label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
        line2Label.font = UIFont.systemFont(ofSize: 20)
        line2Label.numberOfLines = 0
        addArrangedSubview(line2Label)
    }
}
