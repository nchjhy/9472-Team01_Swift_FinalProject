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

}

