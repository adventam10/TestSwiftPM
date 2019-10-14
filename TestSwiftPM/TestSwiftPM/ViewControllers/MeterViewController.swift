//
//  MeterViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMMeterView

class MeterViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mView: AMMeterView!
    private let meterList = ["りんご", "バナナ", "メロン"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mView.delegate = self
        mView.dataSource = self
    }
}

extension MeterViewController: AMMeterViewDelegate {
    func meterView(_ meterView: AMMeterView, didSelectAtIndex index: Int) {
        label.text = meterList[index]
    }
}

extension MeterViewController: AMMeterViewDataSource {
    func numberOfValue(in meterView: AMMeterView) -> Int {
        return meterList.count
    }
    
    func meterView(_ meterView: AMMeterView, titleForValueAtIndex index: Int) -> String {
        return meterList[index]
    }
    
    func meterView(_ meterView: AMMeterView, textFontForValueAtIndex index: Int) -> UIFont {
        return .systemFont(ofSize: 13)
    }
    
    func meterView(_ meterView: AMMeterView, textColorForValueAtIndex index: Int) -> UIColor {
        return .red
    }
}
