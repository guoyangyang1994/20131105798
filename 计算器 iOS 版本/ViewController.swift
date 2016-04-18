//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    
    var 计算器:计算 = 计算()
    var 显示缓存:String = ""
    var 缓存 = 0.0
    var 缓存2:Double?
    
     @IBOutlet weak var 屏幕:UITextField!
    
    @IBAction func 数字0(sender: AnyObject) {
        点按("0")
    }
    @IBAction func 数字1(sender: AnyObject) {
        点按("1")
    }
    @IBAction func 数字2(sender: AnyObject) {
        点按("2")
    }
    @IBAction func 数字3(sender: AnyObject) {
        点按("3")
    }
    @IBAction func 数字4(sender: AnyObject) {
        点按("4")
    }
    @IBAction func 数字5(sender: AnyObject) {
        点按("5")
    }
    @IBAction func 数字6(sender: AnyObject) {
        点按("6")
    }
    @IBAction func 数字7(sender: AnyObject) {
        点按("7")
    }
    @IBAction func 数字8(sender: AnyObject) {
        点按("8")
    }
    @IBAction func 数字9(sender: AnyObject) {
        点按("9")
    }
    @IBAction func 数字点(sender: AnyObject) {
        点按(".")
    }
    @IBAction func 算法加(sender: AnyObject) {
        计算器.设置当前算法(.加法)
        求值()
    }
    @IBAction func 算法减(sender: AnyObject) {
        计算器.设置当前算法(.减法)
        求值()
    }
    @IBAction func 算法乘(sender: AnyObject) {
        计算器.设置当前算法(.乘法)
        求值()
    }
    @IBAction func 算法除(sender: AnyObject) {
        计算器.设置当前算法(.除法)
        求值()
    }
  
    @IBAction func 平方(sender: AnyObject) {
        计算器.设置当前算法(.平方)
        求值()
    }
    @IBAction func 指数幂(sender: AnyObject) {
        计算器.设置当前算法(.指数幂)
        求值()

    }
    @IBAction func 重置当前(sender: AnyObject) {
        显示缓存 = ""
        self.屏幕.text = "当前输入已撤销👉 0.0"
    }
    @IBAction func 重置所有(sender: AnyObject) {
        显示缓存 = ""
        缓存 = 0.0
        缓存2 = nil
        计算器.设置当前算法(.未选择)
        self.屏幕.text = ""

        
    }
        @IBAction func 结果(sender: AnyObject) {
        求值()
    }
    func 点按(数字:String) {
        显示缓存 += 数字
        self.屏幕.text = 显示缓存
    }
    func 求值() {
        
        if !显示缓存.isEmpty {
            let 临时 = 显示缓存 as NSString
            缓存 = 临时.doubleValue
            显示缓存 = ""
        }
        let 临时 = 缓存
        var 结果 = ""
        
        if let 前一个数字 = 缓存2 {
            结果 = 计算器.求结果(前一个数字, 被操作数: 临时)
            
            self.屏幕.text = 结果
            let 临 = 结果 as NSString
            缓存2 = 临.doubleValue
        } else {
            缓存2 = 缓存
            缓存 = 0.0
        }
        
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        屏幕.editing
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

