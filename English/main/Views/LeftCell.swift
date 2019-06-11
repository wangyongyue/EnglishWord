//
//  LeftCell.swift
//  English
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
class LeftCell: UITableViewCell,CellProtocol {
    
    let label:UILabel = {
        let a = UILabel()
        a.textColor = UIColor.black
        a.textAlignment = .left
        return a
    }()
    let tap = UITapGestureRecognizer()
    
    var textVue:Vue = Vue()
    var tapVue:Vue = Vue()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        self.contentView.addGestureRecognizer(tap)
        
        label.numberOfLines = 0
        label.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(12)
            make.right.equalTo(-50)
            make.bottom.equalTo(-6)
            
        }
        
        label.v_text(vue: textVue)
        tap.v_on(vue: tapVue)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func setModel(_ amodel: VueData) {
        
        if amodel is LeftModel{
            
            let h = amodel as! LeftModel
            
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
class LeftModel:VueData{
    
    var v_palm: String = "LeftCell"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    var name:String?
    
}
