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
internal class FrameView: UIVisualEffectView {

    internal init() {
        super.init(effect: UIBlurEffect(style: .light))
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    fileprivate func commonInit() {
        backgroundColor = .clear
        layer.cornerRadius = 0.0
        layer.masksToBounds = true

        contentView.addSubview(self.content)

    }

    fileprivate var _content = UIView()
    internal var content: UIView {
        get {
            return _content
        }
        set {
            _content.removeFromSuperview()
            _content = newValue
            _content.alpha = 0.0
            _content.clipsToBounds = true
            _content.contentMode = .center
            frame.size = _content.bounds.size
            contentView.addSubview(_content)
        }
    }
}
