//
//  NoItemsView.swift
//  TodoList
//
//  Created by Beyza Zengin on 15.08.2024.
//

import SwiftUI

struct NoItemsView: View {
    
    // Animasyonu kontrol etmek için kullanılan @State değişkeni
    @State var animate: Bool = false
    // İkinci bir vurgu rengi tanımlama
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(), // Yeni öğe ekleme ile bağlantı
                    label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor) // Arka plan rengi animasyon durumuna göre değişir
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), // Gölge rengi ve opaklığı animasyon durumuna göre değişir
                        radius: animate ? 30 : 10, // Gölge büyüklüğü animasyon durumuna göre değişir
                        x: 0.0,
                        y: animate ? 50 : 30) // Gölge konumu animasyon durumuna göre değişir
                .scaleEffect(animate ? 1.1 : 1.0) // Ölçek animasyon durumuna göre değişir
                .offset(y: animate ? -7 : 0) // Y ekseninde yer değişimi animasyon durumuna göre değişir
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // Animasyonu ekleyen fonksiyon
    func addAnimation() {
        guard !animate else { return } // Eğer animasyon zaten başlatılmışsa işlemi durdurur
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Animasyonu 1.5 saniye gecikmeyle başlatır
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0) // Giriş ve çıkış animasyonunu 2 saniyelik sürede uygular
                    .repeatForever() // Sonsuz tekrar yapar
            ) {
                animate.toggle() // Animasyon durumunu değiştirir
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
