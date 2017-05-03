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
    
        // 기본적인 패턴
        button.rx.tap
            .subscribe(onNext: { [weak self] in self?.reload() })
            .addDisposableTo(disposeBag)
        
        
        // bindNext를 이용해서 간결하게
        button.rx.tap.bindNext(reload).addDisposableTo(disposeBag)
        
        // 오퍼레이터 추가
        button.rx.tap
            .do(onNext: {
                print("Reload button clicked")
            })
            .bindNext(reload)
            .addDisposableTo(disposeBag)
        
        // 오퍼레이터 추가 debounce
        
        button.rx.tap
            .debounce(0.3, scheduler: MainScheduler.instance)
            .do(onNext: {
                print("Reload Button clicked")
            })
            .bindNext(reload)
            .addDisposableTo(disposeBag)
        
        
        
    }
    
    func reload() {
        
        // API 요청 구현
        
    }

}

