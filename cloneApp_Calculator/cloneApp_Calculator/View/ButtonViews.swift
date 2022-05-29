//
//  ButtonViews.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/29.
//

import SwiftUI



struct circleBtn: View{
    
    let radius : CGFloat
    let bgColor : Color
    let context : String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: radius/2)
                .foregroundColor(bgColor)
            Text(context)
                .foregroundColor(.white)
                .bold()
                .font(.title
                )
        }.frame(width: radius, height: radius)
    }
}

struct NumberBtn: View{
    
    let radius : CGFloat
    let context : Int
    
    var body: some View {
        
        Button{
            print("\(context) 눌림")
        }label: {
            circleBtn(radius: radius, bgColor: .gray, context: String(context))
        }
    }
}

struct OperationBtn: View{
    
    let radius : CGFloat
    let context : String
    
    var body: some View {
        
        Button{
            print("\(context) 눌림")
        }label: {
            circleBtn(radius: radius, bgColor: .orange, context: context)
        }
    }
}



struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        circleBtn(radius: 100, bgColor: .brown, context: ".")
        NumberBtn(radius: 100, context: 1)
        OperationBtn(radius: 100, context: "+")

    }
}
