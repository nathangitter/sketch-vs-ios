//
//  ShadowsViewController.swift
//  SketchVsQuartz
//
//  Created by Nathan Gitter on 12/13/17.
//  Copyright © 2017 Nathan Gitter. All rights reserved.
//

import UIKit

/// Compares shadow rendering.
class ShadowsViewController: UIViewController {
    
    @IBOutlet weak var renderImageView: UIImageView!
    
    @IBOutlet weak var shadowsImageView: UIImageView! {
        didSet {
            shadowsImageView.alpha = 0
        }
    }
    
    @IBOutlet weak var upperView: UIView! {
        didSet {
            upperView.layer.shadowColor = UIColor.black.cgColor
            upperView.layer.shadowOpacity = 0.5
            upperView.layer.shadowOffset = CGSize(width: 0, height: 2)
            upperView.layer.shadowRadius = 4
        }
    }
    
    @IBOutlet weak var lowerView: UIView! {
        didSet {
            lowerView.layer.shadowColor = UIColor.black.cgColor
            lowerView.layer.shadowOpacity = 0.2
            lowerView.layer.shadowOffset = CGSize(width: 0, height: 4)
            lowerView.layer.shadowRadius = 10
        }
    }
    
    private var views: [UIView] {
        return [upperView, lowerView]
    }
    
    private func updateDisplay(isSketch: Bool) {
        views.forEach { $0.alpha = isSketch ? 0 : 1 }
        shadowsImageView.alpha = isSketch ? 1 : 0
        renderImageView.image = isSketch ? #imageLiteral(resourceName: "sketch") : #imageLiteral(resourceName: "xcode")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        updateDisplay(isSketch: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        updateDisplay(isSketch: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        updateDisplay(isSketch: false)
    }
    
}
