//
//  ViewController.swift
/*
计算器:Calculator
显示缓存:Displaycache
缓存:cache
求值:evaluation
点计数:Pointcount
点按:click
数字:number
前一个数字:Lastnumber
临时:temporary
结果:result
屏幕：screen
小数点：point
算法加：algorithmjia
算法减：algorithmjian
算法乘：algorithmcheng
算法除：algorithmchu
算法平方：algorithmpingfang
算法指数幂：algorithmzhishumi
重置所有：Resetall
重置当前：Resetnow
等号：equalsign
运算结果：yunsuanresult
*/


import UIKit

class ViewController: UIViewController {
                           
    
    var Calculator:calculation = calculation()
    var Displaycache:String = ""
    var cache = 0.0
    var cache2:Double?
    
     @IBOutlet weak var screen:UITextField!
    
    @IBAction func number0(sender: AnyObject) {
        click("0")
    }
    @IBAction func number1(sender: AnyObject) {
        click("1")
    }
    @IBAction func number2(sender: AnyObject) {
        click("2")
    }
    @IBAction func number3(sender: AnyObject) {
       click("3")
    }
    @IBAction func number4(sender: AnyObject) {
        click("4")
    }
    @IBAction func number5(sender: AnyObject) {
        click("5")
    }
    @IBAction func number6(sender: AnyObject) {
        click("6")
    }
    @IBAction func number7(sender: AnyObject) {
        click("7")
    }
    @IBAction func number8(sender: AnyObject) {
        click("8")
    }
    @IBAction func number9(sender: AnyObject) {
        click("9")
    }
    @IBAction func npoint(sender: AnyObject) {
        click(".")
    }
    @IBAction func algorithmjia(sender: AnyObject) {
        Calculator.Setcurrentalgorithm(.addition)
        evaluation()
    }
    @IBAction func algorithmjian(sender: AnyObject) {
        Calculator.Setcurrentalgorithm(.subtraction)
        evaluation()
    }
    @IBAction func algorithmcheng(sender: AnyObject) {
        Calculator.Setcurrentalgorithm(.multiplication)
        evaluation()
    }
    @IBAction func algorithmchu(sender: AnyObject) {
        Calculator.Setcurrentalgorithm(.division)
        evaluation()
    }
  
    @IBAction func pingfang(sender: AnyObject) {
        Calculator.Setcurrentalgorithm(.pingfang)
        evaluation()
    }
    @IBAction func zhishumi(sender: AnyObject) {
       Calculator.Setcurrentalgorithm(.zhishumi)
        evaluation()

    }
    @IBAction func Resetnow(sender: AnyObject) {
        Displaycache = ""
        self.screen.text = "当前输入已撤销👉 0.0"
    }
    @IBAction func Resetall(sender: AnyObject) {
        Displaycache = ""
       cache = 0.0
        cache2 = nil
        Calculator.Setcurrentalgorithm(.Nochoice)
        self.screen.text = ""

        
    }
        @IBAction func result(sender: AnyObject) {
        evaluation()
    }
    func click(number:String) {
        Displaycache += number
        self.screen.text = Displaycache
    }
    func evaluation() {
        
        if !Displaycache.isEmpty {
            let temporary = Displaycache as NSString
            cache = temporary.doubleValue
            Displaycache = ""
        }
        let temporary = cache
        var result = ""
        
        if let Lastnumber = cache2 {
            result = Calculator.Resultseeking(Lastnumber,Operandoperand:temporary)
            
            self.screen.text = result
            let temporary = result as NSString
            cache2 = temporary.doubleValue
        } else {
            cache2 = cache
            cache = 0.0
        }
        
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.editing
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

