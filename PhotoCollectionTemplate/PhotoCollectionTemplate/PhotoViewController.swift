//
//  PhotoViewController.swift
//  PhotoCollectionTemplate
//
//  Created by Nicolas Roy on 2/3/17.
//  Copyright © 2017 Nick's Basement. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    
    var imagePicker = UIImagePickerController();
    
    @IBAction func OnGetPhotos(_ sender: AnyObject) {
        // We're getting from the photolibrary
        imagePicker.sourceType = .photoLibrary;
        
        // Present the image picker described above
        // it will be animated
        // upone completion, execute test() when the imagepicker appears (not when it's dismissed)
        present(imagePicker, animated: true, completion: test);
    }
    
    func test() {
        print("done");
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
        
        photoView.image = image;
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OnTakePhoto(_ sender: AnyObject) {
    }
    
    
    @IBAction func OnAddPhoto(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        
        // Photo is the CoreData entity we declared and selected codegen for
        // always select the entity name with context
        let photo = Photo(context: context);
        photo.title = titleField.text;
        photo.image = UIImagePNGRepresentation(photoView.image!) as NSData?;
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext();
        
        navigationController!.popViewController(animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        imagePicker.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
