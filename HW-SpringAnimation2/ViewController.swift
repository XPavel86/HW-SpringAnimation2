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
    @IBOutlet var springButton: SpringButton!
    
    override func viewWillLayoutSubviews() {
        springView.layer.cornerRadius = 10
        springButton.layer.cornerRadius = 10
    }
    
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
        
        springView.animation = param.preset
        springView.curve = param.curve
        springView.force = param.force
        springView.duration = param.duration
        springView.delay = param.delay
        springView.damping = param.damping
        springView.velocity = param.velocity
        springView.scaleX = param.scale
        springView.scaleY = param.scale
        springView.rotate = param.rotate
        springView.animate()
    }
    
    func getRandomAnimate() -> (
        
        preset: String,
        curve: String,
        force: CGFloat,
        duration: CGFloat,
        delay: CGFloat,
        damping: CGFloat,
        velocity: CGFloat,
        scale: CGFloat,
        rotate: CGFloat
    ) {
        
        let allPresets = AnimationPreset.allCases
        let randomIndexPreset = Int.random(in: 0..<allPresets.count)
        
        let preset = allPresets[randomIndexPreset]
        
        let allCurves = AnimationCurve.allCases
        let randomIndexCurve = Int.random(in: 0..<allCurves.count)
        
        let curve = allCurves[randomIndexCurve]
        
        let force = CGFloat.random(in: 1...7)
        
        let duration = CGFloat.random(in: 0.5...3)
        
        let delay = CGFloat.random(in: 0.5...1)
        
        let damping = CGFloat.random(in: 0...1)
        
        let velocity = CGFloat.random(in: 0...1)
        
        let scale = CGFloat.random(in: 0...5)
        
        let rotate  = CGFloat.random(in: -5...5)
        
        springLabel.text = "preset: \(preset.rawValue)\ncurve: \(curve.rawValue)\nforce: \(String(format: "%.2f", force))\nduration: \(String(format: "%.2f", duration))\ndelay: \(String(format: "%.2f", delay))\ndamping: \(String(format: "%.2f", damping))\nvelocity: \(String(format: "%.2f", velocity))\nscale: \(String(format: "%.2f", scale))\nrotate: \(String(format: "%.2f", rotate))  "

        return (
            preset.rawValue,
            curve.rawValue,
            force,
            duration,
            delay,
            damping,
            velocity,
            scale,
            rotate
        )
    }
}


