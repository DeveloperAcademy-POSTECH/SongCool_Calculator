//
//  MainView.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/26.
//


import SwiftUI

struct MainView: View {
    
    @ObservedObject var Calculator : Calculate  = Calculate()
    
    let padding: CGFloat = 12
    let radius: CGFloat = (UIScreen.main.bounds.size.width - 60) / 4
    
    
    var body: some View {
        VStack(spacing: padding){
            Spacer()
            HStack(alignment: .center, spacing: padding){
      
                Button{
                    
                }label: {
                    circleBtn(radius: radius, bgColor: .blue, context: "AC")
                }
                Button{
                    
                }label: {
                    //만들때, 데이터 타입을 변경하는 방법 설정하기.
                    circleBtn(radius: radius, bgColor: .blue, context: "c")
                }
                Button{
                    
                }label: {
                    circleBtn(radius: radius, bgColor: .blue, context: "%")
                }
                OperationBtn(radius: radius, context: "/")
            }
            HStack(alignment: .center, spacing: padding){
                NumberBtn(radius: radius, context: 7)
                NumberBtn(radius: radius, context: 8)
                NumberBtn(radius: radius, context: 9)
                OperationBtn(radius: radius, context: "*")
            }
            HStack(alignment: .center, spacing: padding){
                NumberBtn(radius: radius, context: 4)
                NumberBtn(radius: radius, context: 5)
                NumberBtn(radius: radius, context: 6)
                OperationBtn(radius: radius, context: "-")
            }
            HStack(alignment: .center, spacing: padding){
                NumberBtn(radius: radius, context: 1)
                NumberBtn(radius: radius, context: 2)
                NumberBtn(radius: radius, context: 3)
                OperationBtn(radius: radius, context: "+")
            }
            HStack(alignment: .center, spacing: padding){
                NumberBtn(radius: radius, context: 0)
                NumberBtn(radius: radius, context: 0)
                Button{
                    
                }label: {
                    circleBtn(radius: radius, bgColor: .gray, context: ".")
                }
                OperationBtn(radius: radius, context: "=")
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
