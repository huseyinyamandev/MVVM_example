//
//  UIView+Extension.swift
//  MVVM_example
//
//  Created by Huseyin on 29.09.2026.
//
import UIKit

extension UIView {
 
    func pinToEdgeOf(view: UIView){
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
