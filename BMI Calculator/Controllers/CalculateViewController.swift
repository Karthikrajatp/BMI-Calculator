
import UIKit

class CalculateViewController: UIViewController {
    var calculatorBrain=CalculatorBrain()

    @IBOutlet weak var weightProgressBar: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightProgressbar: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChange(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text=height+"m"
    }
    
    
    @IBAction func weightChange(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text=weight+"Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height=heightProgressbar.value
        let weight=weightProgressBar.value
        calculatorBrain.calculateBMIValue(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as!ResultViewController
            destinationVC.bmi=calculatorBrain.getBMIValue()
            destinationVC.advice=calculatorBrain.getAdvice()
            destinationVC.color=calculatorBrain.getColor()
            
    
    }
}
}

