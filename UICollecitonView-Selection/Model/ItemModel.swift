//
//  ItemModel.swift
//  UICollecitonView-Selection
//
//  Created by zuolin on 2020/3/22.
//

import Foundation

class ItemModel {
    let itemType: ItemModel.itemType
    
    var isSelected: Bool = false
    
    init(itemType: ItemModel.itemType) {
        self.itemType = itemType
    }
}

extension ItemModel {
    enum itemType: String, CaseIterable {
        case all
        case c
        case go
        case java
        case javaScript
        case php
        case python
        case ruby
        case rust
        case scala
        case swift
    }
}

protocol SelectedItemProtocol {
    var text: String { get }
}

extension ItemModel.itemType: SelectedItemProtocol {
    var text: String {
        return self.rawValue
    }
}
