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
extension String{
    
    
    func getHeightForString(font:UIFont,w:CGFloat) -> CGFloat{
       
        let attributes = [NSAttributedString.Key.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: CGSize.init(width: w, height:  CGFloat(MAXFLOAT)), options: option, attributes: attributes, context: nil)
        return rect.size.height
    }
    func getWithForString(font:UIFont) -> CGFloat{
        
        let attributes = [NSAttributedString.Key.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height:  CGFloat(MAXFLOAT)), options: option, attributes: attributes, context: nil)
        return rect.size.width
    }
    
}
