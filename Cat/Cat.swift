//
//  Cat.swift
//  Cat
//
//  Created by jim on 15/12/2.
//  Copyright © 2015年 jim. All rights reserved.
//

import SpriteKit

class Cat: SKSpriteNode {
    //纹理集
    let dbAtlas = SKTextureAtlas(named: "db.atlas")
    //纹理组
    var dbFrames  = [SKTexture]()
    
    
    //重写构造方法
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        //获取纹理集的第一个纹理
        let texture = dbAtlas.textureNamed("db_01.png")
        //获取纹理尺寸
        let size = texture.size()
        //执行父类的构造方法
        super.init(texture: texture, color: SKColor.whiteColor(), size: size)
            var i: Int
            var tempName: String
            //从纹理集中获取加入数组
            for i=1; i<=dbAtlas.textureNames.count; i++ {
                tempName = String(format: "db_%.2d", i)
                let dbTexture = dbAtlas.textureNamed(tempName)
                dbFrames.append( dbTexture )
        }
            //设置中心点
            self.anchorPoint = CGPointMake(0.5, 0.2)
            //播放动画
            db()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    func db() {
        //循环播放纹理动画
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(dbFrames, timePerFrame: 0.2)))
    }
    
    
}
