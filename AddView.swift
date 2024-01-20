//
//  AddView.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore


struct AddView: View {
    @State var expName: String = ""
    @State var expOrganisation: String = ""
    @State var expDuration: String = ""
    @State var expProcedure: String = ""
    @State var expMaterials: String = ""
    @State var expPrecautions: String = ""
    var body: some View {
        ZStack{
            
            Rectangle().frame(width:360,height:690).cornerRadius(40).foregroundColor(Navy).padding(50)
            
            ScrollView{
                
                    Spacer()
                    Text("Add Experiment").font(Font.custom("Nexa-Heavy",size:30)).bold().foregroundColor(.white)
                    Spacer()
                    HStack {
                        Rectangle().cornerRadius(30)
                            .frame(width:300,height:40)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .overlay(TextField("Name", text: $expName).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)))
                    
                    
                    Spacer()
                    
                    
                    HStack {
                        Rectangle().cornerRadius(30)
                            .frame(width:300,height:40)
                            .foregroundColor(.white)
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding()
                    .overlay(TextField("Organisation", text: $expOrganisation).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)))
                    
                    Spacer()
                    
                    HStack {
                        Rectangle().cornerRadius(30)
                            .frame(width:300,height:40)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .overlay(TextField("Duration", text: $expDuration).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)))
                    
                    Spacer()
                    
                    
                    HStack {
                        Rectangle().cornerRadius(30)
                            .frame(width:300,height:40)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .overlay(TextField("Materials", text: $expMaterials).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)))
                    
                    Spacer()
                    
                    HStack {
                        Rectangle().cornerRadius(30)
                            .frame(width:300,height:100)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .overlay(TextField("Procedure", text: $expProcedure).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)).frame(width:300,height:100))
                    
                    Spacer()
                    
                    
                    HStack {
                        Rectangle().cornerRadius(30)
                            .frame(width:300,height:80)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .overlay(TextField("Precautions", text: $expPrecautions).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)).frame(width:300,height:80))
                    
                    Spacer()
                    
                HStack{
                    Spacer()
                    Rectangle().frame(width:150,height:50).cornerRadius(40).foregroundColor(.blue).overlay(
                        Button(action: {}, label: {
                            Text("Add Image").foregroundColor(.white).font(Font.custom("Nexa-Heavy",size:20))
                        }))
                    
                    Spacer()
                    
                    Rectangle().frame(width:170,height:50).cornerRadius(40).foregroundColor(LightBlue).overlay(
                        Button(action: {
                            addNewExperiment()
                        }, label: {
                            Text("Add Experiment").foregroundColor(.white).font(Font.custom("Nexa-Heavy",size:20))
                        }))
                    Spacer()
                }
                    Spacer()
                    
            }.frame(width:360,height:690)
            
        }
    }
    private func addNewExperiment() {
        // Upload the image first
        //uploadImage(selectedImage) { imageUrl in
            // Construct the product data
            let productData: [String: Any] = [
                "expName": self.expName,
                "expOrganisation": self.expOrganisation,
                "expDuration": self.expDuration,
                "expMaterials": self.expMaterials,
                "expProcedure": self.expProcedure,
                "expPrecautions": self.expPrecautions,
                //"productURL": imageUrl,
            ]

            // Upload product data to Firestore
            let db = Firestore.firestore()
            db.collection("Experiments").addDocument(data: productData) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    resetForm()
                }
            }
        }
    
    private func resetForm() {
        //self.selectedImage = nil
        self.expName = ""
        self.expOrganisation = ""
        self.expDuration = ""
        self.expMaterials = ""
        self.expProcedure = ""
        self.expPrecautions = ""
    }
    }


#Preview {
    AddView()
}
