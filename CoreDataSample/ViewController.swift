//
//  ViewController.swift
//  CoreDataSample
//
//  Created by 野田凜太郎 on 2021/06/03.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //永続コンテナへの参照を保持する変数
    var container: NSPersistentContainer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //永続コンテナのnilチェック
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
    }


}

