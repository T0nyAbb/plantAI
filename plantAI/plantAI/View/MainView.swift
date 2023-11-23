//
//  MainView.swift
//  plantAI
//
//  Created by Antonio Abbatiello on 16/11/23.
//

import SwiftUI

struct MainView: View {
    
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var showError: Bool = false
    @Environment (\.colorScheme) var colorScheme
    @ObservedObject var classifier: ImageClassifier
    @ObservedObject var flowerData: FlowerViewModel
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                VStack {
                    Spacer()
                    VStack {
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.clear)
                            .overlay(
                                Group {
                                    if uiImage != nil {
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFit()
                                    } else {
                                        Text("Choose an Image to scan")
                                            .font(.caption)
                                            .bold()
                                    }
                                }
                            )
                        //for testing
                        Group {
                            if let imageClass = classifier.imageClass {
//                                HStack{
//                                    Text("Image categories:")
//                                        .font(.caption)
//                                    Text(saveSubstringUntilComma(inputString: imageClass))
//                                        .bold()
//                                }
                                
                            } else {
                                HStack{
                                    Text("Image not supported.")
                                        .font(.caption)
                                        .foregroundStyle(.red)
                                        .opacity(self.showError ? 1 : 0)
                                        .onAppear {
                                            if uiImage != nil {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                    self.showError = true
                                                }
                                            }
                                        }
                                        
                                }
                            }
                        }
                        .font(.subheadline)
                        .padding()
                        //end testing
                        HStack(spacing: 80) {
                            Spacer()
                            Button {
                                isPresenting = true
                                sourceType = .photoLibrary
                            } label: {
                                Image(systemName: "photo.circle.fill")
                                    .accessibilityLabel("Camera roll")
                                    .font(.system(size: 50))
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                            }
                            VStack {
                                if let imageClass = classifier.imageClass {
                                    NavigationLink(destination: PlantInfoView(flowerData: flowerData.findFlowerByName(name: saveSubstringUntilComma(inputString: imageClass)))) {
                                        Image(systemName: "viewfinder.circle.fill")
                                            .font(.system(size: 50))
                                        
                                        
                                    }.opacity(classifier.imageClass != nil ? 1 : 0)
                                        
                                } else {
                                    
                                }
                            }
                            Button {
                                isPresenting = true
                                sourceType = .camera
                            } label: {
                                Image(systemName: "camera.circle.fill")
                                    .font(.system(size: 50))
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                            }
                            Spacer()
                            
                        }
                    }
                    .sheet(isPresented: $isPresenting) {
                        ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                            .onDisappear {
                                if uiImage != nil {
                                    classifier.detect(uiImage: uiImage!)
                                }
                            }
                    }
                }
                
            }
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden()
    }
    func saveSubstringUntilComma(inputString: String) -> String {
        guard let commaRange = inputString.range(of: ",") else {
            // If there is no comma in the string, return the entire string
            return inputString
        }
        // Extract the substring until the first comma
        let substring = inputString[..<commaRange.lowerBound]
        
        return String(substring)
    }
    
   func showErr(value: Bool) -> Void {
        showError = value
    }
    
    
    
    
}

#Preview {
    MainView(classifier: ImageClassifier(), flowerData: FlowerViewModel())
}
