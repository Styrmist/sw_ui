//
//  ContentView.swift
//  sw_ui
//
//  Created by Kirill Danilov on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
//            GeometryReader { all in
                
                HStack(spacing: .zero) {
                    Spacer(minLength: 50)
                    
                    VStack(spacing: .zero) {
                        Spacer(minLength: 20)
                        verticalUpper
                        Spacer(minLength: 20)
                        imageView
                            .layoutPriority(1)
                        Spacer()
                            .frame(height: 15)
                        Text("nanit")
                        Spacer()
                            .layoutPriority(1)
                    }
                    
                    Spacer(minLength: 50)
                }
//            }
        }
        
    }
    
    @ViewBuilder
    var backgroundView: some View {
        Image(.background)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    var verticalUpper: some View {
        VStack() {
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
    }
    
    let smallSize: CGFloat = 36
    let angleOffset: Double = 45
    
    var imageView: some View {
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                
                let smallCircleX = width / 2 + cos(degreesToRadians(angleOffset)) * (width / 2 - smallSize / 2)
                let smallCircleY = height / 2 - sin(degreesToRadians(angleOffset)) * (height / 2 - smallSize / 2)
                
                ZStack {
                    Circle()
                        .frame(width: width, height: height)
                        .foregroundColor(Color.yellow)
                    
                    Circle()
                        .frame(width: smallSize, height: smallSize)
                        .position(x: smallCircleX, y: smallCircleY)
                        .foregroundColor(Color.red)
                        .offset(x: -smallSize / 2, y: -smallSize / 1.5)
                }
            }
    }
    
//    func imageView(_ gproxy: GeometryProxy) -> some View {
//        let size = gproxy.size
//            
//        return
//        ZStack {
//
//            GeometryReader { proxy in
//                let width = proxy.size.width
//                let height = proxy.size.height
//                
//                let smallCircleX = width / 2 + cos(degreesToRadians(angleOffset)) * (width / 2 - smallSize / 2)
//                let smallCircleY = height / 2 - sin(degreesToRadians(angleOffset)) * (height / 2 - smallSize / 2)
//                
//                ZStack {
//                    Circle()
//                        .frame(width: width, height: height)
//                        .foregroundColor(Color.yellow)
//                    
//                    Circle()
//                        .frame(width: smallSize, height: smallSize)
//                        .position(x: smallCircleX, y: smallCircleY)
//                        .foregroundColor(Color.red)
//                        .offset(x: -smallSize / 2, y: -smallSize / 2)
//                }
//            }
//            
////            backgroundView
////                .frame(width: size.width, height: size.height)
////                .offset(x: -50, y: -size.width / 2)
//        }
//    }
    
    func degreesToRadians(_ degrees: Double) -> CGFloat {
            return CGFloat(degrees * .pi / 180)
        }
}

#Preview {
    ContentView()
}
