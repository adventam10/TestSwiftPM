//
//  SpeedMeterViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMSpeedMeter

class SpeedMeterViewController: UIViewController {

    @IBOutlet weak var sView: AMSpeedMeterView!
    private var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self,
                                     selector: #selector(self.timerAction(teimer:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    /// Timer Action
    @objc func timerAction(teimer:Timer) {
        /// set CGFloat value
        sView.currentValue = CGFloat.random(in: 0...100)
    }
}
