//
//  CalculateModel.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/29.
//

import Foundation

class Calculate : ObservableObject {
    enum Operator {
        case plus, minus, multiply, divide, notSelected
    }
    enum Mode {
        case defualt, dd
    }
    var mode : Mode
    
    var result : Float
    var tmp : Float?
    var secondaryVal : Float?

    var operatorSel : Operator
    var decimalpointSel : Int
    // 뒤에 숫자를 하나씩 붙여나갈때마다 증가.
    
    init() {
        mode = .defualt //입력모드
        
        result = 0
        tmp = nil
        secondaryVal = nil
        
        operatorSel = .notSelected
        decimalpointSel = 0
    }
    
    func plusBtn(){
        self.operatorSel = .plus
        self.decimalpointSel = 0
    }
    func minusBtn(){
        self.operatorSel = .minus
        self.decimalpointSel = 0
    }
    func multiplyBtn(){
        self.operatorSel = .multiply
        self.decimalpointSel = 0
    }
    func divideBtn(){
        self.operatorSel = .divide
        self.decimalpointSel = 0
    }
    
    func conversionBtn(){
        self.result *= -1
    }
    func percentBtn(){
        self.result *= 0.01
    }
    func resultBtn(){
        self.decimalpointSel = 0
        //스위치를 활용해서 구현하기.
    }
    
    func decimalpointBtn(){
        if(decimalpointSel == 0) {
            decimalpointSel = 1
        }
    }
    
    
    func numberBtn(num : Int){
        //일반적인 상황
        if(decimalpointSel == 0) {
            result = result*10 + Float(num)
        } else {
            //소수점 입력시
            result = result + (Float(num) / pow(10, Float(decimalpointSel)))
        }
    }
    
}
