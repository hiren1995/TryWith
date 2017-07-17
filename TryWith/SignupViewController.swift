//
//  SignupViewController.swift
//  TryWith
//
//  Created by APPLE MAC MINI on 22/06/17.
//  Copyright © 2017 APPLE MAC MINI. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIToolbarDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
    
   
    
    @IBOutlet weak var imgFemale: UIImageView!
    @IBOutlet weak var imgMale: UIImageView!
    
    @IBOutlet weak var imgFullName: UIImageView!
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var imgDOB: UIImageView!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var imgInterest: UIImageView!
    @IBOutlet weak var txtInterest: UITextField!
    @IBOutlet weak var chipsCollectionView: UICollectionView!
    @IBOutlet weak var imgLocal: UIImageView!
    @IBOutlet weak var imgVacation: UIImageView!
    @IBOutlet weak var imgBusiness: UIImageView!

    
    var InterestPickerView = UIPickerView()
    
    let interest=["Select Hobbies","Reading","Writing","Music","Travelling"]
    
    
    
    var toolbar = UIToolbar()
    
    let addButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addPicker))
    let cancelButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelPicker))
    
   
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cancelPicker))
    
    
    var addInterest = [String]()
    
    
    

    @IBOutlet weak var txtFullNAme: UITextField!
  
    @IBAction func backbtn(_ sender: Any) {
        
    self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //code for setting border to textbox using imageview border
        
       imgFullName.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgFullName.layer.borderWidth = 1.0
        imgFullName.layer.cornerRadius = 25.0
        
        
        imgEmail.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgEmail.layer.borderWidth = 1.0
        imgEmail.layer.cornerRadius = 25.0
        
        imgPassword.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgPassword.layer.borderWidth = 1.0
        imgPassword.layer.cornerRadius = 25.0
        
        imgDOB.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgDOB.layer.borderWidth = 1.0
        imgDOB.layer.cornerRadius = 25.0

        imgInterest.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgInterest.layer.borderWidth = 1.0
        imgInterest.layer.cornerRadius = 25.0
        
        
        imgMale.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgMale.layer.borderWidth = 1.0
        imgMale.layer.cornerRadius = 9.0
        
        imgFemale.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgFemale.layer.borderWidth = 1.0
        imgFemale.layer.cornerRadius = 9.0
        
        imgBusiness.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgBusiness.layer.borderWidth = 1.0
        imgBusiness.layer.cornerRadius = 9.0
        
        imgVacation.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgVacation.layer.borderWidth = 1.0
        imgVacation.layer.cornerRadius = 9.0

        imgLocal.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        imgLocal.layer.borderWidth = 1.0
        imgLocal.layer.cornerRadius = 9.0

        
        //set the delegate method for DOB
        
        txtDOB.delegate = self
        txtInterest.delegate = self
        InterestPickerView.delegate = self
        InterestPickerView.dataSource = self
        toolbar.delegate = self
        
        //delegate method for chipcollectionview
        
        chipsCollectionView.delegate = self
        chipsCollectionView.dataSource = self
        
       
        //toolbar for the picker view...
        
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
       // toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolbar.sizeToFit()
        toolbar.setItems([addButton,cancelButton], animated: false)
        
        toolbar.isUserInteractionEnabled = true
     
       
        
        
        //code for closing the keyboard on touch gesture on screen
        
        
        
       // view.addGestureRecognizer(tap)
        
        
    }
    
    
    @IBAction func txtDOB(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(SignupViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
        
    
    }
    
    func datePickerValueChanged(sender:UIDatePicker){
    
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        txtDOB.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func btnDOB(_ sender: Any) {
        
        txtDOB.becomeFirstResponder()
    }
    
    @IBAction func txtInterest(_ sender: Any) {
        
        txtInterest.inputView = InterestPickerView
        txtInterest.inputAccessoryView = toolbar
        InterestPickerView.isHidden = false
        
       // view.removeGestureRecognizer(tap)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return interest.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return interest[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        txtInterest.text = interest[row]
        
        
    }
    
    @IBAction func btnInterest(_ sender: UIButton) {
        
        txtInterest.becomeFirstResponder()
    }
    
    //logic for gender selection...
    
    @IBAction func btnMale(_ sender: UIButton) {
        
        imgMale.image = UIImage(named: "radio")
        imgFemale.image = UIImage(named: "unselect")
        
    }
    
    @IBAction func btnFemale(_ sender: UIButton) {
        
        imgMale.image = UIImage(named: "unselect")
        imgFemale.image = UIImage(named: "radio")
        
    }
    
    
 
    func addPicker(){
  
        if txtInterest.text != "" && txtInterest.text != "Select Hobbies"
        {
            if(addInterest.contains(txtInterest.text!))
            {
                print("cannot insert")
            }
            else{
            
                addInterest.append(txtInterest.text!)
                txtInterest.text=""
            }
        }
  
        chipsCollectionView.reloadData()
  
    }
    
    func cancelPicker(){
        self.view.endEditing(true)
        
    }
    
    
    // the Chips collectionView methods...
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addInterest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let chip = collectionView.dequeueReusableCell(withReuseIdentifier: "chipcell", for: indexPath) as! chipCollectionViewCell
        
        
        chip.chiplabel.text = addInterest[indexPath.row]
        
        chip.chiplabel.layer.borderColor = UIColor(red: 52/255, green: 178/255, blue: 117/255, alpha: 1).cgColor
        chip.chiplabel.textColor = UIColor(red: 52/255, green: 178/255, blue: 117/255, alpha: 1)
        chip.chiplabel.layer.borderWidth = 1
        chip.chiplabel.layer.cornerRadius = 10
        
        chip.btnCancel.isHidden = true
        
        
        
        return chip
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
        let chipnew = collectionView.cellForItem(at: indexPath) as! chipCollectionViewCell
        
        chipnew.btnCancel.isHidden = false
        
        chipnew.chiplabel.layer.borderColor = UIColor.red.cgColor
        chipnew.chiplabel.textColor = UIColor.red
        chipnew.chiplabel.layer.borderWidth = 1
        chipnew.chiplabel.layer.cornerRadius = 10
        
        
        chipnew.btnCancel.isHidden = false
        chipnew.btnCancel.layer.cornerRadius = 7.5
        
        chipnew.btnCancel.layer.setValue(indexPath.row, forKey: "index")
        chipnew.btnCancel.addTarget(self, action: #selector(deletecell), for: .touchUpInside)
        
        //chipsCollectionView.reloadData()
    }
    
    @IBAction func deletecell(_sender:UIButton){
      
        let i : Int = (_sender.layer.value(forKey: "index")) as! Int
        addInterest.remove(at: i)
        chipsCollectionView.reloadData()
        
        
        
    }
    
    
    @IBAction func btnBusiness(_ sender: Any) {
        
        imgLocal.image = UIImage(named: "unselect")
        imgVacation.image = UIImage(named: "unselect")
        imgBusiness.image = UIImage(named: "radio")
    }
    @IBAction func btnVacation(_ sender: Any) {
        
        imgLocal.image = UIImage(named: "unselect")
        imgVacation.image = UIImage(named: "radio")
        imgBusiness.image = UIImage(named: "unselect")
    }
    @IBAction func btnLocal(_ sender: Any) {
        
        imgLocal.image = UIImage(named: "radio")
        imgVacation.image = UIImage(named: "unselect")
        imgBusiness.image = UIImage(named: "unselect")
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     what happen sir i have made a different class for cell is that ok.. yeah nop yeah thats fine I am asking means after showing the result hiren five times you just need to replace that by array first arry will be emty and whne you add from picker it will get filled and reload collection thats it
     okk sir,...
     vbut how to give green color to cell i dot get it yeah if you are stucking at that point ask me,, but atleat make a logic and implemet it and rets I will guide okk so i m first making logic then we will. .give that greenn color see yesterday we have promised to deliver demo but we failed in this and I got pressure we need to speed dup
     yes su\ir..
     agar kahi nahi pata chal raha yaa mene jo logic batay usme nahi idea aya to puch lena bhaai tensn nahi lena ki me fir se puchunga to unko lagega nahi pata chal ise
     esa kuch nahi aap first time kar rhe ho to obiviously nahi pata hoga
     but apne ap man me sochoge kese karn ahe nahi samaj aya or puchoge nahi to aaage kam nahi badhega
     yes sir m\nahi aaya tohnpuvchh lunga..ok chalo wo array wala akr lo yes..
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     
     how should i do that...
     how many interest he can select4 max four? yup kzz
     and how many options are there for interest
     ??
     bolo na
     sir basically the intersest will be coming form the api and one can max to max select all of them coming from api.. but you told max four
     i went to sir for confirming that.. hmm okay see for that what you have to do is you have to take one picker and confirm it with Kartik bhai that how to remove it if added once t
     sir you complete..
     kartik sir told that just like android when we long press the picket it gives the removing option..same we need to keep in thius..
     hmm for that waht you have to do 
     see it will be a big thing for you first you ahve to set picker in the textield  and below textfield you ahve to take collectionview
     in collectionview you ahve to take label and that label there is cros button byfefault it will be inviisble and whn you press it will visible
      and scroll of collection w have to set horizontal
     got my point
     if you ahve done collection you can do this and 
     yes and yeah for that label you have to set bordercolor and cornerradius so it will look like the same way as we want
     okk 
     
     
     sir i thaught of making collection first ok
    }
    */

}
