//
//  ViewController.swift
//  JsonParseDemo
//
//  Created by apple_mini on 2019/3/19.
//  Copyright © 2019年 Scode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //json 转对象实例
        let jsonData = jsonStr.data(using: .utf8)
        print("\(type(of: jsonData))")
        let decoder = JSONDecoder()
        do{
            let json =   try decoder.decode(Person.self, from: jsonData!) as! Person
            print("decode:\(json)")
            
            print("person{name:\(json.name),age:\(json.age)}")
            
        }catch{
            let er = error as? Error
            print("\(er)")
        }
        //对象转json
        let p1 = Person(name: "skm", age: 500)
        let encoder  = JSONEncoder()
        
        do{
            let data = try encoder.encode(p1)
            print("\(data)")
            let json = String(data: data, encoding: .utf8)
            print("\(json!)")
        }catch{
            print("\(error)")
        }
        
        
        //使用扩展方便使用
        let p2 = Person(name: "extension", age: 100)
        let jsonStr1 =  p2.toJSONString()
        print("\(jsonStr1!)")
        let jsonBean1 = Person.decodeJSON(from: jsonStr1)
        print("\(jsonBean1!)")
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let jsonStr = """
{"name":"zwx","age": 123}
"""
    
    struct Person : Codable{
        var name:String  = "xxx"
        var age:Int = 1
        
    }
    
    
}

