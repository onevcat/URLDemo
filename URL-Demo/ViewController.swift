//
//  ViewController.swift
//  URL-Demo
//
//  Created by Wei Wang on 15/12/6.
//  Copyright © 2015年 Wei Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        doRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doRequest() {
        let url = NSURL(string: "https://gis.map2bit.com/mobile/getMyProject")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Done: \(data)")
            }
        }
        
        dataTask.resume()
    }
}

extension ViewController: NSURLSessionDelegate {
    func URLSession(session: NSURLSession, didReceiveChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        print("Miao")
    }
}