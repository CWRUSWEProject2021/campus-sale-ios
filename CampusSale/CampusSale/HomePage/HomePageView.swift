////
////  HomePageView.swift
////  CampusSale
////
////  Created by Eric Chang on 10/17/21.
////
//
//
//import SwiftUI
//
//struct HomePageView: View {
//    let places: [Place]
//    @State private var selection: Set<Place> = []
//    @State var selectedIndex = 0
//    let icons = [
//        "house",
//        "list.bullet",
//        "person",
//    ]
//    
//    @State var searchText: String
//    @State private var addMode = false
//    var body: some View {
//    
//        VStack{
//                ZStack{
//                switch selectedIndex {
//                case 0:
//                    VStack {
//                        SearchBar(text1: $searchText)
//                        List(places.filter({ searchText.isEmpty ? true : $0.eventName.contains(searchText) })) { item in NavigationLink(item.eventName, destination: ItemListingView())}
//                        Spacer()
//                    }
//                    .navigationTitle("Items")
//                case 1:
//                    VStack {
//                        NavigationLink(destination:
//                                        CreateEventView()){
//                            Image(systemName: "plus")
//                                                .resizable()
//                                                .padding(6)
//                                                .frame(width: 24, height: 24)
//                                                .background(Color.blue)
//                                                .clipShape(Circle())
//                                                .foregroundColor(.white)
//                    }
//                        Text("Your Items")
//                        Spacer()
//                    }
//                    .navigationTitle("Your items")
//                    
//                
//                default:
//                    VStack {
//                        Text("Profile")
//                        Spacer()
//                    }
//                    .navigationTitle("Profile")
//                    
//                }
//            }
//            HStack{
//                ForEach(0..<3, id: \.self) { number in
//                    Spacer()
//                    Button(action: {
//                        self.selectedIndex = number
//                    }, label: {
//                        Image(systemName: icons[number])
//                            .font(.system(
//                                    size: 25,
//                                    weight: .regular,
//                                    design: .default))
//                            .foregroundColor(selectedIndex == number ? .black : Color(UIColor.lightGray))
//                    })
//                    Spacer()
//                }
//            }
//        }
//    }
//    
//    var list: some View {
//        List(places) { place in
//            PlaceView(place: place, isExpanded: self.selection.contains(place))
//                .onTapGesture { self.selectDeselect(place) }
//                .animation(.linear(duration: 0.3))
//        }
//    }
//    
//    var scrollForEach: some View {
//        ScrollView {
//            ForEach(places) { place in
//                PlaceView(place: place, isExpanded: self.selection.contains(place))
//                    .modifier(ListRowModifier())
//                    .onTapGesture { self.selectDeselect(place) }
//                    .animation(.linear(duration: 0.3))
//            }
//        }
//    }
//    
//    private func selectDeselect(_ place: Place) {
//        if selection.contains(place) {
//            selection.remove(place)
//        } else {
//            selection.insert(place)
//        }
//    }
//    
//}
//
//struct ListRowModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        Group {
//            content
//            Divider()
//        }.padding(.vertical).frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct PlacesList_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePageView(places: Place.samples(), searchText: "")
//    }
//}
