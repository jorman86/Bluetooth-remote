//
//  Record.swift
//  Bluetooth Remote
//
//  Created by jorge jesus mendoza balleza on 12/10/17.
//  Copyright © 2017 jorge jesus mendoza balleza. All rights reserved.
//

import UIKit
import RealmSwift

class Record: UIViewController {
    
    @IBOutlet var hexCode: UILabel!
    @IBOutlet var codeName: UITextField!
    @IBAction func saveButton(_ sender: UIButton) {
        if codeName.text != "" && hexCode.text != "" {
            let remoteCode = BRCode()
            remoteCode.hexCode = hexCode.text!
            remoteCode.nameCode = codeName.text!
            if saveCode(remoteCode){
                codeName.resignFirstResponder()
                resetValues()
                print("\(remoteCode.nameCode) saved")
            }
        }
    }
    
    func resetValues(){
        codeName.text = ""
        hexCode.text = ""
    }
    
    func saveCode(_ code:BRCode) -> Bool {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(code)
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
