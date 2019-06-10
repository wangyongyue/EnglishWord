//
//  MovieDetails.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class MovieDetails: NSObject, DetailsProtocol {
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        
        loadData()
        
        indexVue.v_index { (index) in
            
            print(index)
            
        }
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = DetailsVC()
        vc.m = self
        vc.navigationItem.title = "例句"
        return vc
        
    }
    
    func loadData(){
        
        let data  = Resources.getArrayForJson("sentenceDetails")
        
        var array = Array<VueData>()
        for value in data{
            let dic = value as! NSDictionary
            let m = Style02Model()
            m.name = dic["content_en"] as! String
            array.append(m)
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
        
    }
    
    
}
