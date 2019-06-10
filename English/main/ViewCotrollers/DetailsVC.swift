//
//  DetailsVC.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
import SnapKit
class DetailsVC: UIViewController {

    var m:DetailsProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        let table = CTable()
        table.estimatedRowHeight = 44.0
        table.rowHeight = UITableView.automaticDimension
        self.view.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.register([Style01.classForCoder(),
                        Style02.classForCoder(),
                        Style03.classForCoder()
            
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
protocol DetailsProtocol {
    
    var arrayVue:Vue{get}
    var indexVue:Vue{get}
    func startListen()
    
}

