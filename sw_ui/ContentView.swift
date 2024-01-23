//
//  ContentView.swift
//  sw_ui
//
//  Created by Kirill Danilov on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    let smallSize: CGFloat = 36
    let angleOffset: Double = 45
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            GeometryReader { all in
                
                HStack(spacing: .zero) {
                    Spacer(minLength: 50)
                    
                    VStack(spacing: .zero) {
                        Spacer(minLength: 20)
                        
                        topView
                        
                        Spacer(minLength: 20)
                        
                        avatar(all.size)
                        .layoutPriority(1)
                        .zIndex(-1)
                        
                        Spacer()
                            .frame(height: 15)
                        
                        Text("nanit")
                        
                        Spacer()
                            .layoutPriority(1)
                    }
                    
                    Spacer(minLength: 50)
                }
            }
        }
    }
    
    func backgroundView(_ size: CGSize) -> some View {
        Image(.background)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(width: size.width, height: size.height)
            .offset(y: 80)
    }
    
    @ViewBuilder
    var topView: some View {
        Text("Today Chirstiano Ronaldo is")
        Spacer()
            .frame(height: 13)
        HStack(spacing: 22) {
            Rectangle()
                .foregroundStyle(.blue)
            Rectangle()
                .foregroundStyle(.red)
            Rectangle()
                .foregroundStyle(.blue)
        }
        .frame(height: 88)
        Spacer()
            .frame(height: 14)
        Text("Years old")
    }
    
    @ViewBuilder
    func avatar(_ allSize: CGSize) -> some View {
        GeometryReader { proxy in
            let width: CGFloat = proxy.size.width
            let height: CGFloat = proxy.size.height
            
            let smallCircleX: CGFloat = width / 2 + cos(degreesToRadians(angleOffset)) * (width / 2 - smallSize / 2)
            let smallCircleY: CGFloat = height / 2 - sin(degreesToRadians(angleOffset)) * (height / 2 - smallSize / 2)
            
            ZStack {
                Circle()
                    .frame(width: width, height: height)
                    .foregroundColor(Color.yellow)
                    .overlay {
                        backgroundView(allSize)
                        
                    }
                
                Circle()
                    .frame(width: smallSize, height: smallSize)
                    .position(x: smallCircleX, y: smallCircleY)
                    .foregroundColor(Color.red)
                    .offset(x: -smallSize / 2, y: -smallSize / 1.5)
            }
        }
    }
    
    func degreesToRadians(_ degrees: Double) -> CGFloat {
            return CGFloat(degrees * .pi / 180)
        }
}

#Preview {
    ContentView()
}
