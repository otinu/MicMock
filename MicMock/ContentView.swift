//
//  ContentView.swift
//  MicMock
//
//  Created by Apple on 2024/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // ここを中心点と仮決めして作成
        let centerPointer = CGPoint(x: 300, y: 500)
        
        // 各頂点
        let topPointer = CGPoint(x: 300, y: 100)
        let rightPointer = CGPoint(x: 500, y: 500)
        let bottomPointer = CGPoint(x: 300, y: 800)
        let leftPointer = CGPoint(x: 200, y: 500)
        let points: [CGPoint] = [topPointer, rightPointer, bottomPointer, leftPointer]
        
        let shape = Path(){ path in
            
            // 図形の始点
            path.move(to: topPointer)
            
            // to: 移動先点の座標
            // control: 現在点〜移動先点までを曲線で結ぶ際の中間点
            path.addQuadCurve(to: rightPointer,control: CGPoint(x: 480, y: 110))
            path.addQuadCurve(to: bottomPointer,control: CGPoint(x: 520, y: 780))
            path.addQuadCurve(to: leftPointer,control: CGPoint(x: 210, y: 790))
            path.addQuadCurve(to: topPointer,control: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
            // 図形の枠線
            .stroke(Color.red, lineWidth: 5)
        
            // 図形内のグラデーション
              // TODO グラデーションの中心点がズレるのが課題
            .fill(RadialGradient(gradient: Gradient(colors: [.white, Color("CircleMockColor")]), center: .center, startRadius: 50, endRadius: 400))
            
            // 各頂点の表示
            .overlay{
                ForEach(points, id: \.self) { point in
                    Circle()
                        .fill(Color.red)
                        .frame(width: 15, height: 15)
                        .position(x: point.x, y: point.y)
                }
            }
        
        shape
    }
}


#Preview {
    ContentView()
}
