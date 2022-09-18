/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Do Ha Minh Long
  ID: s3634734
  Created  date: 16/09/2022
  Last modified: 16/09/2022
  Acknowledgement:
    Reused from Assignment 1
*/

import SwiftUI

struct RoundViewDynamic: View {
    @Binding var name : String
    
    var body: some View {
        ZStack {
            Circle().fill(Color.mint).frame(width: 80, height: 80, alignment: .center)
                .overlay(Circle().stroke(Color.black,lineWidth: 4)).shadow(radius: 10)
            Text(String(name.prefix(1).uppercased())) //Takes the first character in the user's name
                .font(.system(size: 50)).foregroundColor(Color.white)

            
        }
    }
}

struct RoundViewDynamic_Previews: PreviewProvider {
    @State static var name1 = "SS"
    @State static var name2 = "alice"
    @State static var name3 = "onYan"
    
    static var previews: some View {
        VStack {
            RoundViewDynamic(name: $name1)
            RoundViewDynamic(name: $name2)
            RoundViewDynamic(name: $name3)
        }
    }
}
