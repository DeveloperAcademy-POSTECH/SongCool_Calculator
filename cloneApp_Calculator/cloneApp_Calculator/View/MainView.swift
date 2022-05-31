//
//  MainView.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/26.
//


import SwiftUI

struct MainView: View {
    
    @StateObject var Calculator : Calculate = Calculate()


    let padding: CGFloat = 15
    let radius: CGFloat = (UIScreen.main.bounds.size.width - 51) / 4
    
    
    var body: some View {
        VStack(alignment: .trailing, spacing: padding){
//            Spacer()
            Text( Calculator.present )      // 화면에 보여지는 값
                .foregroundColor(.white)
                .font(.system(size: 95, weight: .light))
                .padding(.trailing)
            
            
            HStack(alignment: .center, spacing: padding){
      
                Button{                         // AC 버튼
                    Calculator.initialization()
                }label: {
                    ZStack{
                    RoundedRectangle(cornerRadius: radius/2)
                        .foregroundColor(Color("GrayCol"))
                        Text((Calculator.mode == .defualt) ? "AC" : "A")
                        .foregroundColor(.white)
                    .font(.system(size: 34, weight: .medium))        }.frame(width: radius, height: radius)
                }
                Button{                         // +- 버튼
                    Calculator.conversionBtn()
                }label: {
                    //만들때, 데이터 타입을 변경하는 방법 설정하기.
                    circleBtn(radius: radius, bgColor: Color("GrayCol"), context: "plus.forwardslash.minus")
                }
                Button{                         // % 버튼
                    Calculator.percentBtn()
                }label: {
                    circleBtn(radius: radius, bgColor: Color("GrayCol"), context: "percent")
                }
                OperationBtn(Calculator: Calculator, radius: radius, context: "divide")
            }
            
            HStack(alignment: .center, spacing: padding){
                NumberBtn(Calculator: Calculator, radius: radius, context: 7)
                NumberBtn(Calculator: Calculator, radius: radius, context: 8)
                NumberBtn(Calculator: Calculator, radius: radius, context: 9)
                OperationBtn(Calculator: Calculator, radius: radius, context: "multiply")
            }
            HStack(alignment: .center, spacing: padding){
                NumberBtn(Calculator: Calculator, radius: radius, context: 4)
                NumberBtn(Calculator: Calculator, radius: radius, context: 5)
                NumberBtn(Calculator: Calculator, radius: radius, context: 6)
                OperationBtn(Calculator: Calculator, radius: radius, context: "minus")
            }
            HStack(alignment: .center, spacing: padding){
                NumberBtn(Calculator: Calculator, radius: radius, context: 1)
                NumberBtn(Calculator: Calculator, radius: radius, context: 2)
                NumberBtn(Calculator: Calculator, radius: radius, context: 3)
                OperationBtn(Calculator: Calculator, radius: radius, context: "plus")
            }
            HStack(alignment: .center, spacing: padding){
                Button{
                    Calculator.numberBtn(num: 0)
                }label: {
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: radius/2)
                            .foregroundColor(Color("DarkgrayCol"))
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .regular))
                            .frame(width: radius, height: radius)
                    }.frame(width: 2 * radius + padding, height: radius)
                }
                Button{
                    Calculator.decimalpointBtn()
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: radius/2)
                            .foregroundColor(Color("DarkgrayCol"))
                        Text(".")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .regular))
                    }.frame(width: radius, height: radius)
                    

                }
                OperationBtn(Calculator: Calculator, radius: radius, context: "equal")
            }
            
        }
        .padding(.bottom)        
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
