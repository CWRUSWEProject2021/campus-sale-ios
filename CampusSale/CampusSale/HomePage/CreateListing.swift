//
//  CreateListing.swift
//  CampusSale
//
//  Created by Eric Chang on 10/17/21.
//

import SwiftUI
import CoreData

struct CreateEvent : View {
    
    @State var showAlert = false
    @State var itemName = ""
    @State var itemDesc = ""
    @State var startTime = Date()
    @State var endTime = Date()
    @State var itemType = ""
    @State var address1 = ""
    @State var address2 = ""
    @State var city = ""
    @State var state = ""
    @State var zipcode = ""
    
    
    enum EventType: String, CaseIterable, Identifiable {
            case open
            case RSVP
            case restricted

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
                DatePicker("Start Time", selection: $startTime, displayedComponents: [.date, .hourAndMinute])
                    
                DatePicker("End Time", selection: $endTime, displayedComponents: [.date, .hourAndMinute])
                
                Picker("EventType", selection: $itemType) {
                                        ForEach(EventType.allCases) { eventType in
                                            Text(eventType.rawValue.capitalized).tag(eventType)
                                        }
                            }.pickerStyle(SegmentedPickerStyle())
                
                
                
            }
            Section(header: Text("Seller Location")){
                TextField("Address Line 1", text: $address1)
                TextField("Address Line 2", text: $address2)
                TextField("City", text: $city)
                TextField("State", text: $state)
                TextField("Zipcode", text: $zipcode)
            }
            Button(action: {
                            self.showAlert = true
                        }, label: { Text("Submit" )})
            .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Event Successfully Created"),
                            dismissButton: .default(Text("Close"))
                        )
                }
            }
            .navigationBarTitle(Text("Create Event"))
        }
    
}



struct CreateEvent_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvent().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

