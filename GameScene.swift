//
//  GameScene.swift
//  SpaceWar
//
//  Created by Илья on 30.06.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var spaceShip: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
      let spaceBackground = SKSpriteNode(imageNamed: "spaceBackground")
        
        addChild(spaceBackground)
        
         spaceShip = SKSpriteNode(imageNamed: "spaceShipp")
        spaceShip.xScale = 2
        spaceShip.yScale = 2
        spaceShip.physicsBody = SKPhysicsBody(texture: spaceShip.texture!, size: spaceShip.size)
        spaceShip.physicsBody?.isDynamic = false
        
        //        spaceShip.position = CGPoint(x: 100, y: 400)
        
        
        addChild(spaceShip)
        
        
//        generation asteroid
        let asteroidCreate = SKAction.run {
            let asteriod = self.createAsteroid()
            self.addChild(asteriod)
        }
        let asteroidCreationDelay = SKAction.wait(forDuration: 1.0, withRange: 0.5)
        let asteroidSequenceAction = SKAction.sequence([asteroidCreate, asteroidCreationDelay])
        let asteroidRunAction = SKAction.repeatForever(asteroidSequenceAction)
        
        run(asteroidRunAction)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let touchLocation = touch.location(in: self)
            print(touchLocation)
            
            let moveAction = SKAction.move(to: touchLocation, duration: 1)
            
            spaceShip.run(moveAction)
        }
    }
    
    func createAsteroid() -> SKSpriteNode {
        let asteroid = SKSpriteNode(imageNamed: "asteroid")
        
        
        
        asteroid.position.x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: 6))
        asteroid.position.y = frame.size.height + asteroid.size.height
        
        
        asteroid.physicsBody = SKPhysicsBody(texture: asteroid.texture!, size: asteroid.size)
        
        
        return asteroid
    }
    
    override func update(_ currentTime: TimeInterval) {
//        let asteroid = createAsteroid()
//        addChild(asteroid)
    }
    
}
