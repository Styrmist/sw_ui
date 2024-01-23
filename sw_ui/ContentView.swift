//
//  ContentView.swift
//  sw_ui
//
//  Created by Kirill Danilov on 23.01.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    var shouldSet = true
    @Published var size: CGSize = .zero {
        didSet {
            shouldSet = false
        }
    }
}

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    var body: some View {
           ZStack {
               // 1. ImageView as the base layer
               mainView(hide: true) {
                   imgView(viewModel.size)
                       .frame(width: viewModel.size.width, height: viewModel.size.height)
               }

               // 2. Background View
               backgroundView

               // 3. The rest of the content
               mainView(hide: false) {
                   imageView
                       .layoutPriority(1)
                       .opacity(0)
               }
           }
           .background(Color.gray)
//           .ignoresSafeArea() // Apply to the entire ZStack if needed
       }
    
    func mainView<Content: View>(
        hide: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        HStack(spacing: .zero) {
            Spacer(minLength: 50)
            
            VStack(spacing: .zero) {
                Spacer(minLength: 20)
                verticalUpper
                    .opacity(hide ? 0: 1)
                Spacer(minLength: 20)
                content()
                Spacer().frame(height: 15) // Spacing of 15 points

                Text("nanit") // Text moved under the imageView
                    .opacity(hide ? 0: 1)

                Spacer()
                    .layoutPriority(1)
            }
            
            Spacer(minLength: 50)
        }
    }

    
    @ViewBuilder
    var backgroundView: some View {
        Image(.background)
            .resizable()
            .aspectRatio(contentMode: .fit)
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
                let size = updateSize(using: proxy)
                let width = size.width
                let height = size.height
                let smallCircleX = width / 2 + cos(degreesToRadians(angleOffset)) * (width / 2 - smallSize / 2)
                let smallCircleY = height / 2 - sin(degreesToRadians(angleOffset)) * (height / 2 - smallSize / 2)
                
                ZStack {
                    Circle()
                        .frame(width: width, height: width)
                        .foregroundColor(Color.yellow)
                    
                    Circle()
                        .frame(width: smallSize, height: smallSize)
                        .position(x: smallCircleX, y: smallCircleY)
                        .foregroundColor(Color.red)
                        .offset(x: -smallSize / 2, y: -smallSize / 2)
                }
            }
    }
    
    
    func imgView(_ size: CGSize) -> some View {
        
        let width = size.width
        let height = size.height
        print(size)
        let smallCircleX = width / 2 + cos(degreesToRadians(angleOffset)) * (width / 2 - smallSize / 2)
        let smallCircleY = height / 2 - sin(degreesToRadians(angleOffset)) * (height / 2 - smallSize / 2)
        
        return ZStack {
            Circle()
                .frame(width: width, height: height)
                .foregroundColor(Color.yellow)
            
            Circle()
                .frame(width: smallSize, height: smallSize)
                .position(x: smallCircleX, y: smallCircleY)
                .foregroundColor(Color.red)
                .offset(x: -smallSize / 2, y: -smallSize / 2)
        }
    }
    
    func updateSize(using proxy: GeometryProxy) -> CGSize {
        if viewModel.shouldSet {
            self.viewModel.size = proxy.size
        }
        print(proxy.frame(in: .global))

        return proxy.size
    }
    func degreesToRadians(_ degrees: Double) -> CGFloat {
            return CGFloat(degrees * .pi / 180)
        }
}

#Preview {
    ContentView(viewModel: .init())
}
