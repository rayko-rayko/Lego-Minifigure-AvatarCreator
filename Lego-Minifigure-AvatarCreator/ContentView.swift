import SwiftUI

enum ImageHead: String, CaseIterable, Identifiable {
    case smile = "head-0"
    case smileWithEyebrow = "head-1"
    case happy = "head-2"
    case sad = "head-3"
    case verySad = "head-4"
    case shocked = "head-5"

    var id: ImageHead { self }
}

enum ImageBody: String, CaseIterable, Identifiable {
    case black = "body-0"
    case brown = "body-1"
    case red = "body-2"

    var id: ImageBody { self }
}

enum ImageLeg: String, CaseIterable, Identifiable {
    case blue = "leg-0"
    case grey = "leg-1"
    case black = "leg-2"

    var id: ImageLeg { self }
}

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
                                Text("Selected Head: \(userSelectedHead?.rawValue ?? "None")")
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
                            Text("Selected Head: \(userSelectedHead?.rawValue ?? "None")")
                            Text("Selected Body: \(userSelectedBody?.rawValue ?? "None")")
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
                            Text("Selected Head: \(userSelectedHead?.rawValue ?? "None")")
                            Text("Selected Body: \(userSelectedBody?.rawValue ?? "None")")
                            Text("Selected Leg: \(leg.rawValue)")
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
          Text("Selected Leg: \(selectedLeg.rawValue)")

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
