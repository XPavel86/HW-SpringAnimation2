//
//  DataModel.swift
//  HW-SpringAnimation2
//
//  Created by Pavel Dolgopolov on 21.04.2024.
//

import Foundation
import SpringAnimation

struct Animate {
    var preset: String = "squeeze"
    var curve: String = "spring"
    var force: CGFloat = 0
    var duration: CGFloat = 3
    var delay: CGFloat = 0
    var damping: CGFloat = 0
    var velocity: CGFloat = 0
    var scaleX: CGFloat = 0
    var scaleY: CGFloat = 0
    var rotate: CGFloat = 0
    
    func getRandomAnimate() -> Animate {
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
}

 
