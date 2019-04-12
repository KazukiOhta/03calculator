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
        show()
    }

    var sum:Int!
    var sumope:String! //"+" or "-"
    var pro:Int!
    var proope:String! //"" or "*" or "/"
    var tmpnum:Int!
    var shownum:Int!
    var prevbtn:String! //"num" or "+-" or "*/" or "="

    func initialize(){
        sum = 0
        sumope = "+"
        pro = 1
        proope = ""
        tmpnum = 0
        shownum = 0
        prevbtn = "="
    }
    
    func show(){
        print(sum, sumope, pro, proope, tmpnum)
        lbl.text = String(shownum)
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
    @IBAction func plusbtn(){plusminusbtn(ope: "+")}
    @IBAction func minusbtn(){plusminusbtn(ope: "-")}
    @IBAction func productbtn(){productdividebtn(ope: "*")}
    @IBAction func dividebtn(){productdividebtn(ope: "/")}

    func plusminusbtn(ope:String){
        if prevbtn == "num"{
            tmpnum = shownum
            strongCalc()
            sumope = ope
            proope = ""
        }
        if prevbtn == "+-" || prevbtn == "*/"{
            sumope = ope
            proope = ""
        }
        if prevbtn == "="{
            tmpnum = shownum
            sumope = ope
            proope = ""
        }
        prevbtn = "+-"
        show()
    }
    
    func productdividebtn(ope:String){
        if prevbtn == "num"{
            tmpnum = shownum
            weakCalc()
            proope = ope
        }
        if prevbtn == "+-" || prevbtn == "*/"{
            proope = ope
        }
        if prevbtn == "="{
            tmpnum = shownum
            proope = ope
        }
        prevbtn = "*/"
        show()
    }
    

    
    @IBAction func clearbtn(){
        initialize()
        show()
    }
    
    @IBAction func equalbtn(){
        if prevbtn == "num"{
            tmpnum = shownum
            strongCalc()
        }
        if prevbtn == "+-" || prevbtn == "*/"{
            //!!未実装
        }
        if prevbtn == "="{
            //pass
        }
        show()
        prevbtn = "="
    }
    
    func weakCalc(){
        if proope == "*"{
            pro *= tmpnum
        }
        if proope == "/"{
            if tmpnum == 0{
                ZeroDivisionError()
                return
            }
            pro /= tmpnum
        }
        if proope == ""{
            pro = tmpnum
        }
        if proope == "*" || proope == "/"{
            tmpnum = 0
            shownum = pro
        }
    }
    
    func strongCalc(){
        if proope == "*"{
            pro *= tmpnum
            tmpnum = pro
        }
        if proope == "/"{
            if tmpnum == 0{
                ZeroDivisionError()
                return
            }
            pro /= tmpnum
            tmpnum = pro
        }
        if sumope == "+" {
            sum += tmpnum
        }
        if sumope == "-" {
            sum -= tmpnum
        }
        tmpnum = 0
        shownum = sum
    }
    
    func numbtn(num:Int){
        if prevbtn == "num"{
            shownum *= 10
            shownum += num
        }
        if prevbtn == "+-" || prevbtn == "*/"{
            shownum = num
        }
        if prevbtn == "="{
            initialize()
            shownum = num
        }
        show()
        prevbtn = "num"
    }
    

    
    func ZeroDivisionError(){
        initialize()
        lbl.text = "Zero Division Error"
    }
    
}

