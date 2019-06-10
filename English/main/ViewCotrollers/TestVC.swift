//
//  TestVC.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class TestVC: UIViewController {

    var m:TestProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flow.scrollDirection = .vertical
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: flow)
        table.alwaysBounceVertical = true
        self.view.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.register([TestCell.classForCoder()
            ])
        
        if let v = m?.arrayVue{
            table.v_array(vue: v)
            
        }
        
        if let v = m?.indexVue{
            table.v_index(vue: v)
        }
        
        m?.startListen()
    }
    
}
protocol TestProtocol {
    
    var arrayVue:Vue{get}
    var indexVue:Vue{get}
    func startListen()
    
}

