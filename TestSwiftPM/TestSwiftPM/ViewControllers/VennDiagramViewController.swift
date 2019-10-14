//
//  VennDiagramViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMVennDiagramView

class VennDiagramViewController: UIViewController {

    @IBOutlet weak var vView: AMVennDiagramView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vView.setupVennDiagram(value1: 1000, value2: 900, commonValue: 100)
        vView.dataSource = self
    }
    
    private func randomColor(alpha: CGFloat) -> UIColor {
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}

extension VennDiagramViewController: AMVennDiagramViewDataSource {
    func vennDiagramView(_ vennDiagramView:AMVennDiagramView, fillColorForSection section: Int) -> UIColor {
        return randomColor(alpha: 0.5)
    }
    
    func vennDiagramView(_ vennDiagramView:AMVennDiagramView, strokeColorForSection section: Int) -> UIColor {
        return randomColor(alpha: 1.0)
    }
    
    func vennDiagramView(_ vennDiagramView:AMVennDiagramView, titleForSection section: Int, value: CGFloat) -> String {
        let title = section == 0 ? "A" : "B"
        return title + "\n" + String(format: "%.0f", value)
    }
    
    func titleForCommonArea(in vennDiagramView:AMVennDiagramView, value: CGFloat) -> String {
        return "Common\n" + String(format: "%.0f", value)
    }
    
    func vennDiagramView(_ vennDiagramView:AMVennDiagramView, textColorForSection section: Int) -> UIColor {
        return randomColor(alpha: 1.0)
    }
    
    func textColorForCommonArea(in vennDiagramView:AMVennDiagramView) -> UIColor {
        return randomColor(alpha: 1.0)
    }
    
    func vennDiagramView(_ vennDiagramView:AMVennDiagramView, textFontForSection section: Int) -> UIFont {
        return .systemFont(ofSize: 17)
    }
    
    func textFontForCommonArea(in vennDiagramView:AMVennDiagramView) -> UIFont {
        return .systemFont(ofSize: 17)
    }
}
