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
        var l_recTopBar = CGRectMake(0, 0, 0, 0)
        l_recTopBar.size.width = UIScreen.mainScreen().bounds.size.width
        l_recTopBar.size.height = 1.0/12 * UIScreen.mainScreen().bounds.size.height
        
        m_viewTopBar = UIView(frame: l_recTopBar)
        m_viewTopBar.backgroundColor = UIColor.darkGrayColor()
        
        
        // Back button
        var l_recBtnBack = CGRectMake(0, 0, 0, 0)
        l_recBtnBack.size.width = l_recTopBar.size.height
        l_recBtnBack.size.height = l_recTopBar.size.height
        
        m_btnBack = UIButton(frame: l_recBtnBack)
        m_btnBack.setTitle("Back", forState: .Normal)
        m_btnBack.backgroundColor = UIColor.brownColor()
        
        // Coin
        var l_recCoin = CGRectMake(0, 0, 0, 0)
        
        m_viewCoin = UIView(frame: l_recCoin)
        
        // Level
        var l_recLevel = CGRectMake(0, 0, 0, 0)
        
        m_viewLevel = UIView(frame: l_recLevel)
        
        m_viewTopBar.addSubview(m_btnBack)
        m_viewTopBar.addSubview(m_viewCoin)
        m_viewTopBar.addSubview(m_viewLevel)
        
        self.view.addSubview(m_viewTopBar)
    }
    
    func initSugestionButton()
    {
        
    }
    
    func initAnswerButton()
    {
        
    }
    //-----------------
    
}