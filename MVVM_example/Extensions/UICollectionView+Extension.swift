//
//  UICollectionView+Extension.swift
//  MVVM_example
//
//  Created by Huseyin on 30.09.2026.
//

import UIKit

extension UICollectionView{
    
    func reloadOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
}
