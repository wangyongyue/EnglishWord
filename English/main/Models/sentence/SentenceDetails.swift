//
//  SentenceDetails.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
class SentenceDetails: NSObject, DetailsProtocol {
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:{
            self.loadData()

        })
        
        indexVue.v_index { (index) in
            
//            Router.push(Test().getViewController(), ["id":"10"], nil)

        }
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = DetailsVC()
        vc.m = self
        vc.navigationItem.title = "例句"
        return vc
        
    }
    
    func loadData(){
        let number = Router.currentController().params?["id"] as! Int
        let data  = Resources.getArrayForJson("sen00\(number)")
        
        var array = Array<VueData>()
        for (index,value) in data.enumerated(){
            let dic = value as! NSDictionary
            
            
            if index % 2 == 0{
                
                let m = LeftENModel()
                m.name = dic["content_en"] as! String
                array.append(m)
                
                let zhm = LeftModel  ()
                zhm.name = dic["content_zh"] as! String
                array.append(zhm)
                
            }else{
                
                let m = RightENModel()
                m.name = dic["content_en"] as! String
                array.append(m)
                
                let zhm = RightModel()
                zhm.name = dic["content_zh"] as! String
                array.append(zhm)
                
            }
            
           
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
        
    }
    
    
}
