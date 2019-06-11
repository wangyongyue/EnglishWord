//
//  Sentence.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class Sentence:NSObject, HomeProtocol {
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        loadData()
        indexVue.v_index { (index) in
            print(index)
            
            Router.push(SentenceDetails().getViewController(), ["id":index + 1], nil)
        }
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = HomeVC()
        vc.m = self
        vc.navigationItem.title = "消息"
        return vc
        
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
