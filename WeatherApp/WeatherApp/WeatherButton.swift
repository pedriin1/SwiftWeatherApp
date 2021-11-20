
import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        
            Text("Change day time")
                .frame(width: 280, height: 50)
                .background(Color.white)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(8)
            
        
    }
}
