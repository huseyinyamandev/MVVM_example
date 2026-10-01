//
//  CGFloat+Extension.swift
//  MVVM_example
//
//  Created by Huseyin on 29.09.2026.
//

import UIKit

extension CGFloat{
    static let dWidth = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.screen.bounds.width ?? 0
    
    static let dHeight = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.screen.bounds.height ?? 0
    
}
