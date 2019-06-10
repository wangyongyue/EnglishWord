//
//  Resources.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Resources: NSObject {
    
    //sentence
    static func getArrayForJson(_ fileName:String) -> NSArray{
        
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDic = jsonData as! NSDictionary
            let jsonArr = jsonDic["data"] as! NSArray
            
            return jsonArr
        } catch let error as Error! {
            print("读取本地数据出现错误!",error)
        }
        
        return NSArray()
    }
    
    

}
