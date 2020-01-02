//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Nilrajsinh Vaghela on 02/01/20.
//  Copyright © 2020 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit
import CoreData //step-1

class ViewController: UIViewController {
    

 var UserData: [NSManagedObject] = [] //step-2
    
    
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Name: UITextField! //step-3
    
    @IBAction func BtnSave(_ sender: UIButton) {
        
        
        self.save(email: Email.text!, name: Name.text!)
        
        
    }
    
    func save(email:String, name:String) {
      
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      // 1
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      // 2
      let entity =
        NSEntityDescription.entity(forEntityName: "User",
                                   in: managedContext)!
      
      let person = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
      
      // 3
        person.setValue(Email.text, forKeyPath: "email")
        person.setValue(Name.text, forKey: "name")
      
      
      // 4
      do {
        try managedContext.save()
        UserData.append(person)
       
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

