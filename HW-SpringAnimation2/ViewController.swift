//
//  ViewController.swift
//  HW_SpringAnimation
//
//  Created by Pavel Dolgopolov on 19.04.2024.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var springView: SpringView!
    @IBOutlet var springLabel: SpringLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let _ = getRandomAnimate()
        
        springView.animation = "squeeze"
        springView.duration = 1
        springView.animate()
    }

    @IBAction func pressButton(_ sender: SpringButton) {

        let param = getRandomAnimate()
        
        sender.setTitle("Run \(param.1)", for: .normal)
        
        springView.animation = param.0
        springView.curve = param.1
        springView.force = param.2
        springView.duration = param.3
        springView.delay = param.4
        springView.animate()
    }
    
    func getRandomAnimate() -> (String, String, CGFloat, CGFloat, CGFloat) {
        
        let allPresets = AnimationPreset.allCases
        let randomIndexPreset = Int.random(in: 0..<allPresets.count)
        
        let preset = allPresets[randomIndexPreset]
        
        let allCurves = AnimationCurve.allCases
        let randomIndexCurve = Int.random(in: 0..<allCurves.count)
        
        let curve = allCurves[randomIndexCurve]
        
        let force = CGFloat.random(in: 0...2)
        
        let duration = CGFloat.random(in: 0...2)
        
        let delay = CGFloat.random(in: 0...2)
        
        springLabel.text = "preset: \(preset.rawValue)\ncurve: \(curve.rawValue)\nforce: \(String(format: "%.2f", force))\nduration: \(String(format: "%.2f", duration))\ndelay: \(String(format: "%.2f", delay)) "

        return (preset.rawValue, curve.rawValue, force, duration, delay)
    }
}


