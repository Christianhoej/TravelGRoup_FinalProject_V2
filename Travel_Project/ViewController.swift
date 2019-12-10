
import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource, CountryDataProtocol  {
    
    let myPickerData = [String](arrayLiteral: "Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","AG","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia","Botswana","Brazil","Brunei","Bulgaria","BF","Burundi","Cambodia","Cameroon","CV","Chad","Chile","China","Colombia","Congo","CK","CR","CI","Croatia","Cuba","Cyprus","CZ","Denmark","Djibouti","Dominica","DO","Ecuador","Egypt","Equatorial Guinea","Estonia","Ethiopia","FK","FO","Fiji","Finland","France","French Polynesia","Gabon","Gambia","GB","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","HK","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","IM","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","KR","KY","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","LK","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","NC","NZ","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","PG","Paraguay","Peru","Philippines","Poland","Portugal","PR","Qatar","Reunion","Romania","Russia","Rwanda","PM","Satellite","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Spain","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","SV","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","TT","Tunisia","Turkey","Turkmenistan","TC","Uganda","Ukraine","AE","USA", "Uruguay","Uzbekistan","Venezuela","Vietnam","VG","Yemen","ZA","Zambia","Zimbabwe")

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
    
    
    var dataSession = Countrydata()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSession.delegate = self
        let thePicker = UIPickerView()
        thePicker.delegate = self
        countryName.inputView = thePicker
        //
        
        
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


    //let countryData = Countrydata()
   
    //let datasession = Countrydata();
    
    
    
    
  /*
    func selectCountryFunc() {
        if (countryName.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            let alert = UIAlertController(title: "No input", message: "Please enter a valid country", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            let country = countryName.text
            self.dataSession.getCountry(name: country!)
            
        }
    }
    */
  /*
    func selecetCountry(){
        if (countryName.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            let alert = UIAlertController(title: "No input", message: "Please enter a valid country", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            let country = countryName.text
            self.dataSession.getCountry(name: country!)
            
        }
    }
    */
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
    
    
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {

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
        
        
        
        print(countryCurrency)
        //let government = data.value(forKey: "language")
       // let currencies = data.value(forKey: "currencies") as? NSArray
        //print(currencies.value(forKey: "code"))
       // let currency = currencies![1]
      //  print(currency)
        let flag = data.value(forKey: "flag")
        
    
        
        //let url = URL(string: flag)
        //let flagData = try? Data(from: url!)
        //flagView.image = UIImage(contentsOfFile: flagData!)
        
        
      /*
        var path: String = Bundle.main.path(forResource: flag as! String, ofType: "svg")!

        var url: NSURL = NSURL.fileURL(withPath: path) as NSURL  //Creating a URL which points towards our path

       //Creating a page request which will load our URL (Which points to our path)
        var request: NSURLRequest = NSURLRequest(url: url as URL)
        webView.loadRequest(request as URLRequest)  //Telling our webView to load our above request
        
        */
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

            //self.flagView.image = flag as? UIImage
            
        }
    }

    func responseError(message:String) {
        //Run this handling on a separate thread
        DispatchQueue.main.async() {
            //self.bodyTextView.text = message
        }
    }
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DisplayViewContoller
        vc?.countryName = countryName.text!
    }
    
    */
    
    /*
     
     var listCountries: [NSManagedObject] = []
     
     //MARK: Navigation
         //Navigating between the different views
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             super.prepare(for: segue, sender: sender)
             
             switch(segue.identifier ?? "") {
                 case "AddAdventurer":
                     os_log("Adding a new adventurer", log: OSLog.default, type: .debug)
                 
                 case "Quest":
                     guard let QuestViewController = segue.destination as? QuestViewController else {
                         fatalError("Unexpected destination: \(segue.destination)")
                     }
                     
                     guard let selectedCell = sender as? AdventurerTableViewCell else {
                         fatalError("Unexpected sender: \(sender)")
                     }
                      
                     guard let indexPath = adventurerTableView.indexPath(for: selectedCell) else {
                         fatalError("The selected cell is not being displayed by the table.")
                     }
                     
                     let selectedAdventurer = adventurers[indexPath.row]
                     QuestViewController.adventurer = selectedAdventurer

                 default:
                     fatalError("Unexpected Segue Identifier; \(segue.identifier)")
             }
         }
     }
     
     */
    

}

