//
//  NowClockViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMNowClockView

class NowClockViewController: UIViewController {

    @IBOutlet weak var cView1: AMNowClockView!
    @IBOutlet weak var cView2: AMNowClockView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cView1.timeZone = TimeZone(identifier: "GMT")
    }
}
