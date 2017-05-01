//
//  ViewModel.swift
//  RxSwiftExample
//
//  Created by 박성원 on 2017. 5. 1..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import RxSwift

protocol ViewModelInput {
    func request1()
    func request2()
    func request3()
}

protocol ViewModelOutput {
    var number: Observable<Int> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

extension ViewModel {
    func request1() {
        
    }
    func request2() {
        
    }
    func request3() {
        
    }
}

class ViewModel: ViewModelInput, ViewModelOutput, ViewModelType {
    let model: Model
    init() {
        model = Model()
        
        self.number = model.number.asObservable()
    }
    
    let number: Observable<Int>
    
    var inputs: ViewModelInput { return self }
    var outputs: ViewModelOutput { return self }
}
