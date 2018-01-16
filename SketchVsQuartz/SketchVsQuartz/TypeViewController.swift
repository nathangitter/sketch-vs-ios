//
//  TypeViewController.swift
//  SketchVsQuartz
//
//  Created by Nathan Gitter on 12/13/17.
//  Copyright © 2017 Nathan Gitter. All rights reserved.
//

import UIKit

/// Compares typography rendering.
class TypeViewController: UIViewController {

    @IBOutlet weak var renderImageView: UIImageView!
    
    @IBOutlet weak var typeImageView: UIImageView! {
        didSet {
            typeImageView.alpha = 0
        }
    }
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var loremIpsumLabel: UILabel!
    
    @IBOutlet weak var semiboldLabel: UILabel! {
        didSet {
            configureSemiboldLabel(isSF: true)
        }
    }
    
    @IBOutlet weak var spacingLabel: UILabel!
    
    private var allLabels: [UIView] {
        return [helloLabel, loremIpsumLabel, semiboldLabel, spacingLabel]
    }
    
    @IBOutlet weak var fontFixerSwitch: UISwitch!
    
    @IBOutlet weak var fontFixerLabel: UILabel! {
        didSet {
            fontFixerLabel.alpha = 0.3
        }
    }
    
    @IBAction func fontSelected(_ sender: UISegmentedControl) {
        let isSF = sender.selectedSegmentIndex == 0
        helloLabel.font = isSF ? UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold) : UIFont(name: "Lato-Bold", size: 34)
        loremIpsumLabel.font = isSF ? UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular) : UIFont(name: "Lato-Regular", size: 10)
        configureSemiboldLabel(isSF: isSF)
        spacingLabel.font = isSF ? UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium) : UIFont(name: "Lato-Medium", size: 14)
        fontFixerLabel.isHidden = !isSF
        fontFixerSwitch.isHidden = !isSF
        typeImageView.image = isSF ? (fontFixerSwitch.isOn ? UIImage(named: "type_fixed") : UIImage(named: "type")) : UIImage(named: "type_lato")
    }
    
    @IBAction func switchFlipped(_ sender: UISwitch) {
        typeImageView.image = sender.isOn ? #imageLiteral(resourceName: "type_fixed") : #imageLiteral(resourceName: "type")
        fontFixerLabel.alpha = sender.isOn ? 1 : 0.3
    }
    
    private func updateDisplay(isSketch: Bool) {
        allLabels.forEach { $0.alpha = isSketch ? 0 : 1 }
        typeImageView.alpha = isSketch ? 1 : 0
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
    
    /// Applies the appropraite attributes to the `semiboldLabel`.
    /// If `isSF` is `true`, the font will be San Fransisco.
    /// If `isSF` is `false`, the font will be Lato.
    private func configureSemiboldLabel(isSF: Bool) {
        let text = "This text is \(isSF ? "SF" : "Lato") Semibold 16. It has 25 points of leading."
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        let font = isSF ? UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold) : UIFont(name: "Lato-Semibold", size: 16)
        attributedString.addAttribute(NSAttributedStringKey.font, value: font as Any, range: NSMakeRange(0, attributedString.length))
        semiboldLabel.attributedText = attributedString
    }

}
