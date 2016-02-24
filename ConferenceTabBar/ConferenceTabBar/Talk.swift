//
//  Talk.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 10/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import Foundation

class Talk {
    
    var title: String
    var speakers: [Speaker] = []
    var startTime: String

    init(title: String, startTime: String) {
        self.title = title
        self.startTime = startTime
    }
    
    func addSpeaker(speaker: Speaker) {
       speakers.append(speaker)
    }
    
    func getSpeakerNames() -> String {
        
        //        var speakerString = "";
        //
        //        for speaker in speakers {
        //
        //            speakerString += "\(speaker.name), ";
        //            
        //        }
        //
        //        if !speakerString.isEmpty && (speakerString.characters.count >= 2) {
        //            
        //            speakerString = speakerString.substringToIndex(speakerString.endIndex.advancedBy(-2))
        //            
        //        }
        //        
        //        return speakerString;
        
        // CG - Loop through each of the Speaker objects in the array, and return a collection of their names.
        let names = speakers.map({ (speaker: Speaker) -> String in return speaker.name }) as [String]
    
        return names.joinWithSeparator(", ");
        
    }
    
}