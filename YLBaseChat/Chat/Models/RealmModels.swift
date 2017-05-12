//
//  RealmModels.swift
//  YLBaseChat
//
//  Created by yl on 17/5/9.
//  Copyright © 2017年 yl. All rights reserved.
//

import UIKit
import RealmSwift

// 用户model
class UserInfo: Object {

    dynamic var userId = NSUUID().uuidString // 用户id
    
    dynamic var nickname = "" // 昵称
    
    let messages = List<Message>()  // 用户对应的聊天消息
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}

// 消息model
class Message: Object {
    
    dynamic var messageId = NSUUID().uuidString // 消息id
    
    dynamic var fromUserId = ""  // 发送方
    
    dynamic var toUserId = ""    // 接受方
    
    dynamic var timestamp = ""   // 时间戳
    
    dynamic var messageBody:MessageBody? // 消息体
    
    override static func primaryKey() -> String? {
        return "messageId"
    }
}

// 消息体类型
enum MessageBodyType:Int{
    case MessageBodyTypeText = 1
    case MessageBodyTypeImage

}

// 消息体
class MessageBody: Object {
     var type:MessageBodyType?
}

// 文字消息体
class TextMessageBody: MessageBody {
    dynamic var text = ""
}

