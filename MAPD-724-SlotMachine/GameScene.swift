//
//  GameScene.swift
//  MAPD-724-SlotMachine
//
//  Description: Slot Machine Game App
//  Version: v1.0.0
//
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var spaceship: Int32 = 0
    var mercury: Int32 = 0
    var venus: Int32 = 0
    var saturn: Int32 = 0
    var mars: Int32 = 0
    var jupiter: Int32 = 0
    var earth: Int32 = 0
    
    
    var currentReelValue1: String = ""
    var currentReelValue2: String = ""
    var currentReelValue3: String = ""
    let initialplayerMoney = 500;
    
    
    var winNumber: Int = 0 {
        didSet {
            winsCountLabel.text = "Wins: \(winNumber)"
        }
    }
    var lossNumber: Int! = 0  {
        didSet {
            lostCountLabel.text = "Losses: \(lossNumber ?? 0)"
        }
    }
    
    var turn: Int = 0 {
        didSet {
            turnCountLabel.text = "Turns: \(turn)"
        }
    }
    
    var jackpot: Int = 5000 {
        didSet {
            jackpotNumber.text = "\(jackpot)"
        }
    }
    
    var resultLabel: SKLabelNode!
    var winsCountLabel: SKLabelNode!
    var lostCountLabel: SKLabelNode!
    var turnCountLabel: SKLabelNode!
    var jackpotNumber: SKLabelNode!
    var jackpotLabel: SKLabelNode!
    
    var highestPayoutLabel: SKLabelNode!
    var highestPayoutAmount: SKLabelNode!
    
    var highestPayout: Int = 0 {
        didSet {
            highestPayoutAmount.text = "\(highestPayout)"
        }
    }

    // playerMoney
    var creditLabel: SKLabelNode!
    var creditNumber: SKLabelNode!
    var playerMoney:Int = 500 {
        didSet {
            creditNumber.text = "\(playerMoney)"
        }
    }
    
    // bets
    var betLabel: SKLabelNode!
    var betAmount: SKLabelNode!
    var bets:Int = 0 {
        didSet {
            betAmount.text = "\(bets)"
        }
    }
    
    // winner paid
    var winnerPaidLabel: SKLabelNode!
    var winnerPaidAmount: SKLabelNode!
    var winnerPaid:Int = 0 {
        didSet {
            winnerPaidAmount.text = "\(winnerPaid)"
        }
    }
    
    
    // 3 spin images as default images
    var reel_1: SKSpriteNode!
    var reel_2: SKSpriteNode!
    var reel_3: SKSpriteNode!
    
    // bets 10 20 50 100
    var betLabel_10: SKNode!
    var betLabel_20: SKNode!
    var betLabel_50: SKNode!
    var betLabel_100: SKNode!
    
    // Spin button
    var spinButton: SKSpriteNode!
    // Reset button
    var resetButton: SKNode!
    // Quit button
    var quitButton: SKNode!
    
    var helpButton: SKLabelNode!
    
    var fontName: String = "MarkerFelt-Wide"
    var fontSize_25: Int = 25
    var fontSize_30: Int = 30
    var fontSize_36: Int = 36
    var fontSize_40: Int = 40
    
    override func didMove(to view: SKView) {

        // Main background
        let bg_main = SKShapeNode(rectOf: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        bg_main.zPosition = -3
        bg_main.fillColor = UIColor(red: 0.00, green: 0.07, blue: 0.20, alpha: 1.00)
        bg_main.position = CGPoint(x: 0, y: 0)
        self.addChild(bg_main)
        
        // Logo
        let slotGraphic = SKSpriteNode(texture: SKTexture(imageNamed: "app_logo"), size: CGSize(width: 400, height: 150))
        slotGraphic.position = CGPoint(x: self.frame.size.width * 0.5 - 380, y: self.frame.size.height * 0.5 - 145)
        slotGraphic.zPosition = 1
        self.addChild(slotGraphic)
        
        // Jackpot Label
        jackpotLabel = SKLabelNode(text: "Global Jackpot:")
        jackpotLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 450, y: self.frame.size.height * 0.5 - 250)
        jackpotLabel.zPosition = 1
        jackpotLabel.fontName = fontName
        jackpotLabel.fontSize = CGFloat(fontSize_36)
        jackpotLabel.fontColor = UIColor.white
        self.addChild(jackpotLabel)
        
        // Jackpot Number
        jackpotNumber = SKLabelNode(text: "\(jackpot)")
        jackpotNumber.position = CGPoint(x: self.frame.size.width * 0.5 - 250, y: self.frame.size.height * 0.5 - 250)
        jackpotNumber.zPosition = 1
        jackpotNumber.fontName = fontName
        jackpotNumber.fontSize = CGFloat(fontSize_40)
        jackpotNumber.fontColor = UIColor.white
        self.addChild(jackpotNumber)
        
        // Highest Payout Label
        highestPayoutLabel = SKLabelNode(text: "Highest payout:")
        highestPayoutLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 450, y: self.frame.size.height * 0.5 - 290)
        highestPayoutLabel.zPosition = 1
        highestPayoutLabel.fontName = fontName
        highestPayoutLabel.fontSize = CGFloat(fontSize_36)
        highestPayoutLabel.fontColor = UIColor.white
        self.addChild(highestPayoutLabel)
        
        // Highest Payout Number
        highestPayoutAmount = SKLabelNode(text: "\(highestPayout)")
        highestPayoutAmount.position = CGPoint(x: self.frame.size.width * 0.5 - 250, y: self.frame.size.height * 0.5 - 290)
        highestPayoutAmount.zPosition = 1
        highestPayoutAmount.fontName = fontName
        highestPayoutAmount.fontSize = CGFloat(fontSize_40)
        highestPayoutAmount.fontColor = UIColor.white
        self.addChild(highestPayoutAmount)
        
        // resultLabel
        resultLabel = SKLabelNode(text: "Spin to Win")
        resultLabel.horizontalAlignmentMode = .center
        resultLabel.position = CGPoint(x: 0, y: self.frame.size.height * 0.5 - 475)
        resultLabel.zPosition = 1
        resultLabel.fontName = fontName
        resultLabel.fontSize = CGFloat(fontSize_36)
        resultLabel.fontColor = UIColor.white
        self.addChild(resultLabel)
        
        // winsCountLabel
        winsCountLabel = SKLabelNode(text: "Wins: 0")
        winsCountLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 550, y: self.frame.size.height * 0.5 - 435)
        winsCountLabel.zPosition = 1
        winsCountLabel.fontName = fontName
        winsCountLabel.fontSize = CGFloat(fontSize_25)
        winsCountLabel.fontColor = UIColor.white
        self.addChild(winsCountLabel)
        
        // lostCountLabel
        lostCountLabel = SKLabelNode(text: "Losses: 0")
        lostCountLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 400, y: self.frame.size.height * 0.5 - 435)
        lostCountLabel.zPosition = 1
        lostCountLabel.fontName = fontName
        lostCountLabel.fontSize = CGFloat(fontSize_25)
        lostCountLabel.fontColor = UIColor.white
        self.addChild(lostCountLabel)
        
        // turnCountLabel
        turnCountLabel = SKLabelNode(text: "Turns: 0")
        turnCountLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 250, y: self.frame.size.height * 0.5 - 435)
        turnCountLabel.zPosition = 1
        turnCountLabel.fontName = fontName
        turnCountLabel.fontSize = CGFloat(fontSize_25)
        turnCountLabel.fontColor = UIColor.white
        self.addChild(turnCountLabel)
        
        
        
        
        // playerMoney number
        creditNumber = SKLabelNode(text: "\(initialplayerMoney)")
        creditNumber.position = CGPoint(x: self.frame.size.width * 0.5 - 540, y: self.frame.size.height * 0.5 - 350)
        creditNumber.zPosition = 1
        creditNumber.fontName = fontName
        creditNumber.fontSize = CGFloat(fontSize_25)
        creditNumber.fontColor = UIColor.white
        self.addChild(creditNumber)
        
        // playerMoney label
        creditLabel = SKLabelNode(text: "Player Money")
        creditLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 540, y: self.frame.size.height * 0.5 - 380)
        creditLabel.zPosition = 1
        creditLabel.fontName = fontName
        creditLabel.fontSize = CGFloat(fontSize_25)
        creditLabel.fontColor = UIColor.white
        self.addChild(creditLabel)
        
        
        // Bets Amount
        betAmount = SKLabelNode(text: "0")
        betAmount.position = CGPoint(x: self.frame.size.width * 0.5 - 380, y: self.frame.size.height * 0.5 - 350)
        betAmount.zPosition = 1
        betAmount.fontName = fontName
        betAmount.fontSize = CGFloat(fontSize_25)
        betAmount.fontColor = UIColor.white
        self.addChild(betAmount)
        
        // Bets label
        betLabel = SKLabelNode(text: "BET")
        betLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 380, y: self.frame.size.height * 0.5 - 380)
        betLabel.zPosition = 1
        betLabel.fontName = fontName
        betLabel.fontSize = CGFloat(fontSize_25)
        betLabel.fontColor = UIColor.white
        self.addChild(betLabel)
        
        // WinnerPaid number
        winnerPaidAmount = SKLabelNode(text: "0")
        winnerPaidAmount.position = CGPoint(x: self.frame.size.width * 0.5 - 220, y: self.frame.size.height * 0.5 - 350)
        winnerPaidAmount.zPosition = 1
        winnerPaidAmount.fontName = fontName
        winnerPaidAmount.fontSize = CGFloat(fontSize_25)
        winnerPaidAmount.fontColor = UIColor.white
        self.addChild(winnerPaidAmount)
        
        // WinnerPaid label
        winnerPaidLabel = SKLabelNode(text: "Winner Paid")
        winnerPaidLabel.position = CGPoint(x: self.frame.size.width * 0.5 - 220, y: self.frame.size.height * 0.5 - 380)
        winnerPaidLabel.zPosition = 1
        winnerPaidLabel.fontName = fontName
        winnerPaidLabel.fontSize = CGFloat(fontSize_25)
        winnerPaidLabel.fontColor = UIColor.white
        self.addChild(winnerPaidLabel)
        
        
        
        
        // Slot background
        let bg_slot = SKShapeNode(rectOf: CGSize(width: 500, height: 350))
        bg_slot.zPosition = -2
        bg_slot.fillColor = UIColor(red: 0.82, green: 0.88, blue: 0.98, alpha: 1.00)
        bg_slot.position = CGPoint(x: 0, y: 0)
        self.addChild(bg_slot)
        
        // Spin1 background
        let bg_slot_1 = SKShapeNode(rectOf: CGSize(width: 150, height: 266))
        bg_slot_1.zPosition = -1
        bg_slot_1.fillColor = UIColor(red: 0.05, green: 0.02, blue: 0.07, alpha: 1.00)
        bg_slot_1.position = CGPoint(x: -160, y: 0)
        self.addChild(bg_slot_1)
        
        // Spin2 background
        let bg_slot_2 = SKShapeNode(rectOf: CGSize(width: 150, height: 266))
        bg_slot_2.zPosition = -1
        bg_slot_2.fillColor = UIColor(red: 0.05, green: 0.02, blue: 0.07, alpha: 1.00)
        bg_slot_2.position = CGPoint(x: 0, y: 0)
        self.addChild(bg_slot_2)
        
        // Spin3 background
        let bg_slot_3 = SKShapeNode(rectOf: CGSize(width: 150, height: 266))
        bg_slot_3.zPosition = -1
        bg_slot_3.fillColor = UIColor(red: 0.05, green: 0.02, blue: 0.07, alpha: 1.00)
        bg_slot_3.position = CGPoint(x: 160, y: 0)
        self.addChild(bg_slot_3)
        
        // 1st Spin Image
        reel_1 = SKSpriteNode(imageNamed: "spin_to_win")
        reel_1.size = CGSize(width: 150, height: 150)
        reel_1.position = CGPoint(x: -160, y: 0)
        reel_1.zPosition = 1
        self.addChild(reel_1)
        // 2nd Spin Image
        reel_2 = SKSpriteNode(imageNamed: "spin_to_win")
        reel_2.size = CGSize(width: 150, height: 150)
        reel_2.position = CGPoint(x: 0, y: 0)
        reel_2.zPosition = 1
        self.addChild(reel_2)
        // 3rd Spin Image
        reel_3 = SKSpriteNode(imageNamed: "spin_to_win")
        reel_3.size = CGSize(width: 150, height: 150)
        reel_3.position = CGPoint(x: 160, y: 0)
        reel_3.zPosition = 1
        self.addChild(reel_3)
        
        // Bet 10 label
        betLabel_10 = SKSpriteNode(texture: SKTexture(imageNamed: "button_10"), size: CGSize(width: 100, height: 60))
        betLabel_10.position = CGPoint(x: -180, y: -250)
        betLabel_10.zPosition = 1
        self.addChild(betLabel_10)
        
        // Bet 20 label
        betLabel_20 = SKSpriteNode(texture: SKTexture(imageNamed: "button_20"), size: CGSize(width: 100, height: 60))
        betLabel_20.position = CGPoint(x: -65, y: -250)
        betLabel_20.zPosition = 1
        self.addChild(betLabel_20)
        
        // Bet 50 label
        betLabel_50 = SKSpriteNode(texture: SKTexture(imageNamed: "button_50"), size: CGSize(width: 100, height: 60))
        betLabel_50.position = CGPoint(x: 65, y: -250)
        betLabel_50.zPosition = 1
        self.addChild(betLabel_50)
        
        // Bet 100 label
        betLabel_100 = SKSpriteNode(texture: SKTexture(imageNamed: "button_100"), size: CGSize(width: 100, height: 60))
        betLabel_100.position = CGPoint(x: 180, y: -250)
        betLabel_100.zPosition = 1
        self.addChild(betLabel_100)
        
        // SPIN button
        spinButton = SKSpriteNode(texture: SKTexture(imageNamed: "button_spin"), color: UIColor.white, size: CGSize(width: 300, height: 80))
        spinButton.position = CGPoint(x: 0, y: -350)
        spinButton.zPosition = 1
        self.addChild(spinButton)
        
        // RESET button
        resetButton = SKSpriteNode(texture: SKTexture(imageNamed: "button_reset"), size: CGSize(width: 150, height: 80))
        resetButton.position = CGPoint(x: -180, y: -450)
        resetButton.zPosition = 1
        self.addChild(resetButton)
        
        // QUIT button
        quitButton = SKSpriteNode(texture: SKTexture(imageNamed: "button_quit"), color: UIColor.white, size: CGSize(width: 150, height: 80))
        quitButton.position = CGPoint(x: 180, y: -450)
        quitButton.zPosition = 1
        self.addChild(quitButton)
        
        // HELP button
        helpButton = SKLabelNode(text: "Help?")
        helpButton.position = CGPoint(x: 200, y: 540)
        helpButton.zPosition = 1
        helpButton.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        helpButton.fontName = "AmericanTypewriter-Bold"
        helpButton.fontSize = CGFloat(25)
        helpButton.fontColor = SKColor.white
        self.addChild(helpButton)

    }
    
   
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if betLabel_10.contains(location){
                if (playerMoney < 10) {
                    showAlert(message: "You don't have enough Money to place that bet.")
                    disableSpinBtn()
                }else {
                    bets = 10
                }
            }
            if betLabel_20.contains(location){
                if (playerMoney < 20) {
                    showAlert(message: "You don't have enough Money to place that bet.")
                    disableSpinBtn()
                } else {
                    bets = 20
                }
            }
            if betLabel_50.contains(location){
                if (playerMoney < 50) {
                    showAlert(message: "You don't have enough Money to place that bet.")
                    disableSpinBtn()
                } else {
                    bets = 50
                }
            }
            if betLabel_100.contains(location){
                if (playerMoney < 100) {
                    showAlert(message: "You don't have enough Money to place that bet.")
                    disableSpinBtn()
                } else {
                    bets = 100
                }
            }
            
            if quitButton.contains(location){
                exit(0)
            }
            
            if resetButton.contains(location){
                reset()
            }
            
            if spinButton.contains(location) {
                resultLabel.text = "Spin to Win"
                if ( (playerMoney == 0) || (playerMoney < bets) ) {
                    showAlert(message: "You don't have enough Money to place that bet.")
                    bets = 0;
                    return;
                }
                if (bets == 0) {
                    showAlert(message: "Please enter bet amount")
                    return;
                }
                
                let wait: SKAction = SKAction.wait(forDuration: 0.2)
                let onSpinReel1: SKAction = SKAction.run {
                    self.onSpinReel(whichReel: 1)
                }
                let onSpinReel2: SKAction = SKAction.run {
                    self.onSpinReel(whichReel: 2)
                }
                let onSpinReel3: SKAction = SKAction.run {
                    self.onSpinReel(whichReel: 3)
                }
                let testReelValues: SKAction = SKAction.run {
                    self.determineWinnings()
                    self.clearState()
                }
                self.run(SKAction.sequence([
                    onSpinReel1,
                    wait,
                    onSpinReel2,
                    wait,
                    onSpinReel3,
                    wait,
                    testReelValues
                ]))
            }
            
            if helpButton.contains(location){
                setScene(sceneName: "HelpScene")
            }
        }
    }
    
    func clearState() {
        spaceship = 0
        mercury = 0
        venus = 0
        saturn = 0
        mars = 0
        jupiter = 0
        earth = 0
    }
    
    func disableSpinBtn() {
        spinButton.texture = SKTexture(imageNamed: "button_spin_grey");
    }
    
    func reset() {
        spinButton.texture = SKTexture(imageNamed: "button_spin");
        turn = 0
        bets = 0
        winNumber = 0
        lossNumber = 0
        playerMoney = initialplayerMoney
        resultLabel.text = "Spin to Win"
        reel_1.texture = SKTexture(imageNamed: "spin_to_win")
        reel_2.texture = SKTexture(imageNamed: "spin_to_win")
        reel_3.texture = SKTexture(imageNamed: "spin_to_win")
    }
    
    func setScene(sceneName:String) {
        if let view = self.view {
            if let scene = SKScene(fileNamed: sceneName) {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }
    }
    
    func onSpinReel(whichReel: Int) -> Void {
        let randomNum: UInt32 = arc4random_uniform( UInt32(100))
        var reelPick: String = "mercury"
        
        switch randomNum
        {
            case 0..<50:
                reelPick = "spaceship"
                spaceship += 1
                break
            case 50..<75:
                reelPick = "venus"
                venus += 1
                break
            case 75..<85:
                reelPick = "mars"
                mars += 1
                break
            case 85..<90:
                reelPick = "jupiter"
                jupiter += 1
                break
            case 90..<96:
                reelPick = "mercury"
                mercury += 1
                break
            case 96..<99:
                reelPick = "saturn"
                saturn += 1
                break
            case 99..<100:
                reelPick = "earth"
                earth += 1
                break
            default:
                break
        }
        
        if(whichReel == 1) {
            currentReelValue1 = reelPick
            reel_1.texture = SKTexture(imageNamed: reelPick)
        } else if(whichReel == 2) {
            currentReelValue2 = reelPick
            reel_2.texture = SKTexture(imageNamed: reelPick)
        } else if(whichReel == 3) {
            currentReelValue3 = reelPick
            reel_3.texture = SKTexture(imageNamed: reelPick)
        }
        
    }
    
    func determineWinnings() {
        turn += 1
        if (spaceship < 1) // win when zero sapceship
        {
            winNumber += 1
            resultLabel.text = "Congratulations, You Won!"
            if (mercury == 3) {
                winnerPaid = bets * 10;
            }
            else if(venus == 3) {
                winnerPaid = bets * 20;
            }
            else if (mars == 3) {
                winnerPaid = bets * 30;
            }
            else if (jupiter == 3) {
                winnerPaid = bets * 40;
            }
            else if (saturn == 3) {
                winnerPaid = bets * 50;
            }
            else if (earth == 3) {
                winnerPaid = bets * 100;
            }
            else if (mercury == 2) {
                winnerPaid = bets * 2;
            }
            else if (venus == 2) {
                winnerPaid = bets * 2;
            }
            else if (mars == 2) {
                winnerPaid = bets * 2;
            }
            else if (jupiter == 2) {
                winnerPaid = bets * 2;
            }
            else if (saturn == 2) {
                winnerPaid = bets * 3;
            }
            else if (earth == 2) {
                winnerPaid = bets * 20;
            }
            else if (earth == 1) {
                winnerPaid = bets * 5;
            }else{
                winnerPaid = bets * 1;
            }
            
            playerMoney += winnerPaid
            if (winnerPaid > highestPayout)
            {
                highestPayout = winnerPaid
            }
            if (earth == 3) {//When All 3 earth, then there is chance that you can win jackpot
                checkJackpot()
            }
            
        } else {
            lossNumber += 1
            resultLabel.text = "You lost!"
            playerMoney -= bets
            winnerPaid = 0
            // add 25% of bet amount to jackpot when player lose
            jackpot += (Int)(bets / 25)
        }
        
        if (playerMoney < bets) {
            bets = 0;
        }
    }
    
    func showAlert(message : String) {
        let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {_ in }
        alert.addAction(okAction)
        self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func checkJackpot() {
        let randomNum1: Int = Int.random(in: 1..<90)
        let randomNum2: Int = Int.random(in: 1..<90)
        if(randomNum1 == randomNum2){
            winnerPaid = jackpot
            playerMoney += winnerPaid
            jackpot = 5000
            showAlert(message: "Congratulations, You won jackpot of $\(winnerPaid)!!")
            resultLabel.text = "Congratulations,  You won jackpot of $\(winnerPaid)!!!!"
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
