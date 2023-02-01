//
//  HelpScene.swift
//  MAPD-724-SlotMachine
//
//  Created by Nirav Goswami on 2023-02-01.
//
import SpriteKit
import GameplayKit


class HelpScene : SKScene
{
    
    var backButton: SKLabelNode!
    override func didMove(to view: SKView) {
        let ansFontColor = UIColor(red: 0.35, green: 0.77, blue: 1.00, alpha: 1.00)
        let queAnsFontSize = CGFloat(30)
        self.backgroundColor = UIColor(red: 0.00, green: 0.07, blue: 0.20, alpha: 1.00)
        
        backButton = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        backButton.text = "< Home"
        backButton.position = CGPoint(x: -230, y: 520)
        backButton.zPosition = 1
        backButton.fontSize = CGFloat(30)
        backButton.fontColor = SKColor.white
        self.addChild(backButton)
        
        let title = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        title.text = "Help"
        title.fontSize = CGFloat(50)
        title.fontColor = SKColor.white
        title.position = CGPoint(x: frame.midX, y: 520)
        self.addChild(title)
        
        let q1 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        q1.text = "How to Play?"
        q1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        q1.fontSize = queAnsFontSize
        q1.fontColor = SKColor.white
        q1.position = CGPoint(x: -280, y: 430)
        self.addChild(q1)
        
        
        let a1 = SKLabelNode(fontNamed: "MarkerFelt-Thin")
        a1.text = "1. Please select Bet Amount \n2. Press spin button to start the game. \n3. Wait for the result and then play again."
        a1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        a1.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        a1.fontSize = queAnsFontSize
        a1.fontColor = ansFontColor
        a1.position = CGPoint(x: -280, y: 350)
        a1.lineBreakMode = NSLineBreakMode.byWordWrapping
        a1.numberOfLines = 0
        a1.preferredMaxLayoutWidth = 500
        self.addChild(a1)
        
        let q2 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        q2.text = "Rules"
        q2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        q2.fontSize = queAnsFontSize
        q2.fontColor = SKColor.white
        q2.position = CGPoint(x: -280, y: 200)
        self.addChild(q2)


        let a2 = SKLabelNode(fontNamed: "MarkerFelt-Thin")
        a2.text = "1. You will win when there is no 'Spaceship' in any of 3 wheel. \n2. You can win amount euqal to 1-100 times of your bet. \n3. Jackpot Rule: You get chance to win jackpot if you get all 3 'Earth'."
        a2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        a2.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        a2.fontSize = queAnsFontSize
        a2.fontColor = ansFontColor
        a2.position = CGPoint(x: -280, y: 80)
        a2.lineBreakMode = NSLineBreakMode.byWordWrapping
        a2.numberOfLines = 0
        a2.preferredMaxLayoutWidth = 500
        self.addChild(a2)

        
    }
    
    func setScene(sceneName:String) {
        if let view = self.view {
            if let scene = SKScene(fileNamed: sceneName) {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if backButton.contains(location){
                setScene(sceneName: "GameScene")
            }
        }
        
    }
}
