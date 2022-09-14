//
//  RoundView.swift
//  Assignment1
//
//  Created by Flynn Pham on 06/08/2022.
//
import SwiftUI

struct RoundView : View {
    var icon : Image
    
    var body: some View {
        ZStack {
            icon.clipShape(Circle()).background(Circle().foregroundColor(Color.white))
            icon.clipShape(Circle()).overlay(Circle().stroke(Color.black,lineWidth: 4)).shadow(radius: 10)
        }
        
        
    }
}

struct RoundViewPreview : PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            RoundView(icon: Image("A6MProfile"))
        }
        
    }
}
