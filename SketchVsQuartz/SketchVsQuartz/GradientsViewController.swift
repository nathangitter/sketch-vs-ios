//
//  GradientsViewController.swift
//  SketchVsQuartz
//
//  Created by Nathan Gitter on 12/13/17.
//  Copyright © 2017 Nathan Gitter. All rights reserved.
//

import UIKit

/// Compares gradient rendering.
class GradientsViewController: UIViewController {
    
    @IBOutlet weak var renderImageView: UIImageView!
    
    @IBOutlet weak var gradientsImageView: UIImageView! {
        didSet {
            gradientsImageView.alpha = 0
        }
    }
    
    @IBOutlet weak var topView: UIView! {
        didSet {
            topView.layer.addSublayer(orangeGradientLayer)
        }
    }
    
    @IBOutlet weak var lowerLeftView: UIView! {
        didSet {
            lowerLeftView.layer.addSublayer(grayGradientLayer)
        }
    }
    
    @IBOutlet weak var lowerRightView: UIView! {
        didSet {
            lowerRightView.layer.addSublayer(blueGradientLayer)
        }
    }
    
    private lazy var orangeGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.colors = [UIColor(hex: 0xDC2121).cgColor, UIColor(hex: 0xE9C315).cgColor]
        return layer
    }()
    
    private lazy var grayGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        layer.colors = [UIColor(hex: 0xFFFFFF).cgColor, UIColor(hex: 0x000000).cgColor]
        return layer
    }()
    
    private lazy var blueGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0, y: 1)
        layer.endPoint = CGPoint(x: 1, y: 0)
        layer.colors = [UIColor(hex: 0x58A7F8).cgColor, UIColor(hex: 0x143B8A).cgColor, UIColor(hex: 0xE65BFF).cgColor]
        layer.locations = [0, 0.5, 1]
        return layer
    }()
    
    private var allViews: [UIView] {
        return [topView, lowerLeftView, lowerRightView]
    }
    
    private func updateDisplay(isSketch: Bool) {
        allViews.forEach { $0.alpha = isSketch ? 0 : 1 }
        gradientsImageView.alpha = isSketch ? 1 : 0
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        orangeGradientLayer.frame = topView.bounds
        grayGradientLayer.frame = lowerLeftView.bounds
        blueGradientLayer.frame = lowerRightView.bounds
    }
    
}
