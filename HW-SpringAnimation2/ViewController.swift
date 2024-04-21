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
        var preset: String = ""
        var curve: String = ""
        var force: CGFloat = 0
        var duration: CGFloat = 0
        var delay: CGFloat = 0
        var damping: CGFloat = 0
        var velocity: CGFloat = 0
        var scaleX: CGFloat = 0
        var scaleY: CGFloat = 0
        var rotate: CGFloat = 0
    }

    private var animate = Animate()
    
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
        
        updateLabel()
        
        animate = getRandomAnimate()
    }
    
    @IBAction func pressButton(_ sender: SpringButton) {
        springView.animation = animate.preset
        springView.curve = animate.curve
        springView.force = animate.force
        springView.duration = animate.duration
        springView.delay = animate.delay
        springView.damping = animate.damping
        springView.velocity = animate.velocity
        springView.scaleX = animate.scaleX
        springView.scaleY = animate.scaleY
        springView.rotate = animate.rotate
        springView.animate()
        
        updateLabel()
        
        animate = getRandomAnimate()
        
        sender.setTitle("Run \(animate.preset)", for: .normal)
    }
    
    private func getRandomAnimate() -> Animate {
        let allPresets = AnimationPreset.allCases
        let randomIndexPreset = Int.random(in: 0..<allPresets.count)
        let preset = allPresets[randomIndexPreset].rawValue
        
        let allCurves = AnimationCurve.allCases
        let randomIndexCurve = Int.random(in: 0..<allCurves.count)
        let curve = allCurves[randomIndexCurve].rawValue
        
        let force = CGFloat.random(in: 0.5...3)
        let duration = CGFloat.random(in: 0.5...3)
        let delay = CGFloat.random(in: 0.5...1)
        let damping = CGFloat.random(in: 0...1)
        let velocity = CGFloat.random(in: 0...1)
        let scaleX = CGFloat.random(in: 0...5)
        let scaleY = CGFloat.random(in: 0...5)
        let rotate = CGFloat.random(in: -5...5)
        
        let animate = Animate(preset: preset,
                              curve: curve,
                              force: force,
                              duration: duration,
                              delay: delay,
                              damping: damping,
                              velocity: velocity,
                              scaleX: scaleX,
                              scaleY: scaleY,
                              rotate: rotate)
        
        return animate
    }
    
    private func updateLabel() {
        springLabel.text = """
                    preset: \(springView.animation)
                    curve: \(springView.curve)
                    force: \(String(format: "%.2f", springView.force))
                    duration: \(String(format: "%.2f", springView.duration))
                    delay: \(String(format: "%.2f", springView.delay))
                    damping: \(String(format: "%.2f", springView.damping))
                    velocity: \(String(format: "%.2f", springView.velocity))
                    scale: \(String(format: "%.2f", springView.scaleX))
                    rotate: \(String(format: "%.2f", springView.rotate))
                    """
    }
}
