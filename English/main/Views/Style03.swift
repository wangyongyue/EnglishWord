//
//  Style03.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class Style03: UITableViewCell,CellProtocol {
    
   
   
    var arrayVue:Vue = Vue()
    var indexVue:Vue = Vue()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
     
        
        let flow = UICollectionViewFlowLayout()
        flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flow.scrollDirection = .vertical
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: flow)
//        table.alwaysBounceVertical = true
        self.contentView.addSubview(table)

        table.snp.makeConstraints { (make) in
            make.top.equalTo(0
            )
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(100)
            make.bottom.equalTo(-60)

        }
        table.register([TestCell.classForCoder()
            ])
        
        table.v_array(vue: arrayVue)
        table.v_index(vue: indexVue)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func setModel(_ amodel: VueData) {
        
        if amodel is Style03Model{
            
            let h = amodel as! Style03Model
            var array = Array<VueData>()

            if let str = h.name{
                
                let strs = str.components(separatedBy: " ")
                for value in strs{
                    let m = TestModel()
                    m.name = value
                    
                    array.append(m)
                    
                }
                
            }
            
            arrayVue.v_array(true, v: { () -> Array<VueData>? in
                
                return array
            })
            
          
            
        }
    }
    
}
class Style03Model:VueData{
    
    var v_palm: String = "Style03"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    var name:String?
    
}
