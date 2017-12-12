//
//  ViewController.swift
//  Bluetooth Remote
//
//  Created by jorge jesus mendoza balleza on 10/31/17.
//  Copyright © 2017 jorge jesus mendoza balleza. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realm.objects(BRCode.self).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BRCodeCell", for: indexPath) as! BRCodeCell
        
        cell.title.text = realm.objects(BRCode.self)[indexPath.row].nameCode
        cell.backgroundColor = UIColor.green
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        remoteCodesCollection.reloadData()
    }
    
    @IBOutlet weak var remoteCodesCollection: UICollectionView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        remoteCodesCollection.dataSource = self
        
        let codes = realm.objects(BRCode.self)
        
        print(codes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

