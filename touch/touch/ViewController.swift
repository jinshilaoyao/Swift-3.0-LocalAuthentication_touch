//
//  ViewController.swift
//  touch
//
//  Created by yesway on 16/9/23.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let string = UIDevice.current.systemVersion as NSString
        
        if string.floatValue >= 8.0{
            
            let context = LAContext()
            
            if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "请验证指纹, 以打开高级隐藏功能", reply: { (success, error) in
                    
                        if success {
                            DispatchQueue.main.sync(execute: { 
                                print("成功")
                            })
                        } else {
                            DispatchQueue.main.sync(execute: {
                                print("失败")
                            })
                        }
                        
                        if (error != nil) {
                            print(error.debugDescription)
                        }
                })
            } else {
                print("对不起, 5S 以上机型才能使用此功能, 请卖肾后重拾")
            }
        } else {
            print("对不起, 系统版本过低")
        }
        
    }


}

