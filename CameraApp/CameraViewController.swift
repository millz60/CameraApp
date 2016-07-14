//
//  ViewController.swift
//  CameraApp
//
//  Created by Matt Milner on 7/13/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    Create an app (Single View Application) in Swift that allows the user to take pictures and display them in the UIImageView control. When the user clicks on the UIImageView then a UIActionSheet will display asking the user if he/she wants to pick a photo from Photo Library or Take a new picture.
//    
//    If the user select Photo Library then the Photo Library is opened and the user selects the picture
//    If the user selects Camera then the camera is opened where the user can take the pictures
    
    
    @IBOutlet weak var pictureImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    @IBAction func imageViewPressed(){
        
        let imageDestinationPicker = UIImagePickerController()
        imageDestinationPicker.delegate = self
        
        let alertController = UIAlertController(title: "Select Image Destination", message: nil, preferredStyle: .ActionSheet)
        
        let selectImageFromLibraryAction = UIAlertAction(title: "Select from Library", style: .Default) { (alert: UIAlertAction) in
            
            imageDestinationPicker.sourceType = .PhotoLibrary
            self.presentViewController(imageDestinationPicker, animated: true, completion: nil)
            
        }
        
        alertController.addAction(selectImageFromLibraryAction)
        
        let takeNewPhotoAction = UIAlertAction(title: "Take New Photo", style: .Default) { (alert: UIAlertAction) in
            
            imageDestinationPicker.sourceType = .Camera
            self.presentViewController(imageDestinationPicker, animated: true, completion: nil)
            
        }
        
        alertController.addAction(takeNewPhotoAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive) { (alert: UIAlertAction) in
            // Cancels the picker control
        }
        
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
    
        self.pictureImageView.image = selectedImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveImage(){
        
        UIImageWriteToSavedPhotosAlbum(pictureImageView.image!, nil, nil, nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

