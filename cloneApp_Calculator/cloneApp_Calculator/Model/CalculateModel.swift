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
        case defualt, acting, ready
    }
    
    
    var mode : Mode
    
    @Published var present = "0"        // 화면에 나오는 값
    var result : Float                  // 화면에 보여질 값 -> 입력받은곳에 있는것들.
    var tmp : Float                     // 저장될 값 어떤걸 먼저해야하는가?!
    var interim : Float                 // 중간결과값.
    
    var operatorSel : Operator          // 연산
    var decimalpointSel : Int           // 소수점
    // 뒤에 숫자를 하나씩 붙여나갈때마다 증가.
    
    
    
    init() {
        mode = .defualt //입력모드
        
        present = "0"
        result = 0
        tmp = 0
        interim = 0
        
        operatorSel = .notSelected
        decimalpointSel = 0
    }
    
    func initialization() {                 // AC 버튼 눌렀을 시 초기화
        self.mode = .defualt
        
        self.present = "0"
        self.result = 0
        self.tmp = 0
        self.interim = 0
        
        self.operatorSel = .notSelected
        self.decimalpointSel = 0
    }
    
    // 연산함수
    func operationBtn( context : String ){
        //소숫점 입력이 멈춤.
        self.decimalpointSel = 0
        
        
        /// 언제 실행하는거지?! 이거는 그거 아닐때만 실행해야하는데?!
        //이전에 붙어있던 계산값을 적용
        if(mode == .acting){
            switch operatorSel{
            case .plus:
                interim += tmp // 이전값을 계산해버림.
                tmp = result
            case .minus:
                interim -= tmp
                tmp = result
            case .multiply:
                tmp = tmp * result // "-" 값은 이미 가지고 있음.
            case .divide:
                tmp = tmp / result // tmp + interim = 결과값
            case .equal:
                print("err")
            case .notSelected:
                tmp = result
            }
        }
        print("interim : "+String(interim) + " result : "+String(result) + " tmp : " + String(tmp) + "hash : " + String(operatorSel.hashValue))
        
        //tmp를 계산하기위해 사용한 이후에, 방금까지 입력한 내용을 저장해야함
        // 일단, tmp에 방금 입력받은 값을 저장시켜놓음.
        
        
        //이 로직을 모델에서 하는게 더 좋은가?
        if(context == "plus"){
            operatorSel = .plus
            result = 0
        }else if(context == "minus"){
            operatorSel = .minus
            result = 0
        }else if(context == "multiply"){
            operatorSel = .multiply
            result = 0
        }else if(context == "divide"){
            operatorSel = .divide
            result = 0
        }else if(context == "equal"){
            resultBtn()
            mode = .ready
        }else {
            print("err")
        }
        print("interim : "+String(interim) + " result : "+String(result) + " tmp : " + String(tmp) + "hash : " + String(operatorSel.hashValue))
    }
    
    // 상단 회색버튼들
    func conversionBtn(){  // 음수 버튼
        result *= -1
        print(String(result))
        //0일때 예외처리하기
        
    }
    func percentBtn(){  // 퍼센트 버튼
        result /= 100
        print(String(result))
        
    }
    func resultBtn(){  // 결과 버튼
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfEven
        numberFormatter.maximumSignificantDigits = 8
        numberFormatter.maximumFractionDigits = 10
        
        if(mode == .ready) {
            switch operatorSel{
            case .plus:
                interim += result // 이전값을 계산해버림.
            case .minus:
                interim -= result
            case .multiply:
                interim *= result // "-" 값은 이미 가지고 있음.
            case .divide:
                interim /= result // tmp + interim = 결과값
            case .equal:
                print("err")
            case .notSelected:
                print("err")
            }
        } else{
            interim += tmp
        }
        present =  numberFormatter.string(for: interim)!
        //string 일때 값 표현방식 설정하기
        // = 연속으로 누를때 계속 마지막 계산 실행되게 하기.
        
        
        //        print(String(interim))
        //        operatorSel = .notSelected
    }
    
    
    func decimalpointBtn(){
        if(decimalpointSel == 0) {          // 소수점 클릭시 1로 만들어서 연산 다르게
            decimalpointSel = 1
        }
    }
    
    
    func numberBtn(num : Int){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfDown
        numberFormatter.maximumSignificantDigits = 8
        numberFormatter.maximumFractionDigits = 10
        
        //일반적인 상황
        if(decimalpointSel == 0) {
            result = result * 10 + Float(num)
            present =  numberFormatter.string(for: result)!
            
        } else {
            //소수점 입력시
            result = result + (Float(num) / pow(10, Float(decimalpointSel)))
            decimalpointSel += 1
            
            present =  numberFormatter.string(for: result)!
        }
        print("결과값 출력 : " + present)
        print(result)
        mode = .acting
    }
    
}

