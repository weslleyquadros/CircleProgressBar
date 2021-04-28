//
//  CircleProgressBarView.swift
//  CircleProgressBarView
//
//  Created by Weslley Tavares de Aguiar e Quadros on 07/03/21.
//

import UIKit

class CircleProgressBarView: UIView {
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var percenteLabel: UILabel!
    var progress = CAShapeLayer()
 
    func setupProgress() {
        let center = progressBarView.center
        progress.strokeEnd = 0
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 38, startAngle: -CGFloat.pi / 2, endAngle: 3 * CGFloat.pi / 2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.init(red: 243/255, green: 244/255, blue: 245/255, alpha: 1).cgColor
        trackLayer.lineWidth = 6
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
   
        progressBarView.layer.addSublayer(trackLayer)
        
        progress.path = circularPath.cgPath
        
        progress.strokeColor = UIColor.init(red: 176/255, green: 198/255, blue: 65/255, alpha: 1).cgColor
        progress.lineWidth = 6
        progress.fillColor = UIColor.clear.cgColor
        progress.lineCap = .round
        
        progressBarView.layer.addSublayer(progress)
    }
    
    func animationProgress(percente: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = percente
        basicAnimation.duration = 0.5
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        progress.add(basicAnimation, forKey: "urSoBasic")
        
        // Value static
//        percenteLabel.text = "\(Int(percente * 100))%"
        
        // Incremented value
        incrementLabel(to: (Int(percente * 100)))
    }

    func incrementLabel(to endValue: Int) {
        let duration: Double = 0.4
        DispatchQueue.global().async {
            for percent in 0 ..< (endValue + 1) {
                let sleepTime = UInt32(duration/Double(endValue) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    self.percenteLabel.text = "\(percent)%"
                }
            }
        }
    }
}
