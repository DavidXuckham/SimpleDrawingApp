//
//  PathView.swift
//  WentaoXu-Lab3
//
//  Created by labuser on 9/30/18.
//  Copyright © 2018 WentaoXu. All rights reserved.
//

import UIKit

class PathView: UIView {
    var currentPath:Path?{
        didSet{
            setNeedsDisplay()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor=UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("(init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   // var PathArr:[Path]=[]{
   //     didSet{
    //        setNeedsDisplay()
    //    }
  //  }
    override func draw(_ rect: CGRect) {
        if(currentPath==nil){
            return
        }
        let path = createQuadPath(points: (currentPath?.centerPoint)!)
        path.lineWidth = (currentPath?.width)!
        currentPath?.color.setStroke()
        path.stroke()
    // draw two ends circle to smooth out the line
        let startdot = drawArc(point: (currentPath?.centerPoint[0])!, radius: (currentPath?.width)!/2)
        let enddot = drawArc(point: (currentPath?.centerPoint[(currentPath?.centerPoint.count)!-1])!, radius: (currentPath?.width)!/2)
       currentPath?.color.setFill()
        startdot.fill()
        enddot.fill()
   
    }
 
     func drawArc(point:CGPoint, radius:CGFloat)->UIBezierPath{
        let path = UIBezierPath()
     path.addArc(withCenter: point, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
       return path
   }
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        return CGPoint(x:(first.x)/2+(second.x)/2, y:(first.y)/2+(second.y)/2)
    }
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }
   
    
}
