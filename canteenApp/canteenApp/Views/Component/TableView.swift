/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Do Ha Minh Long
  ID: s3634734
  Created  date: 13/09/2022
  Last modified: 13/09/2022
  Acknowledgement:
    Reused from Assignment 1
*/
import SwiftUI

struct TableView : View {
    
    let title: String
    let content: String
    
    var body: some View {
        Rectangle().fill(Color.white)
            .frame(width: 300, height: 50.0)
            .overlay( HStack{
                Spacer()
                Text(title + ": ")
                Spacer()
                Text(content)
                Spacer()
            }
            )
    }
}

struct TableViewPreview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            TableView(title: "AAAA", content: "BBB")
        }
        
    }
}
