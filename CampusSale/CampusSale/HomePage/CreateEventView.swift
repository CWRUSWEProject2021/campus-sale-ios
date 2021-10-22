    //
    //  CreateListingView.swift
    //  CampusSale
    //
    //  Created by Eric Chang on 10/17/21.
    //

    import SwiftUI
    import CoreData

    struct CreateEventView : View {
        
        @State var showAlert = false
        @State var itemName = ""
        @State var itemDesc = ""
        @State var price = ""
        @State var startTime = Date()
        @State var endTime = Date()
        @State var itemType = ""
        @State var address1 = ""
        @State var address2 = ""
        @State var city = ""
        @State var state = ""
        @State var zipcode = ""
        @State var ingredients: [Ingredient] = [Ingredient(name: "Furniture"),
                                                                                                Ingredient(name: "Electronics"),
                                                                                                Ingredient(name: "Clothing"),
                                                                                                Ingredient(name: "Appliances"),
                                                    Ingredient(name: "Education"),
                                                    Ingredient(name: "Miscellaneous")
        ]
        
        
        enum EventType: String, CaseIterable, Identifiable {
                case pickup
                case dropoff

                var id: String { self.rawValue }
            }
        
        
        var body: some View {
            Form{
                Section(header: Text("Item Information")){
                    TextField("Item Name", text: $itemName)
                    TextField("Item Description", text: $itemDesc)
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                                .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
                    TextField("Price", text: $price)
                    
                    
                    Picker("EventType", selection: $itemType) {
                                            ForEach(EventType.allCases) { eventType in
                                                Text(eventType.rawValue.capitalized).tag(eventType)
                                            }
                                }.pickerStyle(SegmentedPickerStyle())
                    
                    
                    
                }
                Section(header: Text("Categories")){
                List{
                                        ForEach(0..<ingredients.count){ index in
                                                HStack {
                                                        Button(action: {
                                                                ingredients[index].isSelected = ingredients[index].isSelected ? false : true
                                                        }) {
                                                                HStack{
                                                                        if ingredients[index].isSelected {
                                                                                Image(systemName: "checkmark.circle.fill")
                                                                                        .foregroundColor(.green)
                                                                                        .animation(.easeIn)
                                                                        } else {
                                                                                Image(systemName: "circle")
                                                                                        .foregroundColor(.primary)
                                                                                        .animation(.easeOut)
                                                                        }
                                                                        Text(ingredients[index].name)
                                                                }
                                                        }.buttonStyle(BorderlessButtonStyle())
                                                }
                                        }
                                }
                }
                
                Button(action: {
                                self.showAlert = true
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



    struct CreateEvent_Previews: PreviewProvider {
        static var previews: some View {
            CreateEventView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

    struct Ingredient{
            var id = UUID()
            var name: String
            var isSelected: Bool = false
    }
