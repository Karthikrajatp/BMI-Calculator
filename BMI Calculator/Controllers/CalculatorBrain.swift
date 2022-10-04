
import Foundation
import UIKit
struct CalculatorBrain {
    var bmi: BMI?
    func getBMIValue() -> String {
        let bmito1decimal=String(format: "%.1f",bmi?.value ?? 0.0)
        return bmito1decimal
    }
    mutating func calculateBMIValue(height:Float,weight:Float) {
        let bmiValue=weight/(height * height)
        if bmiValue<18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more", color: .blue)
        }else if bmiValue<24.9{
            bmi = BMI(value: bmiValue, advice: "fit", color: .green)
        }else{
            bmi = BMI(value: bmiValue, advice: "eat less", color: .red)
        }
        
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "nothing"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }}
