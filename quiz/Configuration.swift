//
//  Configuration.swift
//  quiz
//
//  Created by Nguyen Dinh Duy on 6/16/16.
//  Copyright © 2016 Nguyen Dinh Duy. All rights reserved.
//

import UIKit

class Configuration
{
    static let Instance = Configuration()
    
    private init()
    {
        LoadConfig()
    }
    
    func CallSelf() -> Void
    {
        print("Function do nothing")
    }
    
    func LoadConfig()
    {
        let pathData: String = Core.Instance.GetDocPathFile("save.plist")
        let dicData: NSDictionary? = NSDictionary(contentsOfFile: pathData)!
        if dicData != nil
        {
            if let l_ismuted = dicData?.objectForKey("ismuted") as? Bool
            {
                SoundController.Instance.m_ismuted = l_ismuted
            }
            else
            {
                SoundController.Instance.m_ismuted = false
            }
            
            if let l_level = dicData?.objectForKey("level") as? Int
            {
                Core.Instance.m_level = l_level
            }
            else
            {
                Core.Instance.m_level = 1
            }
            
            if let l_coin = dicData?.objectForKey("coin") as? Int
            {
                Core.Instance.m_coin = l_coin
            }
            else
            {
                Core.Instance.m_coin = 100
            }
            
        }
        else
        {
            NSLog("Load data.plist fail !!")
            SoundController.Instance.m_ismuted = false
            Core.Instance.m_level = 1
            Core.Instance.m_coin = 100
        }
        
    }
    
    func WriteLevel(p_level: Int)
    {
        let pathData: String = Core.Instance.GetDocPathFile("save.plist")
        let dicData: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: pathData)!
        if let l_dicData = dicData
        {
            l_dicData.setObject(NSNumber(integer: p_level), forKey:"level")
            l_dicData.writeToFile(pathData, atomically:true)
        }
        else
        {
            NSLog("Load data plist info fail !!")
            
        }
    }
    
    func WriteCoin(p_coin: Int)
    {
        let pathData: String = Core.Instance.GetDocPathFile("save.plist")
        let dicData: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: pathData)!
        if let l_dicData = dicData
        {
            l_dicData.setObject(NSNumber(integer: p_coin), forKey:"coin")
            l_dicData.writeToFile(pathData, atomically:true)
        }
        else
        {
            NSLog("Load data plist info fail !!")
            
        }
    }
    
    func WriteMute(p_mute: Bool)
    {
        let pathData: String = Core.Instance.GetDocPathFile("save.plist")
        let dicData: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: pathData)!
        if let l_dicData = dicData
        {
            l_dicData.setObject(p_mute, forKey:"ismuted")
            l_dicData.writeToFile(pathData, atomically:true)
        }
        else
        {
            NSLog("Load data plist info fail !!")
            
        }
    }
}
