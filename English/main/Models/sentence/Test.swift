//
//  Test.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

import VueSwift
class Test: NSObject, TestProtocol {
    
    var arrayVue: Vue = Vue()
    var indexVue: Vue = Vue()
    
    func startListen() {
        
        
        loadData()
        
        indexVue.v_index { (index) in
            
            print(index)
            
        }
        
    }
    
    func getViewController() -> UIViewController {
        
        let vc = TestVC()
        vc.m = self
        vc.navigationItem.title = "test"
        return vc
        
    }
    
    func loadData(){
        
        let str = "Near the rich man’s house there lived a poor woman. She had three sons, and two beautiful girls. The name of one of the girls was Ann; the name of the other was Fatima. Blue Beard wanted to marry one of the girls; but the girls did not want to marry Blue Beard. "
        let strs = str.components(separatedBy: " ")
        var array = Array<VueData>()
        for value in strs{
            let m = TestModel()
            m.name = value

//            if i%2 == 0{
//                m.name = "sdfdd"
//            }else  if i%3 == 0{
//                m.name = "Adlfsdf"
//            }else  if i%5 == 0{
//                m.name = "Alldksdsdfds"
//            }else  if i%7 == 0{
//                m.name = "Alldksdfsdfdsf"
//            }else  if i%9 == 0{
//                m.name = "Alldksdfdsfsdfdsf"
//            }else{
//
//            }
            array.append(m)
            
        }
        
        arrayVue.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
        
        
    }
    
    
}
