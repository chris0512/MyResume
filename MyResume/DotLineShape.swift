//
//  DotLineShape.swift
//  MyResume
//
//  Created by Chris on 2024/4/3.
//

import SwiftUI

struct DotLineShape: Shape {
    
    enum LineStyle { case bottomHalf, full, topHalf }
    
    var lineWidth: CGFloat = 10
    var dotSize: CGFloat = 30
    var style: LineStyle = .full
    var dotYPosition: CGFloat {
        switch style {
        case .bottomHalf:
            return 0.2
        case .full:
            return 0.5
        case .topHalf:
            return 0.8
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x: rect.midX - dotSize/2,
                                   y: rect.maxY * dotYPosition - dotSize/2,
                                   width: dotSize,
                                   height: dotSize))
        path.addRect(CGRect(x: rect.midX - (lineWidth/2),
                            y: style == .bottomHalf ? rect.maxY * 0.2 : rect.minY,
                            width: lineWidth,
                            height: style == .full ? rect.height : rect.height*0.8))
        
        
        return path
    }
    
    
}

#Preview {
    VStack(spacing: 0) {
        DotLineShape(style: .bottomHalf)
        DotLineShape()
        DotLineShape(style: .topHalf)
    }
    
}
