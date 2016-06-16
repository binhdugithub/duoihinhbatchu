//
//  Core.swift
//  quiz
//
//  Created by Nguyen Dinh Duy on 6/16/16.
//  Copyright © 2016 Nguyen Dinh Duy. All rights reserved.
//

import UIKit

class Core: NSObject
{
    static let Instance:Core = Core()
    
    var m_level: Int!
    var m_coin: Int!
    
    private override init()
    {
        super.init()
        m_level = 1
        m_coin = 100
        LoadListPhoto()
    }
    
    func LoadListPhoto() -> Void
    {
        let pathData: String = GetDocPathFile("data.plist")
        let dicData: NSDictionary? = NSDictionary(contentsOfFile: pathData)!
        
        if dicData != nil
        {
            
        }
        else
        {
            NSLog("Load data.plist failed !!")
            
        }
    }
    
    func GetDocPathFile(p_name: String) -> String
    {
        var destinationPath: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask , true)[0]
        destinationPath.appendContentsOf("/")
        destinationPath.appendContentsOf(p_name)
        if !NSFileManager.defaultManager().fileExistsAtPath(destinationPath)
        {
            var sourcePath: String = NSBundle.mainBundle().resourcePath!
            sourcePath.appendContentsOf("/")
            sourcePath.appendContentsOf(p_name)
            do
            {
                try NSFileManager.defaultManager().copyItemAtPath(sourcePath, toPath:destinationPath)
            }
            catch let l_error as NSError
            {
                print("Error: \(l_error.localizedDescription)")
            }
        }
        
        print("Path: \(destinationPath)")
        return destinationPath;
        
    }
}
