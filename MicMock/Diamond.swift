//
//  Diamond.swift
//  MicMock
//
//  Created by Apple on 2024/10/29.
//

import SwiftUI

let topPointer = CGPoint(x: 250, y: 0)
let rightPointer = CGPoint(x: 500, y: 250)
let bottomPointer = CGPoint(x: 250, y: 500)
let leftPointer = CGPoint(x: 0, y: 250)
let points: [CGPoint] = [topPointer, rightPointer, bottomPointer, leftPointer]

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX , y: rect.minY ))
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.midY ))
        path.addLine(to: CGPoint(x: rect.midX , y: rect.maxY ))
        path.addLine(to: CGPoint(x: rect.minX , y: rect.midY ))
        path.closeSubpath()
        return path
    }
}

struct DiamondView: View {
    var body: some View {
        Diamond()
            .fill(RadialGradient(gradient: Gradient(colors: [.white, Color("CircleMockColor")]), center: .center, startRadius: 20, endRadius: 200))
            .frame(width: 500, height: 500)
            .overlay{
                ForEach(points, id: \.self) { point in
                    Circle()
                        .fill(Color.red)
                        .frame(width: 15, height: 15)
                        .position(x: point.x, y: point.y)
                }
            }
    }
}

#Preview {
    DiamondView()
}
