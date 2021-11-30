//
//  SwiftUIView.swift
//  CampusSale
//
//  Created by Eric Chang on 11/29/21.
//

import SwiftUI

struct ItemRow: View {
    @State var item: Product
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                Color("ListRowColor")
                NavigationLink(destination: ItemListingView(item: item)) { EmptyView() }
                .buttonStyle(PlainButtonStyle())
                .opacity(0.0)
                VStack {
                    Text("penis")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("FontColor"))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("pussy")
                        .font(.body)
                        .foregroundColor(Color("FontColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //                if let url: String = event.imageURL {
                    //                    AsyncImage(url: URL(string: url)) { image in
                    //                        image
                    //                            .resizable()
                    //                            .scaledToFit()
                    //                    } placeholder: {
                    //                        ProgressView()
                    //                    }
                    //                } else {
                    //                    Image("SampleImage")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                }
                    //               if let img: UIImage = controller.eventImages[event] {
                    //                   Image(uiImage: img)
                    //                       .resizable()
                    //                       .scaledToFit()
                    //               } else {
//                    Image("SampleImage")
//                        .resizable()
//                        .scaledToFit()
                    // }
                    
//                    VStack {
//                        Text("penis")
//                            .font(.title2)
//                            .bold()
//                            .foregroundColor(Color("FontColor"))
//                            .fixedSize(horizontal: false, vertical: true)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        Text("pussy")
//                            .font(.body)
//                            .foregroundColor(Color("FontColor"))
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.4), radius: 6, x: 0, y: 2)
            .listRowSeparator(.hidden)
        } else {
            // Fallback on earlier versions
        }
    }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
