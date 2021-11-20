//
//  ContentView.swift
//  WeatherApp
//
//  Created by Pedro Maia on 18/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = true
    
    var body: some View {
        ZStack{
            
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue") )
            
            VStack{
                CityTextView(cityName: "Cupertino")
                    
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "wind.snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "sunset.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "snow", temperature: 25)
                }
                
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change day time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        HStack{
            VStack(alignment: .center){
                Text(dayOfWeek).font(.system(size:16, weight: .medium))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
                    .animation(.easeInOut)
            }
        }
    }
}

struct BackgroundView: View {
    var topColor:Color
    var bottomColor:Color
    
    var body: some View {
      
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topTrailing, endPoint: .bottomTrailing).ignoresSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 76, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}




