//
//  Extension.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/08/02.
//

import Foundation
import UIKit

extension UIViewController {
    func showActivityIndicatory() {
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0);
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.style =
        UIActivityIndicatorView.Style.large
        actInd.tag = 111
        self.view.addSubview(actInd)
        actInd.startAnimating()
    }
    
    func hideActivityIndicatory() {
        if let actInd = self.view.viewWithTag(111) {
            actInd.removeFromSuperview()
        }
    }
}

extension UIView {
    func styleView()  {
        layer.cornerRadius = layer.bounds.width / 2
        clipsToBounds = true
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }
}
