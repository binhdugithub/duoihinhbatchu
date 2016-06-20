//
//  SoundController.swift
//  DoVui
//
//  Created by Nguyen Dinh Duy on 5/25/16.
//  Copyright © 2016 Nguyen Dinh Duy. All rights reserved.
//

import UIKit
import AVFoundation


class SoundController: NSObject
{
    static let Instance = SoundController()
    var m_audioClick = AVAudioPlayer()
    var m_ismuted: Bool!
    
    enum type
    {
        case PlayClick
        case PlayGameOver
        case PlayCongratulation
        case PlaySwap
        case WinCoin
    }
    
    override init()
    {
        do
        {
            let l_pathSound = NSBundle.mainBundle().pathForResource("ButtonClick", ofType: "mp3")
            let l_audioSound = NSURL.fileURLWithPath(l_pathSound!)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: .DefaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true)
            
            m_audioClick = try AVAudioPlayer(contentsOfURL: l_audioSound)
            
        }
        catch let l_error as NSError
        {
            print("\(l_error)")
        }
    }
    
    func ChangeMute()
    {
        var l_IsMute: Bool = m_ismuted
        l_IsMute = l_IsMute ? false : true
        Configuration.Instance.WriteMute(l_IsMute)
    }
    
    func ButtonClick()
    {
        m_audioClick.currentTime = 0
        m_audioClick.prepareToPlay()
        m_audioClick.play()
    }
    
    func LetterRemove()
    {
        m_audioClick.currentTime = 0
        m_audioClick.prepareToPlay()
        m_audioClick.play()
    }
}