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

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var viewModel: ViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ViewModel()
        self.bind()
    }
    
    func bind() {
        self.viewModel.outputs.number
            .subscribe(onNext: { number in
                print(number)
            })
            .addDisposableTo(disposeBag)
        
        self.button.rx.tap
            .subscribe(onNext: viewModel.inputs.request1)
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

