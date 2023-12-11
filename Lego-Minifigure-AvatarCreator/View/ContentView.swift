//
//  ContentView.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    // ContentViewModel, görünümdeki durumu yöneten bir view model nesnesi
    @StateObject var contentViewModel: ContentViewModel = .init()

    var body: some View {
        // Ana görünüm
        Form {
            // Başlık seçimini içeren bölüm
            Section {
                ScrollView(.horizontal) {
                    LazyHStack(content: {
                        // Başlık seçeneklerini yatay olarak gösteren ScrollView
                        ForEach(ImageHead.allCases) { item in
                            // Her başlık için özel görüntü görüntüleyici
                            CustomImageView(imagePath: item.rawValue)
                                .frame(width: 100, height: 100)
                                .padding()
                                // Tıklama animasyonu ekleniyor
                                .onTapGesture {
                                    withAnimation {
                                        if contentViewModel.selectedHead == item {
                                            contentViewModel.selectedHead = nil
                                        } else {
                                            contentViewModel.selectedHead = item
                                        }
                                    }
                                }
                                // Görsele tıklanıldığında scaleEffect ekleniyor
                                .scaleEffect(contentViewModel.selectedHead == item ? 1.2 : 1.0)
                        }
                    })
                }
            } header: {
                // Bölüm başlığı
                Text("Choose Head")
            }
            // Vücut seçimini içeren bölüm
            Section {
                ScrollView(.horizontal) {
                    LazyHStack(content: {
                        // Başlık seçeneklerini yatay olarak gösteren ScrollView
                        ForEach(ImageBody.allCases) { item in
                            // Her başlık için özel görüntü görüntüleyici
                            CustomImageView(imagePath: item.rawValue)
                                .frame(width: 100, height: 100)
                                .padding()
                                // Tıklama animasyonu ekleniyor
                                .onTapGesture {
                                    withAnimation {
                                        if contentViewModel.selectedBody == item {
                                            contentViewModel.selectedBody = nil
                                        } else {
                                            contentViewModel.selectedBody = item
                                        }
                                    }
                                }
                                // Görsele tıklanıldığında scaleEffect ekleniyor
                                .scaleEffect(contentViewModel.selectedBody == item ? 1.2 : 1.0)
                        }

                    })
                }
            } header: {
                // Bölüm başlığı
                Text("Choose Body")
                Spacer()
            }
            // Bacak seçimini içeren bölüm
            Section {
                ScrollView(.horizontal) {
                    LazyHStack(content: {
                        // Bacak seçeneklerini yatay olarak gösteren ScrollView
                        // Başlık seçeneklerini yatay olarak gösteren ScrollView
                        ForEach(ImageLeg.allCases) { item in
                            // Her başlık için özel görüntü görüntüleyici
                            CustomImageView(imagePath: item.rawValue)
                                .frame(width: 100, height: 100)
                                .padding()
                                // Tıklama animasyonu ekleniyor
                                .onTapGesture {
                                    withAnimation {
                                        if contentViewModel.selectedLeg == item {
                                            contentViewModel.selectedLeg = nil
                                        } else {
                                            contentViewModel.selectedLeg = item
                                        }
                                    }
                                }
                                // Görsele tıklanıldığında scaleEffect ekleniyor
                                .scaleEffect(contentViewModel.selectedLeg == item ? 1.2 : 1.0)
                        }

                    })
                }
            } header: {
                // Bölüm başlığı
                Text("Choose Leg")
                Spacer()
            }
            // Özel kullanıcı görünümünü gösteren düğme
            HStack {
                Spacer()
                Button("Show Custom User") {
                    contentViewModel.showCustomUserView.toggle()
                }
                // Özel kullanıcı görünümü sayfasını gösteren sheet
                .sheet(
                    isPresented: $contentViewModel.showCustomUserView,
                    onDismiss: {
                        contentViewModel.clearProperties()
                    },
                    content: {
                        CustomUserView(
                            headImage: $contentViewModel.selectedHead,
                            bodyImage: $contentViewModel.selectedBody,
                            legImage: $contentViewModel.selectedLeg)
                    })
                Spacer()
            }
        }
    }
}

#Preview {
    // Görünümün önizlemesi
    ContentView()
}
