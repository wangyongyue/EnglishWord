//
//  BottomView.swift
//  English
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

import VueSwift
import SnapKit

class BottomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(m:BottomViewProtocol) {
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        
        let table = CTable()
        table.estimatedRowHeight = 44.0
        table.rowHeight = UITableView.automaticDimension
        self.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        table.register([Style01.classForCoder(),
                        Style02.classForCoder(),
                        Style03.classForCoder(),
                        LeftCell.classForCoder(),
                        RightCell.classForCoder(),
                        RightENCell.classForCoder(),
                        LeftENCell.classForCoder()
            
            ])
        
        table.v_array(vue: m.arrayVue)
        table.v_index(vue: m.indexVue)
        
        let tap = UITapGestureRecognizer()
        self.addGestureRecognizer(tap)
        tap.v_on(vue: m.tapVue)
        tap.v_tap {
        
            self.removeFromSuperview()
        }
        
        m.startListen()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    
}
protocol BottomViewProtocol {
    
    var arrayVue:Vue{get}
    var indexVue:Vue{get}
    var tapVue:Vue{get}

    func startListen()
    
}
