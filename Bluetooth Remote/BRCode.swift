//
//  BRCode.swift
//  Bluetooth Remote
//
//  Created by jorge jesus mendoza balleza on 12/10/17.
//  Copyright © 2017 jorge jesus mendoza balleza. All rights reserved.
//

import Foundation
import RealmSwift

class BRCode: Object {
    @objc dynamic var hexCode = ""
    @objc dynamic var nameCode = ""
}
