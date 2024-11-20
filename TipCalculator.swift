import SwiftUI

struct TipCalculator: View {
    @State private var enteredAmount: String = ""
    @State private var tipAmount: Double = 0
    @State private var totalAmount: Double = 0
    @State private var tipSlider: Double = 15
  
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            TipCalculator()
        }
    }

    //Body of the view that specifies the UI layout and content
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Enter Bill Amount")
                    .foregroundColor(.secondary)
                
                TextField("0.00", text: $enteredAmount)
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
                    #if os(iOS)
                    .keyboardType(.decimalPad)
                    #endif
                    .multilineTextAlignment(.center)
            }
            
            Text("Tip: \(tipSlider, specifier: "%.0f")%")
                 
            Slider(value: $tipSlider, in: 0...100, step: 1)
                .onChange(of: tipSlider) { _ in
                    updateTipAndTotal()
                }

            // Tip Amount Display
            VStack {
                Text(tipAmount, format: .currency(code: "PHP"))
                    .font(.title.bold())

                Text("Tip")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)

    // VStack for the Total
     VStack {
                Text(totalAmount, format: .currency(code: "PHP"))
                    .font(.title.bold())
                
                Text("Total")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(30)
    }

    // Function to update the tip and total after tip slider has been set
     func updateTipAndTotal() {
        guard let amount = Double(enteredAmount) else {
            print("Invalid Amount")
            return
        }
     
       guard let tip = calculateTip(of: amount, with: tipSlider) else {
            print("Bill amount or tip cannot be negative")
            return
        }
        
        tipAmount = tip
        totalAmount = amount + tipAmount
    }


}

