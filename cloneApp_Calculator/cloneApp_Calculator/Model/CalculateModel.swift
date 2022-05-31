//
//  CalculateModel.swift
//  cloneApp_Calculator
//
//  Created by 송시원 on 2022/05/29.
//

import Foundation

class Calculate : ObservableObject {
    enum Operator {
        case plus, minus, multiply, divide, equal, notSelected
    }
    enum Mode {                 // 기본 입력, 곱셈, 나누기 입력
        case defualt, dd
    }
    
    
    var mode : Mode
    
    @Published var present = "0"        // 화면에 나오는 값
    var result : Float                  // 화면에 보여질 값
    var tmp : Float?                    // 저장될 값
    var secondaryVal : Float?           // 두번째 저장될 값

    var operatorSel : Operator          // 연산
    var decimalpointSel : Int           // 소수점
    // 뒤에 숫자를 하나씩 붙여나갈때마다 증가.
    
    init() {
        mode = .defualt //입력모드
        
        present = "0"
        result = 0
        tmp = nil
        secondaryVal = nil
        
        operatorSel = .notSelected
        decimalpointSel = 0
    }
    
    func initialization() {                 // AC 버튼 눌렀을 시 초기화
        self.mode = .defualt //입력모드
        
        self.present = "0"
        self.result = 0
        self.tmp = nil
        self.secondaryVal = nil
        
        self.operatorSel = .notSelected
        self.decimalpointSel = 0
    }
    
    // 연산함수
    func plusBtn(){
        self.operatorSel = .plus
    }
    func minusBtn(){
        self.operatorSel = .minus
    }
    func multiplyBtn(){
        self.operatorSel = .multiply
    }
    func divideBtn(){
        self.operatorSel = .divide
    }
    func operationBtn(){
        //소숫점 입력이 멈춤.
        self.decimalpointSel = 0
    }
    
    // 상단 회색버튼들
    func conversionBtn(){                   // 음수 버튼
        self.result *= -1
        print(String(result))
        //0일때 예외처리하기

    }
    func percentBtn(){                      // 퍼센트 버튼
        self.result *= 0.01
        print(String(result))

    }
    //결과버튼
    func resultBtn(){
//        switch Calculator.operatorSel {
//        case .plus:
//            Calculator.multiplyBtn()
//
//        case .minus:
//            Calculator.multiplyBtn()
//
//        case .multiply:
//            Calculator.multiplyBtn()
//        case .divide:
//            Calculator.divideBtn()
//        case .equal:
//            Calculator.resultBtn()
//        case .notSelected:
//            print"err")
//        }
        
        self.decimalpointSel = 0
        //스위치를 활용해서 구현하기.
        print(String(result))

    }
    
    func decimalpointBtn(){
        if(decimalpointSel == 0) {          // 소수점 클릭시 1로 만들어서 연산 다르게
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
            decimalpointSel += 1
            
            present = String(result)
        }
        print(present)
        print(String(result))

    }
    
}
