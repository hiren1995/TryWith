//
//  ViewController.swift
//  TryWith
//
//  Created by APPLE MAC MINI on 20/06/17.
//  Copyright © 2017 APPLE MAC MINI. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var scroll1: UIScrollView!
    
    @IBOutlet weak var signupbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        signupbtn.layer.borderColor = UIColor.orange.cgColor;
        
        signupbtn.layer.borderWidth = 1
        
        pagecontrol.addTarget(self, action: #selector(self.changepage(sender:)), for: UIControlEvents.valueChanged)
        
        scroll1.delegate = self
        
    }
    
    func changepage(sender: AnyObject ){
    
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pagecontrol.currentPage = Int(pageNumber)
    
    }
  

    override func viewDidLayoutSubviews() {
     
        //.contentSize = (,)
        //
       
         scroll1.contentSize = CGSize(width: UIScreen.main.bounds.width*3, height: 170)
    }
    
    
    //scrollViewDidEndDecelerating
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

