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
    var m_viewLevel : UIView!
    var m_viewCoin : UIView!
    var m_viewQuestion : UIView!
    var m_viewAnswer : UIView!
    var m_viewSugestion : UIView!
    var m_viewHelp : UIView!
    
    var m_arrayAnswer : [UIButton] = [UIButton]()
    var m_arraySugestion : [UIButton] = [UIButton]()
    var m_answer : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initShow()
        self.initAnswerButton()
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
        m_viewTopBar.backgroundColor = UIColor.darkGrayColor()
        
        
        // Back button
        var l_rectBtnBack = CGRectMake(0, 0, 0, 0)
        l_rectBtnBack.size.width = l_rectTopBar.size.height
        l_rectBtnBack.size.height = l_rectTopBar.size.height
        m_btnBack = UIButton(frame: l_rectBtnBack)
        m_btnBack.setTitle("Back", forState: .Normal)
        m_btnBack.backgroundColor = UIColor.brownColor()
        m_btnBack.addTarget(self, action: #selector(vcPlay.BackToHome(_:)), forControlEvents: .TouchUpInside)

        
        // Coin
        var l_rectCoin = CGRectMake(0, 0, 0, 0)
        m_viewCoin = UIView(frame: l_rectCoin)
        
        // Level
        var l_rectLevel = CGRectMake(0, 0, 0, 0)
        m_viewLevel = UIView(frame: l_rectLevel)
        
        m_viewTopBar.addSubview(m_btnBack)
        m_viewTopBar.addSubview(m_viewCoin)
        m_viewTopBar.addSubview(m_viewLevel)
        
        // Question view
        var l_rectQuestionView = CGRectMake(0, 0, 0, 0)
        l_rectQuestionView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectQuestionView.size.height = 2.0/5 * UIScreen.mainScreen().bounds.size.height
        l_rectQuestionView.origin.y = l_rectTopBar.size.height
        m_viewQuestion = UIView(frame: l_rectQuestionView)
        m_viewQuestion.backgroundColor = UIColor.yellowColor()
        
        // Answer view
        var l_rectAnswerView = CGRectMake(0, 0, 0, 0)
        l_rectAnswerView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectAnswerView.size.height = 1.0/7 * UIScreen.mainScreen().bounds.size.height
        l_rectAnswerView.origin.y = l_rectQuestionView.origin.y + l_rectQuestionView.size.height
        m_viewAnswer = UIView(frame: l_rectAnswerView)
        m_viewAnswer.backgroundColor = UIColor.orangeColor()
        
        // Help view
        var l_rectHelpView = CGRectMake(0, 0, 0, 0)
        l_rectHelpView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectHelpView.size.height = 1.0/12 * UIScreen.mainScreen().bounds.size.height
        l_rectHelpView.origin.y = l_rectAnswerView.origin.y + l_rectAnswerView.size.height
        m_viewHelp = UIView(frame: l_rectHelpView)
        m_viewHelp.backgroundColor = UIColor.greenColor()
        
        // Sugestion view
        var l_rectSugestionView = CGRectMake(0, 0, 0, 0)
        l_rectSugestionView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectSugestionView.size.height = 1.0/5 * UIScreen.mainScreen().bounds.size.height
        l_rectSugestionView.origin.y = l_rectHelpView.origin.y + l_rectHelpView.size.height
        m_viewSugestion = UIView(frame: l_rectSugestionView)
        m_viewSugestion.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(m_viewTopBar)
        self.view.addSubview(m_viewQuestion)
        self.view.addSubview(m_viewAnswer)
        self.view.addSubview(m_viewHelp)
        self.view.addSubview(m_viewSugestion)
    }
    
    //~ Tao button goi y
    func initSugestionButton()
    {
        
    }
    
    //~ Tao button dap an
    func initAnswerButton()
    {
        CreateSuggestResult(m_answer)
        var rSquare = CGRectMake(0, 0, 0, 0)
        let w = 12.0/(7 * CGFloat(Constants.NUM_RANDOM_BUTTON)) * UIScreen.mainScreen().bounds.width
        rSquare.size.width = w
        rSquare.size.height = 3.0/2 * w

        let spaceW = 1.0/6 * w
        let spaceH = 1.0/3 * (m_viewSugestion.frame.size.height - 2 * rSquare.size.height)
        
        rSquare.origin.x = spaceW / 2
        rSquare.origin.y = spaceH
        
        for i in 0..<2
        {
            rSquare.origin.y = spaceH + CGFloat(i) * (spaceH + rSquare.size.height)
            for j in 0..<(Constants.NUM_RANDOM_BUTTON/2)
            {
                rSquare.origin.x = spaceW/2 + CGFloat(j) * (spaceW + w)
                let btnSquare : UIButton = UIButton(frame: rSquare)
                
                btnSquare.layer.borderWidth = 1
                btnSquare.layer.cornerRadius = 10.0
                btnSquare.setTitle(" ", forState: .Normal)
                btnSquare.setTitleColor(UIColor.cyanColor(), forState: .Highlighted)
                btnSquare.setTitleShadowColor(UIColor.blackColor(), forState: .Highlighted)
                btnSquare.backgroundColor = UIColor.darkGrayColor()
//                btnSquare.addTarget(self, action: #selector(vcPlay.btnAnswer_Click(_:)), forControlEvents: .TouchUpInside)
                m_viewSugestion.addSubview(btnSquare)
                m_arrayAnswer.append(btnSquare)
            }
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
    
}