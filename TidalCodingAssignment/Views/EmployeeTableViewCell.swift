//
//  EmployeeTableViewCell.swift
//  TidalCodingAssignment
//
//  Created by Paul McGrath on 1/29/26.
//

import UIKit



class EmployeeTableViewCell: UITableViewCell {
    static let imageCache: NSCache<NSString, UIImage> = NSCache()
    
    var employee: Employee? = nil {
        didSet
        {
            nameLabel?.text = employee?.full_name
            teamLabel?.text = employee?.team
            phoneLabel?.text = employee?.phone_number
            retrievePhoto()
        }
    }
    
    @IBOutlet var photoImageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var teamLabel: UILabel?
    @IBOutlet var phoneLabel: UILabel?
    
    var placeholderImage: UIImage? = UIImage(named: "PlaceholderImage")
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView?.image = self.placeholderImage
    }
    
    func retrievePhoto() {
        guard let photoURLString = employee?.photo_url_small, let photoURL = URL(string: photoURLString) else { return }
        if let image = EmployeeTableViewCell.imageCache.object(forKey: photoURLString as NSString) {
            self.photoImageView?.image = image
        } else {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: photoURL) {
                    DispatchQueue.main.async {
                        guard let image = UIImage(data: data) else {
                            self.photoImageView?.image = self.placeholderImage
                            return
                        }
                        self.photoImageView?.image = image
                        EmployeeTableViewCell.imageCache.setObject(image, forKey: photoURLString as NSString)
                    }
                }
            }
        }
    }
}


