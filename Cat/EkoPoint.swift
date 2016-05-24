//
//  EkoPoint.swift
//  Cat
//
//  Created by jim on 15/11/26.
//  Copyright © 2015年 jim. All rights reserved.
//

import SpriteKit

//圆点枚举
enum PointType: Int {
    //灰0 红1
    case gray=0, red;
}

class EkoPoint: SKSpriteNode {

    //上一个点的索引
    var prePointIndex = -1
    //周围点的索引
    var arrPoint = [Int]()
    //初始步骤点
    var step = 99
    //自身索引
    var index = 0
    //圆点类型，默认为灰色点
    var type = PointType.gray
    //是否是边缘点
    var isEdge = false
    //圆点内的文本节点
    var label:SKLabelNode?
    
    //设置文本节点的文字
    func onSetLabel(i: String){
        if label == nil {
            //文本节点的字体
            label = SKLabelNode(fontNamed: "Chalkduster")
            //文本节点的字体大小
            label?.fontSize = 22
            //文本节点的设置
            label?.position = CGPointMake(0, -10)
            //取消文本节点的交往
            label?.userInteractionEnabled = false
            //将文本节点加入圆点类
            self.addChild(label!)
        }
        //设置文本节点的内容
        label?.text = i
    }
    
}
