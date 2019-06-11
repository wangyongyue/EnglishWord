//
//  Word.swift
//  English
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
class Word: NSObject, BottomViewProtocol {
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    var tapVue: Vue   = Vue()
    var word:String?

    func startListen() {
        
        
        loadData()
        
        indexVue.v_index { (index) in
            
            
        }
        
        
    }
    
    func getView(){
        
        let v = BottomView(m:self)
        let window = UIApplication.shared.keyWindow
        if let w = window{
            w.addSubview(v)
        }
                
    }
    
    func loadData(){
        
        let data  = Resources.getArrayForJson("sentence")
        
        var array = Array<VueData>()
        for value in data{
            let dic = value as! NSDictionary
            let m = Style01Model()
            m.name = dic["name"] as! String
            array.append(m)
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
    }
    
    
}
