//
//  ChartViewController.swift
//  TestPod
//
//  Created by am10 on 2019/04/21.
//  Copyright © 2019 am10. All rights reserved.
//

import UIKit
import AMChart

class ChartViewController: UIViewController {
    
    @IBOutlet weak var radarChartView: AMRadarChartView!
    @IBOutlet weak var barChartView: AMBarChartView!
    @IBOutlet weak var pieChartView: AMPieChartView!
    @IBOutlet weak var scatterChartView: AMScatterChartView!
    @IBOutlet weak var lineChartView: AMLineChartView!
    
    var radarDataList = [[CGFloat]]()
    var barDataList = [[CGFloat]]()
    var pieDataList = [CGFloat]()
    var scatterDataList = [[AMSCScatterValue]]()
    var lineDataList = [[CGFloat]]()
    var radarRowNum:Int = 0
    let radarAxisNum:CGFloat = 6
    var barColors = [UIColor]()
    var lineRowNum:Int = 0;
    
    let titles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let linePointTypes:[AMLCPointType] = [.type1, .type2, .type3, .type4, .type5, .type6, .type7, .type8, .type9]
    
    let scatterPointTypes:[AMSCPointType] = [.type1, .type2, .type3, .type4, .type5, .type6, .type7, .type8, .type9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        prepareDataList()
        radarChartView.dataSource = self
        barChartView.dataSource = self
        pieChartView.dataSource = self
        scatterChartView.dataSource = self
        lineChartView.dataSource = self
    }
    
    private func randomColor(alpha: CGFloat) -> UIColor {
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    @IBAction private func tappedReloadButton(_ sender: Any) {
        prepareDataList()
        radarChartView.reloadData()
        lineChartView.reloadData()
        pieChartView.reloadData()
        barChartView.reloadData()
        scatterChartView.reloadData()
    }
    
    @IBAction private func tappedRedrawButton(_ sender: Any) {
        radarChartView.redrawChart()
        lineChartView.redrawChart()
        pieChartView.redrawChart()
        barChartView.reloadData()
        scatterChartView.reloadData()
    }
    
    private func prepareDataList () {
        radarRowNum = Int.random(in: 3...24)
        let radarSectionNum = Int.random(in: 1...6)
        radarDataList.removeAll()
        for _ in 0..<radarSectionNum {
            var values = [CGFloat]()
            for _ in 0..<radarRowNum {
                let value = CGFloat.random(in: 0..<radarAxisNum)
                values.append(value)
            }
            radarDataList.append(values)
        }
        
        let lineSectionNum = Int.random(in: 1...10)
        lineRowNum = Int.random(in: 1...15)
        lineDataList.removeAll()
        for _ in 0..<lineSectionNum {
            var values = [CGFloat]()
            for _ in 0..<lineRowNum {
                let value = CGFloat.random(in: 0..<800)
                values.append(value)
            }
            lineDataList.append(values)
        }
        
        let pieSectionNum = Int.random(in: 1...10)
        pieDataList.removeAll()
        for _ in 0..<pieSectionNum {
            let value = CGFloat.random(in: 0..<800)
            pieDataList.append(value)
        }
        
        let barSectionNum = Int.random(in: 1...10)
        let barRownNum = Int.random(in: 1...5)
        barDataList.removeAll()
        barColors.removeAll()
        for (i) in 0..<barSectionNum {
            var values = [CGFloat]()
            for _ in 0..<barRownNum {
                if i == 0 {
                    barColors.append(randomColor(alpha: 1.0))
                }
                let value = CGFloat.random(in: 0..<200)
                values.append(value)
            }
            barDataList.append(values)
        }
        
        let scatterSectionNum = Int.random(in: 1...10)
        scatterDataList.removeAll()
        for _ in 0..<scatterSectionNum {
            var values = [AMSCScatterValue]()
            let scatterRownNum = Int.random(in: 1...100)
            for _ in 0..<scatterRownNum {
                let valueX = CGFloat.random(in: 0..<1000)
                let valueY = CGFloat.random(in: 0..<1000)
                values.append(AMSCScatterValue(x:valueX, y: valueY))
            }
            scatterDataList.append(values)
        }
    }
}

extension ChartViewController: AMRadarChartViewDataSource {
    func numberOfSections(in radarChartView:AMRadarChartView) -> Int {
        return radarDataList.count
    }
    
    func numberOfRows(in radarChartView:AMRadarChartView) -> Int {
        return radarRowNum
    }
    
    func radarChartView(_ radarChartView:AMRadarChartView, valueForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return radarDataList[indexPath.section][indexPath.row]
    }
    
    func radarChartView(_ radarChartView:AMRadarChartView, fillColorForSection section: Int) -> UIColor {
        return randomColor(alpha: 0.5)
    }
    
    func radarChartView(_ radarChartView:AMRadarChartView, strokeColorForSection section: Int) -> UIColor {
        return randomColor(alpha: 0.5)
    }
    
    func radarChartView(_ radarChartView: AMRadarChartView, titleForXlabelInRow row: Int) -> String {
        return titles[row]
    }
}

extension ChartViewController: AMScatterChartViewDataSource {
    func numberOfSections(in scatterChartView:AMScatterChartView) -> Int {
        return scatterDataList.count
    }
    
    func scatterChartView(_ scatterChartView:AMScatterChartView, numberOfRowsInSection section: Int) -> Int {
        return scatterDataList[section].count
    }
    
    func scatterChartView(_ scatterChartView:AMScatterChartView, valueForRowAtIndexPath indexPath: IndexPath) -> AMSCScatterValue {
        return scatterDataList[indexPath.section][indexPath.row]
    }
    
    func scatterChartView(_ scatterChartView:AMScatterChartView, colorForSection section: Int) -> UIColor {
        return randomColor(alpha: 1.0)
    }
    
    func scatterChartView(_ scatterChartView:AMScatterChartView, pointTypeForSection section: Int) -> AMSCPointType {
        return scatterPointTypes[Int(arc4random_uniform(9))]
    }
}

extension ChartViewController: AMPieChartViewDataSource {
    func numberOfSections(in pieChartView: AMPieChartView) -> Int {
        return pieDataList.count
    }
    
    func pieChartView(_ pieChartView:AMPieChartView, valueForSection section: Int) -> CGFloat {
        return pieDataList[section]
    }
    
    func pieChartView(_ pieChartView:AMPieChartView, colorForSection section: Int) -> UIColor {
        return randomColor(alpha: 1.0)
    }
}

extension ChartViewController: AMLineChartViewDataSource {
    func numberOfSections(in lineChartView:AMLineChartView) -> Int {
        return lineDataList.count
    }
    
    func numberOfRows(in lineChartView:AMLineChartView) -> Int {
        return lineRowNum
    }
    
    func lineChartView(_ lineChartView:AMLineChartView, valueForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return lineDataList[indexPath.section][indexPath.row]
    }
    
    func lineChartView(_ lineChartView:AMLineChartView, colorForSection section: Int) -> UIColor {
        return randomColor(alpha: 1.0)
    }
    
    func lineChartView(_ lineChartView:AMLineChartView, titleForXlabelInRow row: Int) -> String {
        return titles[row]
    }
    
    func lineChartView(_ lineChartView:AMLineChartView, pointTypeForSection section: Int) -> AMLCPointType {
        return linePointTypes[Int(arc4random_uniform(9))]
    }
}

extension ChartViewController: AMBarChartViewDataSource {
    func numberOfSections(in barChartView: AMBarChartView) -> Int {
        return barDataList.count
    }
    
    func barChartView(_ barChartView: AMBarChartView, numberOfRowsInSection section: Int) -> Int {
        return barDataList[section].count
    }
    
    func barChartView(_ barChartView: AMBarChartView, valueForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return barDataList[indexPath.section][indexPath.row]
    }
    
    func barChartView(_ barChartView: AMBarChartView, colorForRowAtIndexPath indexPath: IndexPath) -> UIColor {
        return barColors[indexPath.row]
    }
    
    func barChartView(_ barChartView: AMBarChartView, titleForXlabelInSection section: Int) -> String {
        return titles[section]
    }
}
