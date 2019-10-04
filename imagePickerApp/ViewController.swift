//
//  ViewController.swift
//  imagePickerApp
//
//  Created by Tia Lendor on 10/4/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func cameraSelected(_ sender: UIBarButtonItem) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        imagePickerViewController.sourceType = .photoLibrary
        
        present(imagePickerViewController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var userProfilePicture: UIImageView!
    
    @IBAction func userNameText(_ sender: UITextField) {
    }
    var profilePicture = UIImage() {
        didSet {
            userProfilePicture.image = profilePicture
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            //couldn't get image :(
            return
        }
        self.profilePicture = image
        dismiss(animated: true, completion: nil)
    }
}
