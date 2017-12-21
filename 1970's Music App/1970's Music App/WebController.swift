//
//  WebViewController.swift
//  AmericanTop40
//
//  Created by Student on 11/2/17.
//  Copyright © 2017 Hasnai Mason. All rights reserved.
//

import UIKit
import AVFoundation

class WebViewController: UIViewController
{
    @IBOutlet var webView: UIWebView!
    @IBOutlet var label: UILabel!
    private var url: URL?
    
    func setURL(url: URL?)
    {
        self.url = url
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if(url != nil)
        {
            let wwwRequest = URLRequest(url: url!)
            self.webView.loadRequest(wwwRequest)
        }
        else
        {
            label.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        print("Started")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        print("Error Loading")
        print(error)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        print("finished loading")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
