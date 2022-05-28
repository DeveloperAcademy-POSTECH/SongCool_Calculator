//
//  ContentView.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.black)
                .background(.black)
            MainView()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
