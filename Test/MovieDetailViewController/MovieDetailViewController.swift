//
//  MovieDetailViewController.swift
//  Test
//
//  Created by Muhammad Zahid Imran on 4/22/19.
//  Copyright © 2019 24. All rights reserved.
//

import Foundation
import UIKit
import Observable
import XCDYouTubeKit
import AVKit

extension Notification.Name {
     static let peru = Notification.Name("peru")
     static let argentina = Notification.Name("argentina")
}

class MovieDetailViewController: UIViewController {
    
    var movieID:Int!
    var disposal:Disposal = Disposal()
    let model = MovieDetailVM()
    weak var playerViewController:AVPlayerViewController?
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var watchTrailerButton: UIButton!
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        addObserver()
        loadData()
    }
    
    func loadData() -> Void {
        model.load(movieID: movieID)
    }
    
    func updateUI() -> Void {
        let bounds = UIScreen.main.bounds
        let bannerConstraint = self.bannerImageView.widthAnchor.constraint(equalToConstant: min(bounds.width,bounds.height))
        bannerConstraint.priority = UILayoutPriority(rawValue: 900)
        bannerConstraint.isActive = true
        updateOrientation()
    }
    
    func updateOrientation() -> Void {
        if UIDevice.current.orientation.isLandscape {
            self.headerStackView.axis = .horizontal
        } else {
            self.headerStackView.axis = .vertical
        }
    }
    
    func populateData() -> Void {
        self.titleLabel.text = model.title
        if let bannerURL = model.bannerURl
        {
            self.bannerImageView.af_setImage(withURL: bannerURL, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
        self.overviewLabel.text = model.overview
        self.releaseDateLabel.text = self.model.releaseDate
        self.genreLabel.text = self.model.genre
    }
    
    
    func addObserver() -> Void {
        model.movie.observe {[weak self] (value, _ ) in
            guard let _ = value else {
                self?.scrollView.isHidden = true
                return
            }
            self?.populateData()
            self?.scrollView.isHidden = false
            }.add(to: &disposal)
        
        model.currentRequest.observe {[weak self] (value, nil) in
            if let _ = value {
                self?.view.showLinearHud(Double(self?.view.layoutMargins.top ?? 0))
            }
            else {
                self?.view.hideLinearHud()
            }
            }.add(to: &disposal)
        
        model.videos.observe {[weak self] (value, nil) in
            let youtubeVideos = value.filter { $0.site == "YouTube" }
            if youtubeVideos.count > 0 {
                self?.proceedVideo(video: youtubeVideos.first!)
            }
            else {
                self?.playerViewController?.dismiss(animated: true, completion: nil)
            }
            }.add(to: &disposal)
        
        model.error.observe {[weak self] (value, nil) in
            self?.showError(error: value)
            }.add(to: &disposal)
        
        model.errorVideos.observe {[weak self] (value, nil) in
            if let error = value {
                self?.showVideoError(error: error)
            }
            }.add(to: &disposal)
    }
    
    func showError(error: Error?) -> Void {
        if let err = error {
            self.errorLabel.text = err.localizedDescription
            self.view.bringSubviewToFront(self.errorView)
            self.errorView.isHidden = false
        }
        else {
            self.errorLabel.text = ""
            self.view.sendSubviewToBack(self.errorView)
            self.errorView.isHidden = true
        }
    }
    
    func showVideoError(error:Error) -> Void {
        self.playerViewController?.dismiss(animated: true, completion: {[weak self] in
            let alertController = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak alertController] (action) in
                alertController?.dismiss(animated: true, completion: nil)
            }))
            
            self?.present(alertController, animated: true, completion: nil)
        })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.updateOrientation()
        }) { (context) in
            
        }
    }
    
    func proceedVideo(video: VideoModelProtocol) -> Void {
        XCDYouTubeClient.default().getVideoWithIdentifier(video.key, completionHandler: {[weak self] video, error in
            if video != nil {
                let streamURLs = video?.streamURLs
                let streamURL = streamURLs?[XCDYouTubeVideoQuality.HD720.rawValue] ?? streamURLs?[XCDYouTubeVideoQuality.medium360.rawValue] ?? streamURLs?[XCDYouTubeVideoQuality.small240.rawValue]
                
                if let streamURL = streamURL {
                    let player = AVPlayer(url: streamURL)
                    self?.playerViewController?.player = player
                    if #available(iOS 11.0, *) {
                        self?.playerViewController?.exitsFullScreenWhenPlaybackEnds = true
                    } else {
                        if let detailVC = self {
                            NotificationCenter.default.addObserver(detailVC, selector: #selector(MovieDetailViewController.playbackFinished),
                                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
                        }
                    }
                }
                self?.playerViewController?.player?.play()
            } else {
                self?.playerViewController?.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    @objc func playbackFinished() -> Void {
        self.playerViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func watchTrailerAction(_ sender: Any) {
        let playerViewController = AVPlayerViewController()
        present(playerViewController, animated: true)
        self.playerViewController = playerViewController
        if model.videos.value.count == 0 {
            model.loadVideos(movieID: movieID)
        }
        else
        {
            proceedVideo(video: model.videos.value.first!)
        }
    }
    
    @IBAction func retryAction(_ sender: Any) {
        loadData()
    }
}
