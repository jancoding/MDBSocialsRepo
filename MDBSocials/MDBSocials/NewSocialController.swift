//
//  NewSocialController.swift
//  MDBSocials
//
//  Created by Abhishek Kattuparambil on 10/17/20.
//

import UIKit
import Firebase
import FirebaseStorage

class NewSocialController: UIViewController {
    @IBOutlet weak var event: UITextField!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var library: UIButton!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var post: UIButton!
    let storage = Storage.storage()
    @IBOutlet weak var popup: UIView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.layer.cornerRadius = camera.frame.height/2
        library.layer.cornerRadius = library.frame.height/2
        post.layer.cornerRadius = post.frame.height/2
        camera.backgroundColor = UIColor.systemGreen
        library.backgroundColor = UIColor.orange
        camera.setImage(UIImage(systemName: ""), for: .normal)
        
        self.imagePicker.delegate = self
        
        popup.layer.cornerRadius = popup.frame.width/8
    }
    
    @IBAction func takePicture(_ sender: Any) {
        self.imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func choosePicture(_ sender: Any) {
        self.imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func post(_ sender: Any) {
        let descrip = desc.text!.replacingOccurrences(of: "Add a Description:", with: "")
        Firestore.firestore().collection("events").addDocument(data: ["creator": LoginViewController.user.email, "description":descrip,
            "date": date.date.description]) { (error) in
            if error != nil{
                //show error message
                print(error?.localizedDescription)
            }
        }
        
        let imageID = "\(descrip)"
        let storageRef = storage.reference(withPath: "images/\(imageID).jpg")
        guard let imageData = image.image?.jpegData(compressionQuality: 0.75) else {return}
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg"
        storageRef.putData(imageData)
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewSocialController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func clearCache(){
        image.image = nil
        post.isHidden = true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage{
            image.image = pickedImage
            image.setNeedsDisplay()
            self.setNeedsFocusUpdate()
            post.isHidden = false
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
