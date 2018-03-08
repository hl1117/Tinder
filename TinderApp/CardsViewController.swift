//
//  CardsViewController.swift
//  TinderApp
//
//  Created by Harika Lingareddy on 3/6/18.
//  Copyright © 2018 Harika Lingareddy. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    var transition: FadeTransition!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onImageTapGesture(_ sender: UITapGestureRecognizer) {
        let pic = sender.view as! DraggableImageView
        performSegue(withIdentifier: "profileDetailSegue", sender: pic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileDetailSegue" {
            let profileDetailController = segue.destination as! ProfileViewController
            let draggableImage = sender as! DraggableImageView
            profileDetailController.profileImage = draggableImage.profileImageView.image
            profileDetailController.modalPresentationStyle = .custom
            
            transition = FadeTransition()
            
            profileDetailController.transitioningDelegate = transition
            
            transition.duration = 1.0
        }
    }
    

}
