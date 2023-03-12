//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by David Granger on 3/3/23.
//

import UIKit

class AthleteFormViewController: UIViewController {
    var athlete: Athlete?
    
    required init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        if athlete != nil {
            if let age = athlete?.age {
                ageTF.text = String(describing: age)
            }
            leagueTF.text = athlete?.league
            teamTF.text = athlete?.team
            nameTF.text = athlete?.name
        }
    }
    
    
    @IBAction func saveAthlete(_ sender: Any) {
        guard let name = nameTF.text,
              let ageString = ageTF.text,
              let age = Int(ageString),
              let league = leagueTF.text,
              let team = teamTF.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "unwindThingyId", sender: self)
    }
    
 
    
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var leagueTF: UITextField!
    @IBOutlet weak var teamTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
}
