//
//  GameScene.swift
//  Cat
//
//  Created by jim on 15/11/25.
//  Copyright (c) 2015年 jim. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let pointContainer = PointContainer()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 45;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        
        //将images。xcassets中的 bg，jpg来制作背景
        let bg = SKSpriteNode(imageNamed: "bg")
        //设置位置
        bg.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(bg)
        
        //设置圆点容器
        pointContainer.position = CGPoint(x: CGRectGetMidX(self.frame)-10, y: CGRectGetMidY(self.frame)-150);
        self.addChild(pointContainer)
        pointContainer.onInit()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }*/
        for touch:AnyObject in touches{
            //获取点击的坐标
            let location = touch.locationInNode(self)
            //该坐标下所有的对象
            let arrObject = self.nodesAtPoint(location)
            //找出为EkoPoint类型的对象
            for p in arrObject {
                let point = p as? EkoPoint
                //如果该对象不为nil，而且是灰色的点，就开始寻路
                if point != nil && point!.type != PointType.red {
                    pointContainer.onGetNextPoint(point!.index)
                }
            }
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
