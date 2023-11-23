//
//  PlantInfoView.swift
//  plantAI
//
//  Created by Antonio Abbatiello on 19/11/23.
//

import SwiftUI

struct PlantInfoView: View {
    @Environment (\.dismiss) var dismiss
    @Environment (\.openURL) var openURL
    @State var flowerData: FlowerData?
    
    
    var body: some View {
        if flowerData != nil {
            ScrollView(.vertical, showsIndicators: false) {
                Image(flowerData!.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading) {
                    Text(flowerData!.name)
                        .font(.largeTitle)
                        .bold()
                    HStack {
                        Text(flowerData!.scientificName)
                        Spacer()
                        Text(flowerData!.familyName)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    Divider()
                    VStack {
                        Text(flowerData!.description)
                            .font(.subheadline)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    } .padding(.top)
                    Divider()
                }
                .padding()
                VStack {
                    Button {
                        openURL(URL(string: flowerData!.onlineURL)!)
                    } label: {
                        
                        Text("Read more")
                            .font(.title)
                            .bold()
                            .padding()
                    }
                    .background(.thinMaterial)
                    .cornerRadius(50)
                    .foregroundColor(.accentColor)
                    .shadow(radius: 10)
                }
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .edgesIgnoringSafeArea(.top)
            .background(        LinearGradient(
                gradient: Gradient(colors: [
                    .clear.opacity(0.2),
                    flowerData!.color.opacity(0.5)
                ]),
                startPoint: .bottom,
                endPoint: .top
            ))
            .overlay(alignment: .topTrailing, content: {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.largeTitle)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .foregroundColor(.red)
                        .padding()
                }
            })
        } else {
            ErrorView()
        }
    }
    
}


#Preview {
    PlantInfoView(flowerData: FlowerViewModel().flowers[3])
}



