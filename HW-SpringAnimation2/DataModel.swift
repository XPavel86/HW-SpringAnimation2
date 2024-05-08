//
//  DataModel.swift
//  HW-SpringAnimation2
//
//  Created by Pavel Dolgopolov on 21.04.2024.
//

struct DataModel {
    
    func getRandomAnimate() -> Animate {
       let allPresets = AnimationPreset.allCases
       let randomIndexPreset = Int.random(in: 0..<allPresets.count)
       let preset = allPresets[randomIndexPreset].rawValue
       
       let allCurves = AnimationCurve.allCases
       let randomIndexCurve = Int.random(in: 0..<allCurves.count)
       let curve = allCurves[randomIndexCurve].rawValue
       
       let force = Double.random(in: 0.5...3)
       let duration = Double.random(in: 0.5...3)
       let delay = Double.random(in: 0.5...1)
       let damping = Double.random(in: 0...1)
       let velocity = Double.random(in: 0...1)
       let scaleX = Double.random(in: 0...5)
       let scaleY = Double.random(in: 0...5)
       let rotate = Double.random(in: -5...5)
       
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

 
