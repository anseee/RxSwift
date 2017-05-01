//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by 박성원 on 2017. 5. 1..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 옵저버 생성 -> <제너럴 타입 결정> -> create -> 넥스트, 완료 -> 리턴(Disposables)
        let nameObservable = Observable<String>.create { observer -> Disposable in
            observer.on(.next("next"))
            observer.on(.completed)
            return Disposables.create {
                print("이름")
            }
        }
        
        // 구독 -> 이벤트 결과
        nameObservable.subscribe(onNext:{ event in
            print(event)
        }).addDisposableTo(self.disposeBag)
        
        // generate Example
        let generateExample = Observable.generate(initialState: 1, condition: { $0 < 50 }, iterate: { $0 + 5 })
        
        generateExample.subscribe(onNext: { event in
            print(event)
        }).addDisposableTo(self.disposeBag)
        
    }

}

