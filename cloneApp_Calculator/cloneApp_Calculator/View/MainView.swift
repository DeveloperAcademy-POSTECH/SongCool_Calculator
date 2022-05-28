//
//  MainView.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/26.
//


/*
 pr 양식
 커밋메시지 방식
 
 변수이름 고민
 
 */

import SwiftUI

struct MainView: View {
    
    let padding: CGFloat = 12
    let radius: CGFloat = (UIScreen.main.bounds.size.width - 60) / 4
    
    
    var body: some View {
        VStack(spacing: padding){
            Spacer()
            HStack(alignment: .center, spacing: padding){
      
                Button{
                    
                }label: {
                    cirButton(radius: radius, bgColor: .blue, context: "AC")
                }
                Button{
                    
                }label: {
                    //만들때, 데이터 타입을 변경하는 방법 설정하기.
                    cirButton(radius: radius, bgColor: .blue, context: "calendar")
                }
                Button{
                    
                }label: {
                    cirButton(radius: radius, bgColor: .blue, context: "%")
                }
                calButton(radius: radius, context: "/")
            }
            HStack(alignment: .center, spacing: padding){
                numButton(radius: radius, context: 7)
                numButton(radius: radius, context: 8)
                numButton(radius: radius, context: 9)
                calButton(radius: radius, context: "*")
            }
            HStack(alignment: .center, spacing: padding){
                numButton(radius: radius, context: 4)
                numButton(radius: radius, context: 5)
                numButton(radius: radius, context: 6)
                calButton(radius: radius, context: "-")
            }
            HStack(alignment: .center, spacing: padding){
                numButton(radius: radius, context: 1)
                numButton(radius: radius, context: 2)
                numButton(radius: radius, context: 3)
                calButton(radius: radius, context: "+")
            }
            HStack(alignment: .center, spacing: padding){
                numButton(radius: radius, context: 0)
                numButton(radius: radius, context: 2)
                Button{
                    
                }label: {
                    cirButton(radius: radius, bgColor: .gray, context: ".")
                }
                calButton(radius: radius, context: "=")
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

struct cirButton: View{
    
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

struct numButton: View{
    
    let radius : CGFloat
    let context : Int
    
    var body: some View {
        
        Button{
            print("\(context) 눌림")
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: radius/2)
                    .foregroundColor(.gray)
                Text(String(context))
                    .foregroundColor(.white)
                    .bold()
                    .font(.title
                    )
            }.frame(width: radius, height: radius)
        }
        
    }
}

struct calButton: View{
    
    let radius : CGFloat
    let context : String
    
    var body: some View {
        
        Button{
            print("\(context) 눌림")
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: radius/2)
                    .foregroundColor(.orange)
                Text(String(context))
                    .foregroundColor(.white)
                    .bold()
                    .font(.title
                    )
            }.frame(width: radius, height: radius)
        }
    }
}
