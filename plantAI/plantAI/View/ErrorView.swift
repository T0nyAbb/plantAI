//
//  ErrorView.swift
//  plantAI
//
//  Created by Antonio Abbatiello on 20/11/23.
//

import SwiftUI

struct ErrorView: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "viewfinder.trianglebadge.exclamationmark")
                    .accessibilityLabel("Image Error")
                    .font(.largeTitle)
                    .padding()
                Text("Image not recognized!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                Text("Try again with another image.")
                    .font(.callout)
            } .padding()
        
        } .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
            .overlay(alignment: .topTrailing, content: {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "xmark.circle")
                                    .font(.largeTitle)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(20)
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                    })
            .padding()
            
        }
        
    }
    


#Preview {
    ErrorView()
}
