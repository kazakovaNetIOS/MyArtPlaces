//
//  RatingControl.swift
//  MyArtPlaces
//
//  Created by Natalia Kazakova on 15.08.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK - Properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    // MARK - Initialization
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK - Button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        
        print("Button pressed ")
    }
    
    // MARK - Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for _ in 1...starCount {
            
            let button = UIButton()
            button.backgroundColor = .red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            ratingButtons.append(button)
        }
    }
}
