//
//  ContentView.swift
//  CremeFraiche
//
//  Created by Yanis OUALAN on 09/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let screenRect = UIScreen.main.bounds

        let screenHeight = screenRect.size.height
        let salutation = getSalutation()
        NavigationView{
            VStack{
                
                
                Text(salutation+", afin de vous offrir la meilleure expérience possible, nous allons avoir besoin d'informations vous concernant").font(.title).padding(.all).foregroundColor(Color.white).multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    
                    NavigationLink(destination: PresentationView()){
                        
                        Text("Commencer").foregroundColor(Color.white).font(.title)
                    }.padding(.vertical).frame(maxHeight:screenHeight/2).frame(maxWidth:.infinity)
                }.background(Color.cyan).frame(maxHeight:screenHeight/8)
            }.padding(.top).frame(maxHeight:.infinity).background(Image("degrade2"))
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13")
    }
}
