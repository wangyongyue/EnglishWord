//
//  WordWeb.swift
//  English
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


import VueSwift
class WordWeb: NSObject, BottomWebViewProtocol {
    
   
    var tapVue: Vue   = Vue()
    var word:String?
    
    func startListen() {
        
     
    }
    
    func getView(){
        if let url = self.word{
            let strUrl = "https://fanyi.baidu.com/?aldtype=85#en/zh/" + url
            let v = BottomWebView(m:self,url:strUrl)
            let window = UIApplication.shared.keyWindow
            if let w = window{
                w.addSubview(v)
            }
        }
       
        
    }
       
}
