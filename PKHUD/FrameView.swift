//
//  HUDView.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/16/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// Provides the general look and feel of the PKHUD, into which the eventual content is inserted.
internal class FrameView: UIView {

    internal init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    fileprivate func commonInit() {
        backgroundColor = .clear
        layer.cornerRadius = 9.0
        layer.masksToBounds = true

        self.addSubview(self.content)

    }

    fileprivate var _content = UIView()
    internal var content: UIView {
        get {
            return _content
        }
        set {
            _content.removeFromSuperview()
            _content = newValue
            _content.alpha = 1
            _content.clipsToBounds = true
            _content.contentMode = .center
            frame.size = _content.bounds.size
            self.addSubview(_content)
        }
    }
}
