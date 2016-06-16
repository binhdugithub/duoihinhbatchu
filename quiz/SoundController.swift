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
    var m_audioPlay = AVAudioPlayer()
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
        
    }
    
    func ChangeMute()
    {
        var l_IsMute: Bool = m_ismuted
        l_IsMute = l_IsMute ? false : true
        Configuration.Instance.WriteMute(l_IsMute)
    }
    
    func playSound(name: String?, ofType: String?)
    {
        do
        {
            let l_pathSound = NSBundle.mainBundle().pathForResource(name, ofType: ofType)
            let l_audioSound = NSURL.fileURLWithPath(l_pathSound!)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: .DefaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true)
            
            m_audioPlay = try AVAudioPlayer(contentsOfURL: l_audioSound)
            m_audioPlay.currentTime = 0
            m_audioPlay.prepareToPlay()
            m_audioPlay.play()
        }
        catch let l_error as NSError
        {
            print("\(l_error)")
        }
        
        
    }
    
    func Play(playType : type)
    {
        if m_ismuted == true
        {
            return
        }
        switch playType
        {
        case .PlayClick:
            playSound("click", ofType: "mp3")
        case .PlayCongratulation:
            playSound("congratulation", ofType: "mp3")
        case .PlayGameOver:
            playSound("gameover", ofType: "mp3")
        case .WinCoin:
            playSound("correct", ofType: "mp3")
        case .PlaySwap:
            playSound("fail", ofType: "mp3")
        }
        
        
    }
}