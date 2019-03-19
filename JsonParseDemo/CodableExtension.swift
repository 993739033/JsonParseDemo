//
//  ColableExtension.swift
//  JsonParseDemo
//
//  Created by apple_mini on 2019/3/19.
//  Copyright © 2019年 Scode. All rights reserved.
//

import Foundation
/**
 是使用扩展方便使用
 **/
//扩展Encodable协议,添加编码的方法
public extension Encodable {
    //1.遵守Codable协议的对象转json字符串
    public func toJSONString() -> String? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    //2.对象转换成jsonObject
    public func toJSONObject() -> Any? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
    }
}

//扩展Decodable协议,添加解码的方法
public extension Decodable {
    //3.json字符串转对象&数组
    public static func decodeJSON(from string: String?) -> Self? {
        
        guard let data = string?.data(using: .utf8)else {
                return nil
        }
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}
