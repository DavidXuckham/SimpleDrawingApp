//
//  ColorViewController.swift
//  WentaoXu-Lab3
//
//  Created by labuser on 10/3/18.
//  Copyright © 2018 WentaoXu. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

   static var red: CGFloat=0;
   static var green: CGFloat=0;
   static var blue : CGFloat=0;
    @IBOutlet weak var ColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   let color:UIColor!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var rlabel: UILabel!
    @IBOutlet weak var glabel: UILabel!
    @IBOutlet weak var blabel: UILabel!
    @IBOutlet weak var Rslider: UISlider!
    
    @IBAction func RedSlider(_ sender: Any) {
        ColorViewController.red = CGFloat(Rslider.value)
        rlabel.text = " Red:\(Int(ColorViewController.red*255))"
        ColorView.backgroundColor = UIColor(red: ColorViewController.red, green: ColorViewController.green, blue: ColorViewController.blue, alpha:1)
        passTheValues()
    }
    
    @IBOutlet weak var GSlider: UISlider!
    
    @IBAction func GreenSlider(_ sender: Any) {
        ColorViewController.green = CGFloat(GSlider.value)
        glabel.text = "Green: \(Int(ColorViewController.green*255))"
        ColorView.backgroundColor = UIColor(red: ColorViewController.red, green: ColorViewController.green, blue: ColorViewController.blue, alpha:1)
        passTheValues()
    }
    @IBOutlet weak var BSlider: UISlider!
    
    @IBAction func BlueSlider(_ sender: Any) {
        ColorViewController.blue = CGFloat(BSlider.value)
        blabel.text = "Blue: \(Int(ColorViewController.blue*255))"
        ColorView.backgroundColor = UIColor(red: ColorViewController.red, green: ColorViewController.green, blue: ColorViewController.blue, alpha:1)
        passTheValues()
    }
    
    
    func passTheValues(){
        ViewController.Color = UIColor(red: ColorViewController.red, green: ColorViewController.green, blue: ColorViewController.blue, alpha: 1.0)
        
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
 //   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
 //   }
  //  */

}
