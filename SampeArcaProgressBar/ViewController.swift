//
//  ViewController.swift
//  SampeArcaProgressBar
//
//  Created by Anton Umnitsyn on 5/28/19.
//  Copyright © 2019 Anton Umnitsyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var progressBars: ArcaProgressView!
    private var run: Bool = false
    private var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBars = ArcaProgressView(frame: CGRect(x: 0, y: 0, width: 330, height: 330))
        progressBars.labelSize = 120.0
        progressBars.center = self.view.center
        self.view.addSubview(progressBars)
        
        let button = UIButton(type: .system)
        button.setTitle("Run", for: .normal)
        button.addTarget(self, action: #selector(runProgress), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.green
        button.frame = CGRect(x: 10, y: self.view.frame.height - 50, width: self.view.frame.width - 20, height: 40)
        self.view.addSubview(button)
        
        let slider = UISlider(frame: CGRect(x: 10, y: self.view.frame.height - 100, width: self.view.frame.width - 20, height: 30))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(sliderSlide(sender:)), for: .valueChanged)
        self.view.addSubview(slider)
        
    }

    @objc func sliderSlide(sender: UISlider) {
        progressBars.setProgressOne(to: Double(sender.value/100), withAnimation: false, maxSpeed: 45.0)
        progressBars.setProgressTwo(to: Double(sender.value/100), withAnimation: false)
        progressBars.setProgressThree(to: Double(sender.value/100), withAnimation: false)
    }
    
    @objc func runProgress() {
        if run {
            timer.invalidate()
        }
        else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] (timer) in
                self?.progressBars.setProgressOne(to: Double.random(in: 0 ... 1), withAnimation: false, maxSpeed: 45.0)
                self?.progressBars.setProgressTwo(to: Double.random(in: 0 ... 1), withAnimation: false)
                self?.progressBars.setProgressThree(to: Double.random(in: 0 ... 1), withAnimation: false)
            }
        }
        run = !run
    }
}



