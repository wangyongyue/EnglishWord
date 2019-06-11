//
//  BottomWebView.swift
//  English
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift
import WebKit
class BottomWebView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(m:BottomWebViewProtocol,url:String) {
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        
        let web = WKWebView()
        self.addSubview(web)
        web.snp.makeConstraints { (make) in
            make.height.equalTo(230)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        let mapwayURL = URL(string: url)!
        let mapwayRequest = URLRequest(url: mapwayURL)
        web.load(mapwayRequest)
        
        
        
        let tap = UITapGestureRecognizer()
        self.addGestureRecognizer(tap)
        tap.v_on(vue: m.tapVue)
        tap.v_tap {
            
            self.removeFromSuperview()
        }
        
        m.startListen()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
}
protocol BottomWebViewProtocol {
    
  
    var tapVue:Vue{get}
    
    func startListen()
    
}
