//
//  SplashScreen.swift
//  canteenApp
//
//  Created by Macbook Pro on 17/09/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreen: View {
    
    @State var animationFinished: Bool = false
    @State var animationStarted: Bool = false
    
    var body: some View {
        ZStack {
            Color(hue: 220/360, saturation: 0.19, brightness: 0.98)
                .ignoresSafeArea()
            
            ZStack {
                if animationStarted{
                } else {
                    AnimatedImage(url: getURL())
                        .aspectRatio(contentMode: .fit)
                }
            }
            .animation(.none, value: animationFinished)
                
            
        }
        .opacity(animationFinished ? 0 : 1)
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.65) {
                animationStarted = true
                
                withAnimation(.easeInOut(duration:1.2)) {
                    animationFinished = true
                }
                
            }
        }
    }
    
    func getURL()->URL{
        let bundle = Bundle.main.path(forResource: "Icon", ofType: "gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        
        return url
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
