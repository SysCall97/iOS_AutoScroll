//
//  ViewController.swift
//  PushPresent
//
//  Created by Kazi Mashry on 1/12/23.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var parentView: ParentView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        self.parentView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        self.parentView.moveToPrevCell()
    }


}

