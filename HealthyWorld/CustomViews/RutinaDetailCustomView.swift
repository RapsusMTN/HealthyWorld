//
//  RutinaDetailCustomView.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 17/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class RutinaDetailCustomView: UIView{
    

    @IBOutlet weak var videoView: VideoView!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureVideowith(urlPath: (Bundle.main.url(forResource: "conejo", withExtension: "mp4")?.absoluteString)!)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        configureVideowith(urlPath: (Bundle.main.url(forResource: "conejo", withExtension: "mp4")?.absoluteString)!)
    }
    
    func configureVideowith(urlPath: String) {
        self.videoView.configure(url: (urlPath))
        self.videoView.isLoop = true
        self.videoView.play()
        
       
    }
    
    
    func setup()
    {
        contentView = loadViewFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(contentView)
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    }
    
    func loadViewFromNib() -> UIView!
    {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    

}
