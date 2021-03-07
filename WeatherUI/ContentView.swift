//
//  ContentView.swift
//  WeatherUI
//
//  Created by Octavian Mihuț Ilie on 07/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityNameView(cityName: "Amsterdam, NL")
                CurrentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   currentTemp: isNight ? 4 : 16)
                
                Spacer()
                
                HStack(spacing: 28) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "sun.max.fill",
                                   temperature: 18)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.sun.fill",
                                   temperature: 14)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.rain.fill",
                                   temperature: 12)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fog.fill",
                                   temperature: 12)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "wind",
                                   temperature: 8)
                }.padding(.bottom, 20).padding(.top, 160)
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    DefaultButton(buttonText: isNight ? "Change to day time" : "Change to night",
                                  textColor: .blue,
                                  backgroundColor: .white)
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
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityNameView: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: String
    var currentTemp: Int
        
    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(currentTemp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
