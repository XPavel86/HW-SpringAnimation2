//  ViewController.swift
//  HW_SpringAnimation
//
//  Created by Pavel Dolgopolov on 19.04.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var springView: SpringView!
    @IBOutlet var label: UILabel!
    
    // MARK: - Private properties
    private var animate = Animate.randomAnimation
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springView.animation = "squeeze"
        springView.curve = "spring"
        springView.duration = 2.0
        springView.animate()
        
        label.text = animate.description
        
        animate = Animate.randomAnimation
    }
    
    // MARK: - IB Actions
    @IBAction func pressButton(_ sender: UIButton) {
        springView.animation = animate.animation
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
        
        label.text = animate.description
        
        animate = Animate.randomAnimation
        
        sender.setTitle("Run \(animate.animation)", for: .normal)
    }
}
