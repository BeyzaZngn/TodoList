//
//  AddView.swift
//  TodoList
//
//  Created by Beyza Zengin on 19.07.2024.
//

import SwiftUI

struct AddView: View {
    
    // Geçerli görünümü kapatmak için kullanılan @Environment değişkeni
    @Environment(\.presentationMode) var presentationMode
    
    // Ortak kullanılan ViewModel'e erişmek için kullanılan @EnvironmentObject değişkeni
    @EnvironmentObject var listViewModel: ListViewModel
    
    // Kullanıcının metin girişi yapması için kullanılan @State değişkeni
    @State var textFieldText: String = ""
    
    // Uyarı başlığı ve görünürlüğü için kullanılan @State değişkenleri
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                
                // Kaydet
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert) // Uyarı gösterimi
    }
    
    // Kaydet düğmesine basıldığında çağrılan fonksiyon
    func saveButtonPressed() {
        if textIsAppropriate() { // Metin uygun uzunluktaysa
            listViewModel.addItem(title: textFieldText) // Yeni öğe ekle
            presentationMode.wrappedValue.dismiss() // Görünümü kapat
        }
    }
    
    // Metin uzunluğunu kontrol eden fonksiyon
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 { // Eğer metin 3 karakterden kısa ise
            alertTitle = "Your new todo item must be at least 3 characters long !!!😰😨😱"
            showAlert.toggle() // Uyarıyı göster
            return false
        }
        return true
    }
    
    // Uyarı mesajını döndüren fonksiyon
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }

}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel()) 
}
