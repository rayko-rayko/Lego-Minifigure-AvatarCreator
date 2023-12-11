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
                                // Başlığa tıklandığında seçilen başlığı güncelle
                                .onTapGesture {
                                    contentViewModel.selectedHead = item
                                }
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
                        // Vücut seçeneklerini yatay olarak gösteren ScrollView
                        ForEach(ImageBody.allCases) { item in
                            // Her vücut için özel görüntü görüntüleyici
                            CustomImageView(imagePath: item.rawValue)
                                .frame(width: 100, height: 100)
                                .padding()
                                // Vücuda tıklandığında seçilen vücudu güncelle
                                .onTapGesture {
                                    contentViewModel.selectedBody = item
                                }
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
                        ForEach(ImageLeg.allCases) { item in
                            // Her bacak için özel görüntü görüntüleyici
                            CustomImageView(imagePath: item.rawValue)
                                .frame(width: 100, height: 100)
                                .padding()
                                // Bacağa tıklandığında seçilen bacağı güncelle
                                .onTapGesture {
                                    contentViewModel.selectedLeg = item
                                }
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
        } //: Form
    } //: Body
}

#Preview {
    // Görünümün önizlemesi
    ContentView()
}



/*
import SwiftUI

struct SelectionImageView: View {
    var image: String

    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
    }
}

struct ContentView: View {
    @State private var userSelectedHead: ImageHead?
    @State private var userSelectedBody: ImageBody?
    @State private var userSelectedLeg: ImageLeg?

    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(ImageHead.allCases, id: \.self) { head in
                        NavigationLink(destination: BodySelectionView(userSelectedHead: $userSelectedHead, userSelectedBody: $userSelectedBody, userSelectedLeg: $userSelectedLeg)) {
                            VStack {
                                SelectionImageView(image: head.rawValue)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Select Head")
        }
    }
}

struct BodySelectionView: View {
    @Binding var userSelectedHead: ImageHead?
    @Binding var userSelectedBody: ImageBody?
    @Binding var userSelectedLeg: ImageLeg?

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(ImageBody.allCases, id: \.self) { body in
                    NavigationLink(destination: LegSelectionView(userSelectedHead: $userSelectedHead, userSelectedBody: $userSelectedBody, userSelectedLeg: $userSelectedLeg)) {
                        VStack {
                            SelectionImageView(image: body.rawValue)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Select Body")
    }
}

struct LegSelectionView: View {
    @Binding var userSelectedHead: ImageHead?
    @Binding var userSelectedBody: ImageBody?
    @Binding var userSelectedLeg: ImageLeg?

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(ImageLeg.allCases, id: \.self) { leg in
                    NavigationLink(destination: FinalSelectionView(userSelectedHead: $userSelectedHead, userSelectedBody: $userSelectedBody, userSelectedLeg: $userSelectedLeg, selectedLeg: leg)) {
                        VStack {
                            SelectionImageView(image: leg.rawValue)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Select Leg")
    }
}

struct FinalSelectionView: View {
    @Binding var userSelectedHead: ImageHead?
    @Binding var userSelectedBody: ImageBody?
    @Binding var userSelectedLeg: ImageLeg?
    var selectedLeg: ImageLeg

    var body: some View {
        VStack {
          if let head = userSelectedHead {
            SelectionImageView(image: head.rawValue)
            Text("Selected Head: \(head.rawValue)")
          } else {
            Text("Default Head Image")
          }

          if let body = userSelectedBody {
            SelectionImageView(image: body.rawValue)
            Text("Selected Body: \(body.rawValue)")
          } else {
            Text("Default Body Image")
          }

          SelectionImageView(image: selectedLeg.rawValue)

          Spacer()
        }
        .navigationTitle("Final Selection")
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
