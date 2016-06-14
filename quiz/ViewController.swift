//
//  ViewController.swift
//  quiz
//
//  Created by Nguyen Dinh Duy on 6/7/16.
//  Copyright © 2016 Nguyen Dinh Duy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var m_imgLogo : UIView!
    var m_btnStart : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initShow()
    }

    override func viewDidAppear(animated: Bool) {
        m_btnStart.pulseToSize(1.1, duration: 0.5, l_repeat: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Tạo giao diện (GUI)
    func initShow() -> Void
    {
        // Tạo button start
        var l_recStart: CGRect = CGRectMake(0, 0, 0, 0)
        l_recStart.size.width = 1.0/3 * UIScreen.mainScreen().bounds.size.width
        l_recStart.size.height = l_recStart.size.width
        l_recStart.origin.x = 1.0/2 * (UIScreen.mainScreen().bounds.width - l_recStart.size.width)
        l_recStart.origin.y = 3.0/4 * (UIScreen.mainScreen().bounds.height - l_recStart.size.height)
        
        m_btnStart = UIButton(frame: l_recStart)
        m_btnStart.setImage(UIImage(named: "btnPlay"), forState: .Normal)
        m_btnStart.setTitleShadowColor(UIColor.darkGrayColor(), forState: .Highlighted)
        
        m_btnStart.addTarget(self, action: #selector(ViewController.gameStart(_:)), forControlEvents: .TouchUpInside)
        
        // Tạo logo
        var l_recLogo : CGRect = CGRectMake(0, 0, 0, 0)
        l_recLogo.size.height = UIScreen.mainScreen().bounds.size.height - l_recStart.origin.y
        
        
        
        self.view.addSubview(m_btnStart)
    }
    
    // Function start game
    func gameStart(sender: UIButton!)
    {
        self.performSegueWithIdentifier("sgHomeToPlay", sender: self)
    }
    
  
}

