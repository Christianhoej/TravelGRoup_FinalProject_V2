
import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource, CountryDataProtocol  {
    
    let myPickerData = [String](arrayLiteral: "Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","AG","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia","Botswana","Brazil","Brunei","Bulgaria","BF","Burundi","Cambodia","Cameroon","CV","Chad","Chile","China","Colombia","Congo","CK","CR","CI","Croatia","Cuba","Cyprus","CZ","Denmark","Djibouti","Dominica","DO","Ecuador","Egypt","Equatorial Guinea", "Estonia", "Ethiopia", "FK", "FO", "Fiji", "Finland","France","French Polynesia","Gabon","Gambia","GB","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","HK","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","IM","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","KR","KY","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","LK","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","NC","NZ","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","PG","Paraguay","Peru","Philippines","Poland","Portugal","PR","Qatar","Reunion","Romania","Russia","Rwanda","PM","Satellite","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Spain","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","SV","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","TT","Tunisia","Turkey","Turkmenistan","TC","Uganda","Ukraine","AE","USA", "Uruguay","Uzbekistan","Venezuela","Vietnam","VG","Yemen","ZA","Zambia","Zimbabwe")

    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var selectCountry: UIButton!
    @IBOutlet weak var addToWishList: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    var dataSession = Countrydata()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSession.delegate = self
        let thePicker = UIPickerView()
        thePicker.delegate = self
        countryName.inputView = thePicker
        //
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryName.text = myPickerData[row]
    }

    @IBAction func buttonAct(sender: UIButton){
        switch sender {
        case selectCountry:
            print("select country")
            if (countryName.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
                let alert = UIAlertController(title: "No input", message: "Please enter a valid country", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else{
                let country = countryName.text
                self.dataSession.getCountry(name: country!)
                
            }
            
        case addToWishList:
            print("add to wish list")
        default:
            print("Default")
        }
    }
    
    
    //MARK: Example Data Protocol
    
    func responseDataHandler(data:NSDictionary) {
        //let title = data["title"] as! String
        if data != nil{
        print(data)
            print("@@@@@")
        }
        else{
            print("LOST")
        }
        let currencies : NSArray = (data.value(forKey: "currencies") as? NSArray)!
        let currency : NSDictionary? = currencies[0] as? NSDictionary
   
        let languages : NSArray = (data.value(forKey: "languages") as? NSArray)!
        let language : NSDictionary? = languages[0] as? NSDictionary
        
        let name = data.value(forKey: "name")
        let capital = data.value(forKey: "capital")
        let population = data.value(forKey: "population")
        let countryLanguage = language?.value(forKey: "name")
        let region = data.value(forKey: "region")
        let area = data.value(forKey: "area")
        let countryCurrency = currency?.value(forKey: "name")
        
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            self.capitalLabel.text="\(capital!)"
            self.capitalLabel.isHidden = false
            self.countryNameLabel.text="\(name!)"
            self.countryNameLabel.isHidden = false
            self.populationLabel.text="\(population!)"
            self.populationLabel.isHidden = false
            self.languagesLabel.text="\(countryLanguage!)"
            self.languagesLabel.isHidden = false
            self.regionLabel.text="\(region!)"
            self.regionLabel.isHidden = false
            self.areaLabel.text="\(area!) km^2"
            self.areaLabel.isHidden = false
            self.currencyLabel.text="\(countryCurrency!)"
            self.currencyLabel.isHidden = false
            
        }
    }

    func responseError(message:String) {
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            //self.bodyTextView.text = message
        }
    }

}

