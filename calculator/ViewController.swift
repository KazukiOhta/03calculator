//
//  ViewController.swift
//  calculator
//
//  Created by 太田 一毅 on 2019/03/14.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
        common()
    }

    var sum:Int!
    var sumope:String!
    var pro:Int!
    var proope:String!
    var tmpnum:Int!
    var eq:Bool!

    func initialize(){
        sum = 0
        sumope = ""
        pro = 0
        proope = ""
        tmpnum = 0
        eq = false
    }
    
    @IBOutlet var lbl:UILabel!
    
    @IBAction func numbtn0(){numbtn(num:0)}
    @IBAction func numbtn1(){numbtn(num:1)}
    @IBAction func numbtn2(){numbtn(num:2)}
    @IBAction func numbtn3(){numbtn(num:3)}
    @IBAction func numbtn4(){numbtn(num:4)}
    @IBAction func numbtn5(){numbtn(num:5)}
    @IBAction func numbtn6(){numbtn(num:6)}
    @IBAction func numbtn7(){numbtn(num:7)}
    @IBAction func numbtn8(){numbtn(num:8)}
    @IBAction func numbtn9(){numbtn(num:9)}
    
    @IBAction func plusbtn(){
        if(proope != ""){
            procalc()
        }
        if(sumope != ""){
            sumcalc()
        }
        common()
        sumope = "+"
    }
    
    @IBAction func minusbtn(){
        if(proope != ""){
            procalc()
        }
        if(sumope != ""){
            sumcalc()
        }
        common()
        sumope = "-"
    }
    @IBAction func productbtn(){
        if(proope != ""){
            procalc()
        }
        common()
        proope = "*"
    }
    @IBAction func dividebtn(){
        if(proope != ""){
            procalc()
        }
        common()
        proope = "/"
    }
    @IBAction func clearbtn(){
        initialize()
        common()
    }
    
    @IBAction func equalbtn(){
        if(proope != ""){
            procalc()
        }
        if(sumope != ""){
            sumcalc()
        }
        common()
        eq = true
    }
    
    func sumcalc(){
        if(sumope == ""){
            print("Uh Oh...(sum)")
        } else if (sumope == "+"){
            sum += pro
        } else if (sumope == "-"){
            sum -= pro
        }
        sumope = ""
        pro = 0
    }
    
    func procalc(){
        if(proope == ""){
            print("Uh Oh...(pro)")
        } else if (proope == "*"){
            pro *= tmpnum
        } else if (proope == "/"){
            if (tmpnum == 0){
                ZeroDivisionError()
            } else {
                pro /= tmpnum
            }
        }
        proope = ""
        tmpnum = 0
    }
    
    func numbtn(num:Int){
        if(eq){
            initialize()
        }
        if(proope==""){
            pro *= 10
            pro += num
        } else {
            tmpnum *= 10
            tmpnum += num
        }
        common()
    }
    
    func common(){
        eq = false
        print(sum, pro, tmpnum)
        if(proope==""){
            lbl.text = String(pro)
        } else {
            lbl.text = String(tmpnum)
        }
    }
    
    func ZeroDivisionError(){
        lbl.text = "Zero Division Error"
    }
    
}

