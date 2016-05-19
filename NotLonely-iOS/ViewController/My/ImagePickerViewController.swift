//
//  ImagePickerViewController.swift
//  NotLonely-iOS
//
//  Created by efan on 5/16/16.
//  Copyright © 2016 cm. All rights reserved.
//

//import Cocoa
import UIKit
import RxCocoa
import RxSwift



class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var cameraBtn: UIButton!{
        didSet{
            cameraBtn.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)
        }
    }
    
    @IBOutlet weak var photoBtn: UIButton!{
        didSet{
             photoBtn.enabled = UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
        }
    }
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        
        cameraBtn.rx_tap
            .subscribeNext{ [weak self] in
                self!.imagePicker.allowsEditing = false
                self!.imagePicker.sourceType = .Camera
                self!.presentViewController(self!.imagePicker, animated: true, completion: nil)
        }
        
        photoBtn.rx_tap
            .subscribeNext{
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
        doneBtn.rx_tap
            .subscribeNext{ [weak self] in
                //save the image
            self?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        if let image = editingInfo![UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
            self.imageView.contentMode = .ScaleAspectFit
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}



