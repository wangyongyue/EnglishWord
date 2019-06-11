//
//  LeftENCell.swift
//  English
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


import VueSwift
class LeftENCell: UITableViewCell,CellProtocol {
    
    var arrayVue:Vue = Vue()
    var indexVue:Vue = Vue()
    var table:CCollection?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        let flow = UICollectionViewFlowLayout()
        //        flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flow.estimatedItemSize = CGSize(width: 100, height: 50)
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        
        flow.scrollDirection = .vertical
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: flow)
        //        table.alwaysBounceVertical = true
        
        self.contentView.addSubview(table)
        
        table.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(12)
            make.right.equalTo(-50)
            make.height.equalTo(20)
            make.bottom.equalTo(-6)
            
        }
        table.register([TestCell.classForCoder()
            ])
        
        table.v_array(vue: arrayVue)
        table.v_index(vue: indexVue)
        self.table = table
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func setModel(_ amodel: VueData) {
        
        if amodel is LeftENModel{
            
            let h = amodel as! LeftENModel
            var array = Array<VueData>()
            
            if let str = h.name{
                
                let strs = str.components(separatedBy: " ")
                for value in strs{
                    let m = TestModel()
                    m.name = value
                    array.append(m)
                    
                }
                
                let tableH = (CGFloat(strs.count * 5) + str.getWithForString(font: UIFont.systemFont(ofSize: 13))) / (self.contentView.frame.width - 52) * 30 + 15
                self.table?.snp.updateConstraints({ (make) in
                    make.height.equalTo(tableH)
                })
            }
            
            arrayVue.v_array(false, v: { () -> Array<VueData>? in
                
                return array
            })
            
            indexVue.v_index { (index) in
                
                print(index)
                
                
            }
            
            
            
        }
    }
    
}
class LeftENModel:VueData{
    
    var v_palm: String = "LeftENCell"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    var name:String?
    
}
