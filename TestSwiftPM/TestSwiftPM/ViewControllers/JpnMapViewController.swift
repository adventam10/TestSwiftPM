//
//  JpnMapViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMJpnMap

class JpnMapViewController: UIViewController {

    @IBOutlet weak var jView: AMJpnMapView!
    @IBOutlet weak var jdView: AMJpnMapDetailView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        jView.delegate = self
        jdView.strokeColor = .clear
        AMPrefecture.allCases.forEach {
            jdView.setFillColor(color: randomColor(alpha: 1.0), prefecture: $0)
        }
    }
    
    private func randomColor(alpha: CGFloat) -> UIColor {
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}

extension JpnMapViewController: AMJpnMapViewDelegate {
    func jpnMapView(_ jpnMapView: AMJpnMapView, didSelectAtRegion region: AMRegion) {
        jpnMapView.setFillColor(color: .red, region: region)
        jpnMapView.setStrokeColor(color: .red, region: region)
    }
    
    func jpnMapView(_ jpnMapView: AMJpnMapView, didDeselectAtRegion region: AMRegion) {
        jpnMapView.setFillColor(color: .green, region: region)
        jpnMapView.setStrokeColor(color: .green, region: region)
    }
}

