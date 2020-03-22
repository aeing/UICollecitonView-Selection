//
//  ItemCollectionViewCell.swift
//  UICollecitonView-Selection
//
//  Created by zuolin on 2020/3/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: ItemCollectionViewCell.self)
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8.0
        
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 1.0
        
        label.textAlignment = .center
        label.textColor = .blue
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(textLabel)
        
        let views = [
            "textLabel": textLabel
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[textLabel]|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[textLabel]|", options: [], metrics: nil, views: views))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bindingItemModel(_ itemModel: ItemModel) {
        textLabel.text = itemModel.itemType.text
        
        if itemModel.isSelected {
            textLabel.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        } else {
            textLabel.backgroundColor = .white
        }
    }
}
