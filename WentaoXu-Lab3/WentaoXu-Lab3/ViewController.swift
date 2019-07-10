//
//  ViewController.swift
//  WentaoXu-Lab3
//
//  Created by labuser on 9/30/18.
//  Copyright © 2018 WentaoXu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var drawpath: PathView?
    static var Color: UIColor!
    var pathArray:[PathView]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.Color = UIColor.black
        // Do any additional setup after loading the view, typically from a nib.
    }
    var CustomC: ColorViewController!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

  
   
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func WidthSlider(_ sender: Any) {
      //  var width =  slider.value
    }
    @IBAction func colorRed(_ sender: Any) {
        ViewController.Color=UIColor.red
    }
   
    @IBAction func colorYellow(_ sender: Any) {
        ViewController.Color=UIColor.yellow
    }
    
    @IBAction func colorGreen(_ sender: Any) {
        ViewController.Color=UIColor.green
    }
    
    @IBAction func colorBlue(_ sender: Any) {
        ViewController.Color=UIColor.blue
    }
    @IBAction func colorPurple(_ sender: Any) {
        ViewController.Color=UIColor.purple
    }
    @IBAction func colorOrange(_ sender: Any) {
        ViewController.Color=UIColor.orange
    }
    
    @IBAction func colorWhite(_ sender: Any) {
        ViewController.Color=UIColor.white
    }
    func getdrawing(touchpoint:CGPoint){
        drawpath?.currentPath?.centerPoint.append(touchpoint)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        
        let myframe = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-50)
        
        drawpath=PathView(frame:myframe)
        drawpath?.currentPath=Path(centerPoint:[touchPoint], width:CGFloat(slider.value*15),color: ViewController.Color)
        view.addSubview(drawpath!)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        if(drawpath==nil){
            return
        }
     //   let myframe = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-50)
      //  UIGraphicsBeginImageContext(self.view.frame.size)
      //  drawing.image?.draw(in: myframe)
        getdrawing(touchpoint: touchPoint)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
       
        if(drawpath==nil){
            return
        }
        getdrawing(touchpoint: touchPoint)
        pathArray.append(drawpath!)
        drawpath=nil
        
    }
    @IBAction func undoButton(_ sender: Any) {
        if (pathArray.count<=0){
            return
        }
        drawpath=pathArray.removeLast()  // remover the last element in the array
       drawpath?.removeFromSuperview()
    }
    @IBAction func clear(_ sender: Any) {
        if(pathArray.count<=0){
            return
        }
        for i in pathArray{
            i.removeFromSuperview() // remove everything path in the array
        }
    }
    
}
