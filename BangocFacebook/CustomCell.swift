//
//  CustomCell.swift
//  BangocFacebook
//
//  Created by Ngoc on 10/2/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        //Create person name
        
        let attributedText = NSMutableAttributedString(string: "Bui Viet Hoai", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)])
        
        // Append time
        
        attributedText.appendAttributedString(NSAttributedString(string: "\n October 2 • Hanoi • ", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14), NSForegroundColorAttributeName: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        
        // Add paragrap
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        
        // Add global logo
        
        let attachment = NSTextAttachment()
        
        attachment.image = UIImage(named: "world")
        
        attachment.bounds = CGRectMake(0, -2, 12, 12)
        
        attributedText.appendAttributedString(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ava-cotco")
        imageView.contentMode = .ScaleAspectFit
        imageView.backgroundColor = UIColor.redColor()

        return imageView
        
    }()
    
    
    
    let statusTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Meanwhile, Beast turned to the dark side"
        textView.font = UIFont.systemFontOfSize(14)
        
        return textView
    
    }()
    
    let statusImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "hanoi")
        
        imageView.contentMode = .ScaleAspectFill
        
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    
    let likesCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "488 Likes    10.7K Comments"
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        return label
    
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        return view
    
    }()
    
    
    let likeButton: UIButton = CustomCell.buttonForTitle("Like", imageName: "like")
    
    let commentButton: UIButton = CustomCell.buttonForTitle("Comment", imageName: "comment")
    
    let shareButton: UIButton = CustomCell.buttonForTitle("Share", imageName: "share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton{
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), forState: .Normal)
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        
        return button
    
    }
    
    
    
    
    
    func addSubViews(){
        backgroundColor = UIColor.whiteColor()
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat("V:|-12-[v0]", views: nameLabel)
        
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusImageView)
        
        addConstraintsWithFormat("H:|-12-[v0]|", views: likesCommentLabel)
        
        addConstraintsWithFormat("H:|-12-[v0]-12-|", views: dividerLineView)
        
        addConstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        addConstraintsWithFormat("V:|-8-[v0(44)]-8-[v1(30)]-4-[v2]-10-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView, statusTextView, statusImageView,likesCommentLabel, dividerLineView,likeButton)
        
        addConstraintsWithFormat("V:[v0(44)]|", views: commentButton)
        
        addConstraintsWithFormat("V:[v0(44)]|", views: shareButton)
        
    }
    

}


extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

}

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerate(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }

}


















