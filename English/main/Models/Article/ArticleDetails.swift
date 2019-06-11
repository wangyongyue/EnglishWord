//
//  ArticleDetails.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class ArticleDetails: NSObject , DetailsProtocol {
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:{
            self.loadData()

        })
        indexVue.v_index { (index) in
            

        }
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = DetailsVC()
        vc.m = self
        return vc
        
    }
    
    func loadData(){
        
        let number = Router.currentController().params?["id"] as! Int
        let data  = Resources.getArrayForJson("art00\(number)")
        
        var array = Array<VueData>()
        for value in data{
            let dic = value as! NSDictionary
            let m = Style03Model()
            m.name = dic["content_en"] as! String
            array.append(m)
            
            let zhm = Style02Model()
            zhm.name = dic["content_zh"] as! String
            array.append(zhm)
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
    }
    
    
}
