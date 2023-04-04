//
//  GameScene.swift
//  animacaoSpriteKIt
//
//  Created by Ana Raiany Guimarães Gomes on 2023-04-03.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: 750, height: 1734)
        background.zPosition = 0
        return background
    }()
    
    private lazy var peixe1: SKSpriteNode = {
        let peixe1 = SKSpriteNode(imageNamed: "peixe1")
        peixe1.position = CGPoint(x: size.width/2, y: size.height/2 + 300)
        peixe1.size = CGSize(width: 256, height: 256)
        peixe1.zPosition = 1
        return peixe1
    }()
    
    override func didMove(to view: SKView) {
        
        addChild(background)
        addChild(peixe1)
        addChild(label)
        animationPlayer()
    }
    
    func animationPlayer(){
            var playerTextures = [SKTexture]()
            for i in 1...4 {
                playerTextures.append(SKTexture(imageNamed: "peixe\(i)"))
            }
            let animationAction = SKAction.animate(with: playerTextures, timePerFrame: 0.09)
            let repeatAction = SKAction.repeatForever(animationAction)
            peixe1.run(repeatAction)
        }

    private lazy var label: SKLabelNode = {
        let lb = SKLabelNode(text: "Pause")
        lb.position = CGPoint(x: size.width/2, y: size.height/2 - 300)
        lb.name = "PlayAndPause"
        lb.fontColor = UIColor.black
        lb.fontSize = 100
        return lb
    }()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           for touch in touches {
               let location = touch.location(in: self)
               let touchedNode = atPoint(location)
               if touchedNode.name == "PlayAndPause" {
                   print("Clicaram em mim galera")
                   if peixe1.isPaused == true {
                       peixe1.isPaused = false
                       if label.text == "Pause" {
                           label.text = "Play"
                       } else {
                           label.text = "Pause"
                       }
                   } else {
                       peixe1.isPaused = true
                       if label.text == "Pause" {
                           label.text = "Play"
                       } else {
                           label.text = "Pause"
                       }
                   }
               }
           }
       }
    
}
