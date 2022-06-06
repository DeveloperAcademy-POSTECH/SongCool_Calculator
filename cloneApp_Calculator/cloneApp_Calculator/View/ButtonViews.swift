//
//  ButtonViews.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/29.
//

import SwiftUI



struct circleBtn: View{
    //제네릭을 써보고싶지만 어떻게 써야할지 모르겠다.

    let radius : CGFloat
    let bgColor : Color
    let context : String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: radius/2)
                .foregroundColor(bgColor)
            Text("\(Image(systemName: context))")
                .foregroundColor(.black)
            .font(.system(size: 32, weight: .bold))
        }.frame(width: radius, height: radius)
    }
}

struct NumberBtn: View{
    
    @ObservedObject var Calculator: Calculate
    
    let radius : CGFloat
    let context : Int
    
    var body: some View {
        
        Button{
            print("\(context) 눌림")
            Calculator.numberBtn(num: context)
        }label: {
            
            ZStack{
                RoundedRectangle(cornerRadius: radius/2)
                    .foregroundColor(Color("DarkgrayCol"))
                Text(String(context))
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .regular))
            }.frame(width: radius, height: radius)
        }
    }
}

struct OperationBtn: View{
    
    @ObservedObject var Calculator: Calculate
    
    let radius : CGFloat
    let context : String
    
    var body: some View {
        
        Button{
            print("\(context) 눌림")
            
            Calculator.operationBtn(context: context)
            
        }label: {
            
            ZStack{
                RoundedRectangle(cornerRadius: radius/2)
                    .foregroundColor(Color("OrangeCol"))
                Text("\(Image(systemName: context))")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
            }.frame(width: radius, height: radius)
        }
    }
}



struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            circleBtn(radius: 100, bgColor: Color("GrayCol"), context: "plus")
            NumberBtn(Calculator: Calculate(), radius: 100, context: 1)
            OperationBtn(Calculator: Calculate(), radius: 100, context: "plus")
        }
    }
}
