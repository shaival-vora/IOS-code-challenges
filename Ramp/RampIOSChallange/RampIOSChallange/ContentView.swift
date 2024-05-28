//
//  ContentView.swift
//  RampIOSChallange
//
//  Created by Shaival Vora on 1/25/24.
//

import SwiftUI

struct SmileyFaceView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            GeometryReader { proxy in
                
                Circle() // Head
                    .fill(Color.yellow)
                    .frame(width: 200, height: 200)
                
                HStack(alignment: .top, spacing: 40) {
                    Spacer()
                    Circle() // Left eye
                        .fill(Color.black)
                        .frame(width: 20, height: 20)
                    
                    Circle() // Right eye
                        .fill(Color.black)
                        .frame(width: 20, height: 20)
                    Spacer()
                    
                }
                .position(x: 100, y: 50)
                
                // Nose
                Path { path in
                    path.move(to: CGPoint(x: 100,
                                          y: 70)) // Nose starting point
                    path.addLine(to: CGPoint(x: 100,
                                             y: 100)) // Downward line
                    
                    
                    path.addArc(center: CGPoint(x: 100,
                                                y: 100),
                                radius: 10,
                                startAngle: .degrees(0),
                                endAngle: .degrees(130),
                                clockwise: false)
                }
                .stroke(Color.black, lineWidth: 4)
                
                // Mouth
                Path { path in
                    path.move(to: CGPoint(x: 70,
                                          y: 120))
                    path.addQuadCurve(to: CGPoint(x: 140,
                                                  y: 120),
                                      control: CGPoint(x: 100,
                                                       y: 135))
                }
                .stroke(lineWidth: 4)
            }
            Spacer()
        }
    }
}


struct ContentView: View {
    var body: some View {
        SmileyFaceView()
            .padding()
    }
}

#Preview {
    ContentView()
}
