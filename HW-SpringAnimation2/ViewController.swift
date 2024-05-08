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

    private var animate = Animate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        springView.animation = animate.preset
        springView.curve = animate.curve
        springView.duration = animate.duration
        springView.animate()
        
        updateLabel()
        
        animate = DataModel().getRandomAnimate()
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
        
        animate = DataModel().getRandomAnimate()
        
        sender.setTitle("Run \(animate.preset)", for: .normal)
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
