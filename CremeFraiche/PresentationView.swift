//
//  PresentationView.swift
//  CremeFraiche
//
//  Created by Yanis OUALAN on 09/01/2022.
//

import SwiftUI

struct PresentationView: View {
    
    @State public var firstname: String = ""
    @State private var welcometext: String = "Comment vous appelez vous ?"
    @State private var showNextButton = false
    @State private var welcomefont: Font = Font.title3
    @State private var showPresentation = 1.0
    var body: some View {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        VStack {
           Spacer()
            Text("Commencez par vous présenter").font(.title).multilineTextAlignment(.leading).scaleEffect(0.95*(390/screenWidth)).opacity(showPresentation).padding(.all).foregroundColor(Color.white)
            
            VStack{
            
            
                TextField("Votre prénom",text: $firstname).frame(width:screenWidth/1.2,height:screenHeight/32).padding(20).lineLimit(1).opacity(showPresentation).aspectRatio(contentMode: .fill).foregroundColor(Color.white).onSubmit{
                    print("submitted")
                    if(firstname != ""){
                        welcometext="Nous sommes ravis de vous connaître, " + firstname
                        showNextButton.toggle()
                        showPresentation = 0
                        welcomefont = Font.title
                        print(screenWidth)
                    }
                }
                
            }.background(Image("degrade6square").resizable().opacity(showPresentation).clipShape(RoundedRectangle(cornerRadius:10))).padding(.all)
                
            Text("\(welcometext)").font(welcomefont).padding(20).foregroundColor(Color.white)
            Spacer()
        if(showNextButton){
            Spacer()
            VStack{
            NavigationLink(destination: ContentView()){
                VStack{
                
                    Text("Suivant").padding(.all).font(.title).foregroundColor(Color.white)
                }.padding(.all)
            
            }.padding(.vertical).frame(maxHeight:screenHeight/2).frame(maxWidth:.infinity).background(Image("degrade4square").resizable().shadow(radius:50))

            }.padding(.vertical).frame(maxHeight:screenHeight/6)
        }
            
        }.background(Color.black)
            
    }
}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView().previewDevice("iPhone 13")
    }
}
struct PresentationView_Previewssmall: PreviewProvider {
    static var previews: some View {
        PresentationView()
            .previewDevice("iPhone 8")
    }
}
