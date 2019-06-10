//
//  Style01.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
class Style01: UITableViewCell,CellProtocol {

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
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(-12)
            
        }
        
        label.v_text(vue: textVue)
        tap.v_on(vue: tapVue)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func setModel(_ amodel: VueData) {
        
        if amodel is Style01Model{
            
            let h = amodel as! Style01Model
           
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
class Style01Model:VueData{
    
    var v_palm: String = "Style01"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    var name:String?
    
}
