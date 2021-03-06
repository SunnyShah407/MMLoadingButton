//
//  ViewController.swift
//  MMLoadingButton
//
//  Created by Millman on 09/04/2016.
//  Copyright (c) 2016 Millman. All rights reserved.
//

import UIKit
import MMLoadingButton

class ViewController: UIViewController{
    @IBOutlet weak var txtAccount:UITextField!
    @IBOutlet weak var txtPwd:UITextField!
    @IBOutlet weak var loadingBtn:MMLoadingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loadAction () {
        loadingBtn.startLoading()

        if let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second") as? SecondViewController {
            self.loadingBtn.addScuessPresentVC(vc)
        }
        self.fakeResult()
    }
    
    func fakeResult() {
        
        let delayTime = DispatchTime.now() + .seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            if !self.txtAccount.text!.isEmpty && !self.txtPwd.text!.isEmpty {
                self.loadingBtn.stopLoading(true, completed: {
                    print("Scuess Completed")
                })
            } else if self.txtAccount.text!.isEmpty {
                self.loadingBtn.stopWithError("Account is Empty!!", hideInternal: 2, completed: {
                    print ("Fail Message Completed")
                })
                
            } else{
                self.loadingBtn.stopWithError("Password is Empty!!", hideInternal: 2, completed: {
                    print ("Fail Message Completed")
                })
                
            }

        }
    }
}

