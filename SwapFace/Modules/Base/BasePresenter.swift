//
//  BasePresenter.swift
//  SwapFace
//
//  Created by Miguel Zapata on 02-01-18.
//  Copyright © 2018 MZapatae. All rights reserved.
//

protocol BasePresenter: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}

extension BasePresenter {
    func viewDidLoad() {
        fatalError("viewDidLoad() - Implementation pending...")
    }
    
    func viewWillAppear(animated: Bool) {
        fatalError("viewWillAppear() - Implementation pending...")
    }
    
    func viewDidAppear(animated: Bool) {
        fatalError("viewDidAppear() - Implementation pending...")
    }
    
    func viewWillDisappear(animated: Bool) {
        fatalError("viewWillDisappear() - Implementation pending...")
    }
    
    func viewDidDisappear(animated: Bool) {
        fatalError("viewDidDisappear() - Implementation pending...")
    }
}


