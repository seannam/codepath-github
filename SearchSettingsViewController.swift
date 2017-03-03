//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Sean Nam on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: Int)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {

    @IBOutlet weak var starSlider: UISlider!
    @IBOutlet weak var starLabel: UILabel!
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    
    var minStars: Int!
    var minStarsCopy: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starLabel.text = "\(minStars!)"
        minStarsCopy = minStars
        
        starSlider.value = Float(minStars!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: Any) {
        self.minStars = minStarsCopy
        self.delegate?.didSaveSettings(settings: minStarsCopy!)
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func starSliderChanged(_ sender: UISlider) {
        minStarsCopy = Int(sender.value)
        print("[DEBUG] \(minStarsCopy)")
        starLabel.text = "\(minStarsCopy!)"
        
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
