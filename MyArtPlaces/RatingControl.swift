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
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    
    private var ratingButtons = [UIButton]()
    
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
        
        guard let index = ratingButtons.firstIndex(of: button) else { return }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        rating = selectedRating == rating ? 0 : selectedRating
    }
    
    // MARK - Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        // Load button image
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar",
                                 in: bundle,
                                 compatibleWith: self.traitCollection)
        
        let emptyStar = UIImage(named: "emptyStar",
                                in: bundle,
                                compatibleWith: self.traitCollection)
        
        let highlightedStar = UIImage(named: "highlightedStar",
                                     in: bundle,
                                     compatibleWith: self.traitCollection)
        
        for _ in 1...starCount {
            
            let button = UIButton()
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
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
        
        updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
