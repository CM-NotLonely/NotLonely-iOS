//
//  InputTextField.swift
//  NotLonely-iOS
//
//  Created by plusub on 4/3/16.
//  Copyright © 2016 cm. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class InputTextField: UITextField {
    var disposeBag = DisposeBag()
    
    var lineColor = UIColor.whiteColor()
    
    var bottomBorder: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.NLInputTextFieldLine().CGColor
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.leftViewMode = .Always
        self.layer.addSublayer(bottomBorder)
        observeSelect()
    }
    
    func setlineColor(color: UIColor) {
        lineColor = color
    }
    
    func setLeftImage(imageName: String) {
        let view = UIView(frame: CGRectMake(0, 0, 40, 30))
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.frame = CGRectMake(0, 0, 23, 26)
        view.addSubview(imageView)
        self.leftView = view
    }
    
    func setPlaceHolderTextColor(text: String) {
        self.attributedPlaceholder = NSAttributedString(string: text,
                                                        attributes:[NSForegroundColorAttributeName: UIColor.init(white: 1, alpha: 0.5)])
    }
    
    func observeSelect() {
        self.rx_controlEvent(.EditingDidBegin)
            .subscribeNext{ [weak self] _ in
                self?.bottomBorder.backgroundColor = self!.lineColor.CGColor
            }
            .addDisposableTo(disposeBag)
        
        self.rx_controlEvent(.EditingDidEnd)
            .subscribeNext{ [weak self] _ in
                self?.bottomBorder.backgroundColor = UIColor.NLInputTextFieldLine().CGColor
            }
            .addDisposableTo(disposeBag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomBorder.frame = CGRectMake(0, self.bounds.size.height - 1.5, self.bounds.size.width, 1.5)
    }
}
