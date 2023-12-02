//
//  ChildView.swift
//  PushPresent
//
//  Created by Kazi Mashry on 1/12/23.
//

import UIKit

final class ChildView: UIView {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var uiImageView: UIImageView!
    private var nextView: ChildView?
    private var prevView: ChildView?
    private var title: String = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    func setValues(for text: String, color: UIColor, imageName: String, nextView: ChildView?, prevView: ChildView?) {
        self.title = text
        self.view.backgroundColor = color
        self.nextView = nextView
        self.prevView = prevView
        self.uiImageView.image = UIImage(named: imageName)!
    }
    
    func getNextView() -> ChildView? {
        return self.nextView
    }
    
    func getPrevView() -> ChildView? {
        return self.prevView
    }
    
    private func configure() {
        guard let view = self.loadViewFrom(nib: "ChildView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func enter() {
        let destinationX = self.center.x
        self.view.center.x = 3 * destinationX
        UIView.animate(withDuration: 0.5) {
            self.view.center.x = destinationX
            self.prevView?.view.center.x = -1 * self.center.x
        } completion: { _ in
            //self.prevView?.removeFromSuperview()
        }
    }
    
    func exit() {
        self.prevView?.view.center.x = -1 * self.center.x
        UIView.animate(withDuration: 0.5) {
            self.view.center.x = 3 * self.center.x
            self.prevView?.view.center.x = self.center.x
        } completion: { _ in
            //self.removeFromSuperview()
        }
    }
    
    @IBAction func btnPressed() {
        print("\(self.title)")
    }

}
