//
//  ContentView.swift
//  braille watch Watch App
//
//  Created by 서정덕 on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
            VStack{
                HStack{
                    Dot()
                    Dot()
                }

                HStack{
                    Dot()
                    Dot()
                }
                HStack{
                    Dot()
                    Dot()
                }
            }
        }
        .ignoresSafeArea()
    }

}

struct Dot: View {
    var body: some View{
        Image(systemName: "circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.black)
            .frame(width: 65.0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
