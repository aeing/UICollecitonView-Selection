//
//  ViewModel.swift
//  UICollecitonView-Selection
//
//  Created by zuolin on 2020/3/22.
//

import Foundation

class ViewModel {
    var reloadClosure: (() -> ())?
    
    var dataSource: [ItemModel] = []
    
    var isMultiple: Bool = false
    
    init() {
        setupDataSource()
    }
    
    private func setupDataSource() {
        ItemModel.itemType.allCases.forEach { (itemType) in
            let itemModel = ItemModel(itemType: itemType)
            dataSource.append(itemModel)
        }
    }
    
    public func updateDataSource(indexPath: IndexPath) {
        let itemType = dataSource[indexPath.item].itemType
                
        if isMultiple {
            if itemType == .all {
                dataSource.forEach {
                    if $0.itemType == .all {
                        $0.isSelected = !$0.isSelected
                    } else {
                        $0.isSelected = false
                    }
                }
            } else {
                dataSource.forEach {
                    if $0.itemType == .all {
                        $0.isSelected = false
                    } else if $0.itemType == itemType {
                        $0.isSelected = !$0.isSelected
                    }
                }
            }
        } else {
            dataSource.forEach { $0.isSelected = ($0.itemType == itemType) }
        }
        
        if let reloadClosure = reloadClosure {
            reloadClosure()
        }
    }
}
