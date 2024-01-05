//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Süleyman Ayyılmaz on 5.01.2024.
//
import SwiftUI

struct WeatherButton: View{
    
    var title: String
    var textcolor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(title)
                
                .bold()
        .frame(width: 200, height:50 )
        .background(backgroundColor.gradient)
        .cornerRadius(20)
            
        
        }
        .foregroundColor(textcolor)
        
     
            }
        }

        
        struct WeatherButton_Previews: PreviewProvider {
            
            static var  previews: some View {
                
                WeatherButton(title: "Test title", textcolor: .white, backgroundColor: .blue)
  
    }
            
}
