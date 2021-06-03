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
    
    // 取得した画像情報を保持する配列
    var imageData: [NSManagedObject] = []
    
    @IBOutlet weak var imageIdText: UILabel!
    @IBOutlet weak var imageURLText: UILabel!
    @IBOutlet weak var imageTagText: UILabel!
    @IBOutlet weak var imageLikesText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //永続コンテナのnilチェック
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
    }
    
    @IBAction func insertImageData(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Image", in: managedContext)!
        let image = NSManagedObject(entity: entity, insertInto: managedContext)
                
        // 保存する画像情報
        image.setValue(1, forKey: "id")
        image.setValue("http://...", forKey: "imageURL")
        image.setValue("sea", forKey: "tag")
        image.setValue(5, forKey: "likes")
                
        appDelegate.saveContext()
    }
    
    @IBAction func fetchImageData(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
                
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Image")
                
        do {
            // 保存した画像情報を取得
            imageData = try managedContext.fetch(fetchRequest)
                    
            imageIdText.text = "id:\(String(describing: imageData[0].value(forKey: "id")!))"
            imageURLText.text = "id:\(String(describing: imageData[0].value(forKey: "imageURL")!))"
            imageTagText.text = "id:\(String(describing: imageData[0].value(forKey: "tag")!))"
            imageLikesText.text = "id:\(String(describing: imageData[0].value(forKey: "likes")!))"
            } catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
            }
    }
    

}

