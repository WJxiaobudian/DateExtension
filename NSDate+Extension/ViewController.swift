//
//  ViewController.swift
//  NSDate+Extension
//
//  Created by 王洁 on 2018/5/8.
//  Copyright © 2018年 王洁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        let string1 = "2018/05/08 11:11:11"
        let string2 = "2018/05/07 11:11:11"
        let string3 = "2018/05/06 11:11:11"
        let string4 = "2018/05/08 15:19:11"
        
        creatString(string: string1)
        creatString(string: string2)
        creatString(string: string3)
        creatString(string: string4)
    }
    
    func creatString(string:String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let create = formatter.date(from: string)
        if (create?.isThisYear())! {
            if (create?.isToday())! {
                let compoents = Date .deltaFrom(create!)
                if compoents(Date()).hour! > 1 {
                    print("\((compoents(Date()).hour!)) 小时前")
                } else if compoents(Date()).minute! >= 1 {
                    print("\(compoents(Date()).minute!) 分钟前")
                } else {
                    print("刚刚")
                }
            } else if (create?.isYesterDay())! {
                formatter.dateFormat = "昨天 HH:mm:ss"
                print("\((formatter.string(from: create!)))")
            } else {
                formatter.dateFormat = "MM-dd HH:mm:ss"
                print("\((formatter.string(from: create!)))")
            }
        } else {
            print("\(create!)")
        }
        
        if Calendar.current.isDate(create!, inSameDayAs: Date()) {
            print("🍎同一天")
        } else {
            print("🍎不是同一天")
        }
        
        if Calendar.current.isDateInYesterday(create!) {
            print("🍐昨天")
        } else {
            print("🍐不是昨天")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

