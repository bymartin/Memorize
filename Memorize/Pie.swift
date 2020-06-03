//
//  Pie.swift
//  Memorize
//
//  Created by Barry Martin on 6/2/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius + cos(CGFloat(startAngle.radians)),
            y: center.y + radius + sin(CGFloat(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: clockwise)        
        p.addLine(to: center)

        return p
    }
    
    
}
