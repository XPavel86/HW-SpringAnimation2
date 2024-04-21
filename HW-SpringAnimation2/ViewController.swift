//
//  ViewController.swift
//  HW_SpringAnimation
//
//  Created by Pavel Dolgopolov on 19.04.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var springView: SpringView!
    @IBOutlet var springLabel: SpringLabel!
    @IBOutlet var springButton: SpringButton!
    
    struct Animate {
        var preset: String
        var curve: String
        var force: CGFloat
        var duration: CGFloat
        var delay: CGFloat
        var damping: CGFloat
        var velocity: CGFloat
        var scale: CGFloat
        var rotate: CGFloat
    }
    
    var lastAnimate = Animate(
        preset: "",
        curve: "",
        force: 0,
        duration: 0,
        delay: 0,
        damping: 0,
        velocity: 0,
        scale: 0,
        rotate: 0
    )
    
    override func viewWillLayoutSubviews() {
        springView.layer.cornerRadius = 10
        springButton.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        springView.animation = "squeeze"
        springView.curve = "spring"
        springView.duration = 3
        springView.animate()
        
        updateLastAnimationData()
        
        lastAnimate = getRandomAnimate()
    }
    
    @IBAction func pressButton(_ sender: SpringButton) {

        springView.animation = lastAnimate.preset
        springView.curve = lastAnimate.curve
        springView.force = lastAnimate.force
        springView.duration = lastAnimate.duration
        springView.delay = lastAnimate.delay
        springView.damping = lastAnimate.damping
        springView.velocity = lastAnimate.velocity
        springView.scaleX = lastAnimate.scale
        springView.scaleY = lastAnimate.scale
        springView.rotate = lastAnimate.rotate
        
        springView.animate()

        updateLastAnimationData()
        
        lastAnimate = getRandomAnimate()
        sender.setTitle("Run \(lastAnimate.preset)", for: .normal)
    }
    
    func getRandomAnimate() -> Animate {
        let allPresets = AnimationPreset.allCases
        let randomIndexPreset = Int.random(in: 0..<allPresets.count)
        let preset = allPresets[randomIndexPreset].rawValue
        
        let allCurves = AnimationCurve.allCases
        let randomIndexCurve = Int.random(in: 0..<allCurves.count)
        let curve = allCurves[randomIndexCurve].rawValue
        
        let force = CGFloat.random(in: 1...7)
        let duration = CGFloat.random(in: 0.5...3)
        let delay = CGFloat.random(in: 0.5...1)
        let damping = CGFloat.random(in: 0...1)
        let velocity = CGFloat.random(in: 0...1)
        let scale = CGFloat.random(in: 0...5)
        let rotate = CGFloat.random(in: -5...5)
        
        let animate = Animate(preset: preset,
                              curve: curve,
                              force: force,
                              duration: duration,
                              delay: delay,
                              damping: damping,
                              velocity: velocity,
                              scale: scale,
                              rotate: rotate)
        
        return animate
    }
    
    private func updateLastAnimationData() {
        lastAnimate.preset = springView.animation
        lastAnimate.curve = springView.curve
        lastAnimate.force = springView.force
        lastAnimate.duration = springView.duration
        lastAnimate.delay = springView.delay
        lastAnimate.damping = springView.damping
        lastAnimate.velocity = springView.velocity
        lastAnimate.scale = springView.scaleX
        lastAnimate.rotate = springView.rotate
        
        springLabel.text = "preset: \(lastAnimate.preset)\ncurve: \(lastAnimate.curve)\nforce: \(String(format: "%.2f", lastAnimate.force))\nduration: \(String(format: "%.2f", lastAnimate.duration))\ndelay: \(String(format: "%.2f", lastAnimate.delay))\ndamping: \(String(format: "%.2f", lastAnimate.damping))\nvelocity: \(String(format: "%.2f", lastAnimate.velocity))\nscale: \(String(format: "%.2f", lastAnimate.scale))\nrotate: \(String(format: "%.2f", lastAnimate.rotate))"
    }
}


