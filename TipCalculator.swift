// TipCalculator

import SwiftUI

// Helper struct for tip calculation logic
struct TipCalculatorHelper {
    func calculateTip(forAmount amount: Double, withTipPercentage tipPercentage: Double) -> Double? {
        guard amount >= 0, tipPercentage >= 0 else { return nil }
        let percentage = tipPercentage / 100
        return amount * percentage
    }
}

struct DisplayAmountView: View {
    var title: String
    var amount: Double

    var body: some View {
        VStack {
            Text(amount, format: .currency(code: "PHP"))
                .font(.title.bold())
            Text(title)
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.top, 20)
    }
}

struct TipCalculator: View {
    @State private var enteredAmount: String = ""
    @State private var tipAmount: Double = 0
    @State private var totalAmount: Double = 0
    @State private var tipSlider: Double = 15
    private let calculation = Calculation()

    struct TipCalculator_Previews: PreviewProvider {
        static var previews: some View {
            TipCalculator()
                .previewDevice("iPhone 14 Pro")
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            // Input Section
            VStack(spacing: 10) { 
                Text("Enter Bill Amount")
                    .foregroundColor(.secondary)
                
                TextField("Enter amount", text: $enteredAmount)
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
                    .keyboardType(.decimalPad)
                    .onChange(of: enteredAmount) { newValue in
                        enteredAmount = newValue.filter { $0.isNumber || $0 == "." }
                    }
                    .multilineTextAlignment(.center)
            }
            .padding() 

            // Tip Slider Section
            VStack(spacing: 10) {
                Text("Tip: \(tipSlider, specifier: "%.0f")%")
                
                Slider(value: $tipSlider, in: 0...100, step: 1) {
                    Text("Tip Percentage")
                }
                .onChange(of: tipSlider) { _ in
                    updateTipAndTotal()
                }
                .padding(.horizontal, 30)
            }
            .padding() 

            // Output Section
            VStack(spacing: 20) { 
                DisplayAmountView(title: "Tip", amount: tipAmount)
                DisplayAmountView(title: "Total", amount: totalAmount)
            }
            .padding() 
        }
        .padding(.horizontal, 20) 
        .background(Color(.systemBackground)) 
    }

    // Updates the tip and total based on the tip slider
    func updateTipAndTotal() {
    guard let amount = Double(enteredAmount.trimmingCharacters(in: .whitespacesAndNewlines)), amount > 0 else {
        print("Please enter a valid positive number for the amount.")
        return
    }

    guard let tip = calculation.calculateTip(forAmount: amount, withTipPercentage: tipSlider) else {
        print("Bill amount or tip percentage cannot be negative.")
        return
    }

    tipAmount = tip
    totalAmount = amount + tip
    }

}

