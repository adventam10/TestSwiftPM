//
//  ClockViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMClockView

class ClockViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cView: AMClockView!
    private let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        cView.delegate = self
    }
}

extension ClockViewController: AMClockViewDelegate {
    func clockView(_ clockView: AMClockView, didChangeDate date: Date) {
        label.text = dateFormatter.string(from: date)
    }
}
