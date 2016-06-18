//
//  vcPlay.swift
//  quiz
//
//  Created by Nguyen Dinh Duy on 6/12/16.
//  Copyright © 2016 Nguyen Dinh Duy. All rights reserved.
//

import UIKit

class vcPlay: UIViewController
{
    var m_viewTopBar : UIView!
    var m_btnBack : UIButton!
    var m_btnMenu : UIButton!
    var m_btnLevel : UIButton!
    var m_lblLevel: UILabel!
    var m_btnCoin : UIButton!
    
    var m_viewQuestion : UIView!
    var m_viewAnswer : UIView!
    var m_viewSugestion : UIView!
    var m_viewHelp : UIView!
    var m_btnAsk : UIButton!
    var m_btnHint : UIButton!
    
    var m_arrayAnswer : [UIButton] = [UIButton]()
    var m_arraySugestion : [UIButton] = [UIButton]()
    var m_answer : String = "firework"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initShow()
        self.initAnswerButton(8)
        self.initSugestionButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // Lam viec voi GUI
    //-----------------
    func initShow()
    {
        // Top bar
        var l_rectTopBar = CGRectMake(0, 0, 0, 0)
        l_rectTopBar.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectTopBar.size.height = 1.0/12 * UIScreen.mainScreen().bounds.size.height
        m_viewTopBar = UIView(frame: l_rectTopBar)
        m_viewTopBar.backgroundColor = UIColor(red: 51.0/255, green: 51.0/255, blue: 51.0/255, alpha: 1)
        
        
        // Back button
        var l_rectBtnBack = CGRectMake(0, 0, 0, 0)
        l_rectBtnBack.size.width = l_rectTopBar.size.height
        l_rectBtnBack.size.height = l_rectTopBar.size.height
        m_btnBack = UIButton(frame: l_rectBtnBack)
        m_btnBack.setTitle("Back", forState: .Normal)
        m_btnBack.backgroundColor = UIColor(red: 83.0/255, green: 83.0/255, blue: 83.0/255, alpha: 1)
        m_btnBack.addTarget(self, action: #selector(vcPlay.BackToHome(_:)), forControlEvents: .TouchUpInside)
        
        // menu button
        var l_rectBtnMenu = m_btnBack.frame
        l_rectBtnMenu.origin.x = m_viewTopBar.frame.size.width - l_rectBtnMenu.size.width
        l_rectBtnMenu.origin.y = 0
        m_btnMenu = UIButton(frame: l_rectBtnMenu)
        m_btnMenu.setTitle("Menu", forState: .Normal)
        m_btnMenu.backgroundColor = UIColor(red: 83.0/255, green: 83.0/255, blue: 83.0/255, alpha: 1)
        m_btnMenu.addTarget(self, action: #selector(vcPlay.actionMenu(_:)), forControlEvents: .TouchUpInside)


        // Coin
        var l_rectCoin = CGRectMake(0, 0, 0, 0)
        l_rectCoin.size.width = 0.5 * (m_viewTopBar.frame.size.width - 3 * m_btnBack.frame.size.width)
        l_rectCoin.size.height = 1.0/3 * l_rectCoin.size.width
        l_rectCoin.origin.x = 0.25 * m_btnBack.frame.size.width + m_btnBack.frame.origin.x + m_btnBack.frame.size.width
        l_rectCoin.origin.y = 0.5 * (m_viewTopBar.frame.size.height - l_rectCoin.size.height)
        m_btnCoin = UIButton(frame: l_rectCoin)
        m_btnCoin.setImage(UIImage(named: "coin"), forState: .Normal)
        
        // Level
        var l_rectLevel = m_btnCoin.frame
        l_rectLevel.origin.x = m_btnMenu.frame.origin.x - l_rectLevel.size.width - 0.25 * m_btnBack.frame.size.width
        m_btnLevel = UIButton(frame: l_rectLevel)
        m_btnLevel.setImage(UIImage(named: "level"), forState: .Normal)
        
        m_viewTopBar.addSubview(m_btnBack)
         m_viewTopBar.addSubview(m_btnMenu)
        m_viewTopBar.addSubview(m_btnCoin)
        m_viewTopBar.addSubview(m_btnLevel)
        
        // Question view
        var l_rectQuestionView = CGRectMake(0, 0, 0, 0)
        l_rectQuestionView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectQuestionView.size.height = 2.0/5 * UIScreen.mainScreen().bounds.size.height
        l_rectQuestionView.origin.y = l_rectTopBar.size.height
        m_viewQuestion = UIView(frame: l_rectQuestionView)
        //m_viewQuestion.backgroundColor = UIColor.yellowColor()
        
        // Answer view
        var l_rectAnswerView = CGRectMake(0, 0, 0, 0)
        l_rectAnswerView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectAnswerView.size.height = 3.0/20 * UIScreen.mainScreen().bounds.size.height
        l_rectAnswerView.origin.y = l_rectQuestionView.origin.y + l_rectQuestionView.size.height
        m_viewAnswer = UIView(frame: l_rectAnswerView)
        //m_viewAnswer.backgroundColor = UIColor.orangeColor()
        
        // Help view
        var l_rectHelpView = CGRectMake(0, 0, 0, 0)
        l_rectHelpView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectHelpView.size.height = 1.0/12 * UIScreen.mainScreen().bounds.size.height
        l_rectHelpView.origin.y = l_rectAnswerView.origin.y + l_rectAnswerView.size.height
        m_viewHelp = UIView(frame: l_rectHelpView)
        //m_viewHelp.backgroundColor = UIColor.greenColor()
        
        // Ask button
        let x = 15.0/33 * l_rectHelpView.size.width
        var l_rectAskButton = CGRectMake(0, 0, 0, 0)
        l_rectAskButton.size.width = x
        l_rectAskButton.size.height = l_rectHelpView.size.height - 1.0/15 * x
        l_rectAskButton.origin.x = 1.0/15 * x
        l_rectAskButton.origin.y = 1.0/2 * (l_rectHelpView.size.height - l_rectAskButton.size.height)
        m_btnAsk = UIButton(frame: l_rectAskButton)
        m_btnAsk.backgroundColor = UIColor.blueColor()
        m_btnAsk.layer.cornerRadius = 8.0
        m_btnAsk.setTitle("ASK FACEBOOK", forState: .Normal)
        
        // Hint button
        var l_rectHintButton = CGRectMake(0, 0, 0, 0)
        l_rectHintButton.size = l_rectAskButton.size
        l_rectHintButton.origin.x = l_rectAskButton.origin.x + l_rectAskButton.size.width + 1.0/15 * x
        l_rectHintButton.origin.y = l_rectAskButton.origin.y
        m_btnHint = UIButton(frame: l_rectHintButton)
        m_btnHint.backgroundColor = UIColor.purpleColor()
        m_btnHint.layer.cornerRadius = 8.0
        m_btnHint.setTitle("USE A HINT", forState: .Normal)
        
        m_viewHelp.addSubview(m_btnAsk)
        m_viewHelp.addSubview(m_btnHint)
        
        // Sugestion view
        var l_rectSugestionView = CGRectMake(0, 0, 0, 0)
        l_rectSugestionView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectSugestionView.size.height = 1.0/5 * UIScreen.mainScreen().bounds.size.height
        l_rectSugestionView.origin.y = l_rectHelpView.origin.y + l_rectHelpView.size.height
        m_viewSugestion = UIView(frame: l_rectSugestionView)
        //m_viewSugestion.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(m_viewTopBar)
        self.view.addSubview(m_viewQuestion)
        self.view.addSubview(m_viewAnswer)
        self.view.addSubview(m_viewHelp)
        self.view.addSubview(m_viewSugestion)
    }
    
    //~ Tao button goi y
    func initSugestionButton()
    {
        let str = CreateSuggestResult(m_answer)
        var rSquare = CGRectMake(0, 0, 0, 0)
        let w = 12.0/(7 * CGFloat(Constants.NUM_RANDOM_BUTTON)) * m_viewSugestion.frame.size.width
        let h = 4.0/11 * m_viewSugestion.frame.size.height
        rSquare.size.width = w
        rSquare.size.height = h
        print("w = \(w) & h = \(h)")
        let spaceW = 1.0/6 * w
        let spaceH = 1.0/4 * h
        
        rSquare.origin.x = spaceW / 2
        rSquare.origin.y = spaceH
        
        for i in 0..<2
        {
            rSquare.origin.y = spaceH + CGFloat(i) * (spaceH + h)
            for j in 0..<(Constants.NUM_RANDOM_BUTTON/2)
            {
                rSquare.origin.x = spaceW/2 + CGFloat(j) * (spaceW + w)
                let btnSquare : UIButton = UIButton(frame: rSquare)
                
                btnSquare.layer.borderWidth = 1
                btnSquare.layer.cornerRadius = 5.0
                btnSquare.setTitleColor(UIColor.blackColor(), forState: .Normal)
                btnSquare.setTitleShadowColor(UIColor.blackColor(), forState: .Highlighted)
                btnSquare.backgroundColor = UIColor.yellowColor()
                btnSquare.tag = i * Constants.NUM_RANDOM_BUTTON/2 + j
                
                if (btnSquare.tag < str.characters.count)
                {
                    let range = Range<String.Index>(str.startIndex.advancedBy(btnSquare.tag)..<str.startIndex.advancedBy(btnSquare.tag + 1))
                    btnSquare.setTitle(str.substringWithRange(range), forState: .Normal)
                    //                    btnSquare.addTarget(self, action: #selector(vcPlay.btnSuggestion_Click(_:)), forControlEvents: .TouchUpInside)
                    m_viewSugestion.addSubview(btnSquare)
                    m_arraySugestion.append(btnSquare)
                }
            }
        }
    }
    
    //~ Tao button dap an
    func initAnswerButton(count : Int)
    {
        var rSquare = CGRectMake(0, 0, 0, 0)
        let w = 12.0/(7 * 25) * m_viewAnswer.frame.size.width
        let h = 4.0/11 * m_viewAnswer.frame.size.height
        rSquare.size.width = w
        rSquare.size.height = h
        print("w = \(w) & h = \(h)")
        let spaceW = 1.0/6 * w
        let spaceH = 1.0/4 * h
        let left = 1.0/2 * (m_viewAnswer.frame.size.width - CGFloat(count) * (w + spaceW))
        rSquare.origin.y = 1.0/2 * (m_viewAnswer.frame.size.height - h)
        for i in 0..<count
        {
            rSquare.origin.x = left + CGFloat(i) * (spaceW + w)
            let btnSquare : UIButton = UIButton(frame: rSquare)
            
            btnSquare.layer.borderWidth = 1
            btnSquare.layer.cornerRadius = 5.0
            btnSquare.setTitle(" ", forState: .Normal)
            btnSquare.setTitleColor(UIColor.cyanColor(), forState: .Highlighted)
            btnSquare.setTitleShadowColor(UIColor.blackColor(), forState: .Highlighted)
            btnSquare.backgroundColor = UIColor.whiteColor()
//            btnSquare.addTarget(self, action: #selector(vcPlay.btnAnswer_Click(_:)), forControlEvents: .TouchUpInside)
            m_viewAnswer.addSubview(btnSquare)
            m_arrayAnswer.append(btnSquare)

        }
    }
    //-----------------
    
    func CreateSuggestResult(endRult: String) -> String
    {
        //print(endRult)
        var str = endRult
        var str1 : String = ""
        
        
        for _ in 0..<(Constants.NUM_RANDOM_BUTTON - str.characters.count) //(int i= 0 ; i < NUM_RANDOM_BUTTON - [enResult length] ; i++)
        {
            
            let k : Int = Int(arc4random()) % Constants.Alphabet.count
            
            let ch = Constants.Alphabet[k]
            str.append(ch)
        }
        //print("+++++++++++++++++++")
        while (str.characters.count > 0)
        {
            
            let j : Int = Int(arc4random()) % str.characters.count
            let range = Range<String.Index>(str.startIndex.advancedBy(j)..<str.startIndex.advancedBy(j+1))
            let sub : String = str.substringWithRange(range)
            
            str1 += sub
            str = str.stringByReplacingOccurrencesOfString(sub, withString: "", options: .LiteralSearch , range: range)
            //print(str + "/" + sub)
        }
        //print("+++++++++++++++++++")
        return str1
    }

    
    // Function go to home
    func BackToHome(sender: UIButton!)
    {
        self.performSegueWithIdentifier("sgPlayToHome", sender: self)
    }
    
    // Function go to home
    func actionMenu(sender: UIButton!)
    {
        //self.performSegueWithIdentifier("sgPlayToHome", sender: self)
    }
    
}