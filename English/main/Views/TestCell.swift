//
//  TestCell.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class TestCell: UICollectionViewCell,CellProtocol{
    
   
   
    let label:UILabel = {
        let a = UILabel()
        a.textColor = UIColor.black
        a.textAlignment = .left
        return a
    }()
    let tap = UITapGestureRecognizer()
    
    var textVue:Vue = Vue()
    var tapVue:Vue = Vue()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(label)
        self.contentView.addGestureRecognizer(tap)
        
        label.numberOfLines = 0
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(6)
            make.left.equalTo(0)
            make.right.equalTo(-6)
            make.bottom.equalTo(-2)
            
        }
        
        label.v_text(vue: textVue)
        tap.v_on(vue: tapVue)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setModel(_ amodel: VueData) {
        
        if amodel is TestModel{
            
            let h = amodel as! TestModel
            
            textVue.v_text { () -> String? in
                
                return h.name
            }
            
            tapVue.v_on {
                h.v_identifier = 0
                h.v_selectVue.v_on?()
            }
            
        }
    }
    
}
class TestModel:VueData{
    
    var v_palm: String = "TestCell"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    var name:String?
    
}
