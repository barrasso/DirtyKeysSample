//
//  KeyboardViewController.swift
//  DirtyKeys
//
//  Created by Mark on 1/14/15.
//  Copyright (c) 2015 MEB. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var dirtyKeysView: UIView!
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints()
    {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    // MARK: View Initialization
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        // load dirty key interface
        loadInterface()
    }

    func loadInterface()
    {
        // load nib file
        var dirtyKeysNib = UINib(nibName: "DirtyKeys", bundle: nil)
        
        // instantiate view
        dirtyKeysView = dirtyKeysNib.instantiateWithOwner(self, options: nil)[0] as UIView
        
        // add interface to main view
        view.addSubview(dirtyKeysView)
        
        // This will make the button call advanceToNextInputMode() when tapped
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    // MARK: Text Input Functions

    override func textWillChange(textInput: UITextInput)
    {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput)
    {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
    }
}
