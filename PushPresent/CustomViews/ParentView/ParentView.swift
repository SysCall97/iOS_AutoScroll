//
//  ParentView.swift
//  PushPresent
//
//  Created by Kazi Mashry on 1/12/23.
//

import UIKit

final class ParentView: UIView {
    
    private weak var currentView: ChildView? {
        didSet {
            if let currentView {
                self.addSubview(currentView)
                if shouldAnimate {
                    if self.moveRightToLeft {
                        currentView.enter()
                    } else {
                        currentView.getNextView()?.exit()
                    }
                }
                shouldAnimate = true
            }
        }
    }
    
    private var shouldAnimate: Bool = false
    private var moveRightToLeft: Bool = true
    private var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    private func configure() {
        guard let view = self.loadViewFrom(nib: "ParentView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        self.setupChildViews()
    }
    
    private func setupChildViews() {
        let childView1 = ChildView(frame: self.bounds)
        let childView2 = ChildView(frame: self.bounds)
        let childView3 = ChildView(frame: self.bounds)
        
        childView1.setValues(for: "THIS IS - 1", color: UIColor(red: 0.77, green: 1.00, blue: 0.97, alpha: 1.00), imageName: "image-1", nextView: childView2, prevView: childView3)
        childView2.setValues(for: "THIS IS - 2", color: UIColor(red: 0.59, green: 0.94, blue: 1.00, alpha: 1.00), imageName: "image-2", nextView: childView3, prevView: childView1)
        childView3.setValues(for: "THIS IS - 3", color: UIColor(red: 0.37, green: 0.74, blue: 1.00, alpha: 1.00), imageName: "image-3", nextView: childView1, prevView: childView2)
        
        currentView = childView1
        self.addSubview(childView1)
        self.startTimer()
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.moveToNextCell()
        }
    }
    
    func moveToNextCell() {
        self.timer?.invalidate()
        self.moveRightToLeft = true
        self.currentView = self.currentView?.getNextView()!
        self.startTimer()
    }
    
    func moveToPrevCell() {
        self.timer?.invalidate()
        self.moveRightToLeft = false
        self.currentView = self.currentView?.getPrevView()!
        self.startTimer()
    }
    
}
