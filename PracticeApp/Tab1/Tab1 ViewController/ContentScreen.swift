//
//  ContentScreen.swift
//  PracticeApp
//
//  Created by Bobburu Dinesh on 28/09/21.
//

import UIKit
import AVFoundation
import AVKit

class ContentStoryboard: UIViewController {
    
    //var viewmodel=Tab1ViewModel()
    var player: AVPlayer?
   
    @IBOutlet weak var TrailerPlayer: UIView!
    
    
    @IBOutlet weak var DescriptionText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVideoPlayerWithVideo()
        

        // Do any additional setup after loading the view.
    }
    func initializeVideoPlayerWithVideo() {
        
        guard let var1 = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8") else {
            print("Not Found")
            return
        }
        print(var1)
        
           
            // get the path string for the video from assets
            let videoString:String? = Bundle.main.path(forResource: "Surfer1", ofType: "mp4")
            guard let unwrappedVideoPath = videoString else {return}
        print(unwrappedVideoPath)

            // convert the path string to a url
            let videoUrl = URL(fileURLWithPath: unwrappedVideoPath)
        print(videoUrl)
        

            // initialize the video player with the url
           self.player = AVPlayer(url:videoUrl )
            //self.player = AVPlayer(url: videoUrl)
        

            // create a video layer for the player
            let layer: AVPlayerLayer = AVPlayerLayer(player: player)
            
            // make the layer the same size as the container view
            layer.frame = TrailerPlayer.bounds
            
            // make the video fill the layer as much as possible while keeping its aspect size
            layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
     
            // add the layer to the container view
            TrailerPlayer.layer.addSublayer(layer)
        //self.view.layer.addSublayer(layer)
            player?.play()
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
