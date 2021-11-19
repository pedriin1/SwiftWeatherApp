//
//  ContentView.swift
//  MovieApp
//
//  Created by Pedro Maia on 19/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            VStack{
                Header()
                
                TextInput(text: $text)
              
                
                List{
                    
                ScrollView{
                    VStack{
                        Text("Mais assistidos").font(.title3).fontWeight(.bold).foregroundColor(.white)
                        ExtractedView()
                    }
                    
                }
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        HStack(alignment: .bottom){
            VStack(alignment: .leading){
                Text("19 de novembro").font(.subheadline).foregroundColor(.gray)
                
                Text("Procure").font(.title).fontWeight(.bold).foregroundColor(.white)
            }.padding(8.0)
            Spacer()
            
            Image("eu").resizable().frame(width: 30, height: 30).cornerRadius(50).padding(8.0)
        }
    }
}

struct TextInput: View {
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .leading){
            
            TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.all, 5.0)
                .background(Color("secondary"))
                .foregroundColor(.white)
                .cornerRadius(8)
            if text.count < 1{
                Text("Filmes, series, novelas e mais ").fontWeight(.medium).padding(.horizontal, 30).foregroundColor(.gray)
            }
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)
                .padding(.leading, 4.0)
        }.padding(.horizontal, 7.0)
    }
}

struct ExtractedView: View {
    let images = ["spiderman", "ironman", "avengers"]
    var body: some View {
        HStack{
            ForEach(images, id: \.self){
                image in
                Image(image)
            }
            
        }
    }
}
