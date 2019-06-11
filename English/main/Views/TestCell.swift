//
//  TestCell.swift
//  English
//
//  Created by apple on 2019/6/10.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit
import VueSwift

class TestCell: UICollectionViewCell,CellProtocol{
    
   
   
    let label:UILabel = {
        let a = UILabel()
        a.textColor = UIColor.black
        a.textAlignment = .left
        return a
    }()
    let tap = UITapGestureRecognizer()
    
    var textVue:Vue = Vue()
    var tapVue:Vue = Vue()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(label)
        self.contentView.addGestureRecognizer(tap)
        
        label.numberOfLines = 0
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        label.v_text(vue: textVue)
        tap.v_on(vue: tapVue)
        
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        self.setNeedsLayout()
        self.layoutIfNeeded()

        let size = self.contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var cellFrame = layoutAttributes.frame
        cellFrame.size.height = 25
        if let text = label.text,let font = label.font{
            cellFrame.size.width = text.getWithForString(font:font) + 5
        }
        layoutAttributes.frame = cellFrame
        return layoutAttributes
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setModel(_ amodel: VueData) {
        
        if amodel is TestModel{
            
            let h = amodel as! TestModel
            
            textVue.v_text { () -> String? in
                
                return h.name
            }
            
            tapVue.v_on {[weak self] in
                self?.label.textColor = UIColor.red
                
//                let w = Word()
//                w.word = h.name
//                w.tapVue.v_on(vue: {
//
//                    self?.label.textColor = UIColor.black
//                })
//                w.getView()

                
                let w = WordWeb()
                w.word = h.name
                w.tapVue.v_on(vue: {
                    
                    self?.label.textColor = UIColor.black
                })
                w.getView()

                
            }
            
        }
    }
    
}
class TestModel:VueData{
    
    var v_palm: String = "TestCell"
    var v_identifier:Int = 0
    var v_selectVue:Vue = Vue()
    
    var name:String?
    
}
