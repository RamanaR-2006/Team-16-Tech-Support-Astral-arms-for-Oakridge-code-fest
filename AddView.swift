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
import UIKit


struct AddView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    
    @State var expName: String = ""
    @State var expOrganisation: String = ""
    @State var expDuration: String = ""
    @State var expProcedure: String = ""
    @State var expMaterials: String = ""
    @State var expPrecautions: String = ""
    var body: some View {
        ZStack{
            
            Rectangle().frame(width:390,height:710).cornerRadius(40).foregroundColor(Navy).padding(50)
            
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
                        Button(action: {
                            self.isImagePickerPresented = true
                        }, label: {
                            Text("Add Image").foregroundColor(.white).font(Font.custom("Nexa-Heavy",size:20))
                        }))
                    
                    Spacer()
                    
                    Rectangle().frame(width:120,height:50).cornerRadius(40).foregroundColor(LightBlue).overlay(
                        Button(action: {
                            addNewExperiment()
                        }, label: {
                            Text("Add Exp").foregroundColor(.white).font(Font.custom("Nexa-Heavy",size:20))
                        }))
                    Spacer()
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(width:80,height: 80)
                    }
                    
                    Spacer()
                    
                }
                
                    Spacer()
                    
            }.frame(width:360,height:710).sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
            }
            
            
            
        }
    }
    private func addNewExperiment() {
        // Upload the image first
        uploadImage(selectedImage) { imageUrl in
            
            // Construct the product data
            let experimentData: [String: Any] = [
                "expName": self.expName,
                "expOrganisation": self.expOrganisation,
                "expDuration": self.expDuration,
                "expMaterials": self.expMaterials,
                "expProcedure": self.expProcedure,
                "expPrecautions": self.expPrecautions,
                "expURL": imageUrl
            ]
            
            // Upload product data to Firestore
            let db = Firestore.firestore()
            db.collection("Experiments").addDocument(data: experimentData) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    resetForm()
                }
            }
        }
        }
    
    private func uploadImage(_ image: UIImage?, completion: @escaping (String) -> Void) {
        guard let imageData = image?.jpegData(compressionQuality: 0.4) else {
            completion("")
            return
        }

        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child("images/\(UUID().uuidString).jpg")

        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error)")
                completion("")
                return
            }

            imageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error)")
                    completion("")
                    return
                }

                if let imageUrl = url?.absoluteString {
                    completion(imageUrl)
                } else {
                    completion("")
                }
            }
        }
    }

    
    private func resetForm() {
        self.selectedImage = nil
        self.expName = ""
        self.expOrganisation = ""
        self.expDuration = ""
        self.expMaterials = ""
        self.expProcedure = ""
        self.expPrecautions = ""
    }
    }

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


#Preview {
    AddView()
}
