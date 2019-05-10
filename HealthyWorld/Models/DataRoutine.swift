//
//  DataRoutine.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 17/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation
//Clase que contiene la clase de los datos
public class RoutineData: NSObject {
    
    public var videos:[URL] = []
    
    override init() {
        super.init()
        self.videos = getVideos()
    }
    
    private func getVideos() -> [URL] {
        var vid:[URL] = []
        
        for _ in 0...9{
            let video = Bundle.main.url(forResource: "video", withExtension: "mp4")
            vid.append(video!)
        }
        
        return vid
    }
    
    
}
