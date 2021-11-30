    //
    //  CreateListingView.swift
    //  CampusSale
    //
    //  Created by Eric Chang on 10/17/21.
    //

    import SwiftUI
    import CoreData

    struct CreateItemView : View {
        
        @State var showAlert = false
        @State var itemName = ""
        @State var itemDesc = ""
        @State var price = ""
        @State var keywords = ""
        @State var username: String
        
        var body: some View {
            Form{
                Section(header: Text("Item Information")){
                    TextField("Item Name", text: $itemName)
                    TextField("Item Description", text: $itemDesc)
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                                .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                    TextField("Price", text: $price)
                    TextField("Keywords", text: $keywords)
                }
                
                Button(action: {
                                self.showAlert = true
                    CSAPI().CreateItemListing(username: username, listingName: itemName, price: Float(price)!, description: itemDesc, keywords: keywords) { (info) in
                        print(info)
                    }
                            }, label: { Text("Create" )})
                .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Item Successfully Listed"),
                                dismissButton: .default(Text("Close"))
                            )
                    }
                }
                .navigationBarTitle(Text("Create Item Listing"))
            }
        
    }

    struct Ingredient{
            var id = UUID()
            var name: String
            var isSelected: Bool = false
    }
