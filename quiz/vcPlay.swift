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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initShow()
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
        l_rectQuestionView.size.height = 1.0/3 * UIScreen.mainScreen().bounds.size.height
        l_rectQuestionView.origin.y = l_rectTopBar.size.height
        m_viewQuestion = UIView(frame: l_rectQuestionView)
        m_viewQuestion.backgroundColor = UIColor.yellowColor()
        
        // Answer view
        var l_rectAnswerView = CGRectMake(0, 0, 0, 0)
        l_rectAnswerView.size.width = UIScreen.mainScreen().bounds.size.width
        l_rectAnswerView.size.height = 1.0/6 * UIScreen.mainScreen().bounds.size.height
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
        l_rectSugestionView.size.height = 1.0/4 * UIScreen.mainScreen().bounds.size.height
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
        
    }
    //-----------------
    
    // Function go to home
    func BackToHome(sender: UIButton!)
    {
        self.performSegueWithIdentifier("sgPlayToHome", sender: self)
    }
    
}