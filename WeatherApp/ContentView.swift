//
//  ContentView.swift
//  WeatherApp
//
//  Created by Süleyman Ayyılmaz on 5.01.2024.
//

import SwiftUI

struct CityWeather {
    var name: String
    var temperature: Int
}

struct ContentView: View {
    
    @State private var isNight = false
    @State private var citiesWeather: [CityWeather] = [
        CityWeather(name: "Çeşme", temperature: 20),
        CityWeather(name: "İstanbul", temperature: 18),
        CityWeather(name: "Ankara", temperature: 15),
    ]
    
    @State private var selectedCityIndex = 0
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(isNight: isNight)
            
            VStack {
                
                Picker("Select a city", selection: $selectedCityIndex) {
                    ForEach(0..<citiesWeather.count, id: \.self) { index in
                        Text(citiesWeather[index].name)
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                CityTextview(cityName: citiesWeather[selectedCityIndex].name)
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: citiesWeather[selectedCityIndex].temperature)
                
                HStack(spacing: 20.0) {
                    WeatherDayView(DayOfWeek: "TUE", imageName: "cloud.fill", temperature: 14)
                    WeatherDayView(DayOfWeek: "WED", imageName: "sun.max.fill", temperature: 17)
                    WeatherDayView(DayOfWeek: "THU", imageName: "cloud.drizzle.fill", temperature: 15)
                    WeatherDayView(DayOfWeek: "FRI", imageName: "cloud.heavyrain.fill", temperature: 12)
                    WeatherDayView(DayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 17)
                }
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        
                        WeatherButton(title: "Change Day Time", textcolor: .blue, backgroundColor: .white)
                        
                    }
                    Spacer()
                }
                .padding()
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
    var DayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            HStack {
                Text(DayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                Spacer()
            }
            
            HStack {
                VStack {
                    Image(systemName: imageName)
                        .symbolRenderingMode(.multicolor)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    Text("\(temperature)°")
                        .font(.system(size: 25, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
}


struct BackgroundView: View {
    
     var isNight: Bool
    
    var body: some View{
        ContainerRelativeShape()
            .fill(isNight ?  Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }

}

struct CityTextview: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .frame(width: 200, height: 200)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 50, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}




