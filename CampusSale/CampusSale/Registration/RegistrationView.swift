//
//  RegistrationView.swift
//  CampusSale
//
//  Created by Eric Chang on 10/17/21.
//

import SwiftUI
import CoreData

struct RegistrationView : View {
    
    @State var showAlert = false
    
    @State private var fname = ""
    @State private var lname = ""
    @State private var username = ""
    @State private var password1 = ""
    @State private var password2 = ""
    @State private var bio = ""
    @State private var phone_number = ""
    @State private var graduation_term = ""
    @State private var on_campus = 0
    //    @State private var birthDate = Date()
    
    @State private var showingAlert = false
    @State private var selection = 0
    var alert: Alert {
        Alert(title: Text("Successfully Created Account"), message: Text(""), dismissButton: .default(Text("Dismiss")))
    }
    
    //    enum Grad_Term: Int, CaseIterable, Identifiable {
    //        case 2022;
    //        case 2023
    //        case 2024
    //        case 2025
    //        case 2026
    //
    //        var id: Int { self.rawValue }
    //    }
    
    
    
    var body: some View {
        Form{
            Section(header: Text("Account Information")){
                TextField("Username", text: $username)
                SecureField("Password", text: $password1)
                SecureField("Re-enter Password", text: $password2)
                
            }
            Section(header: Text("Profile Information")){
                TextField("First Name", text: $fname)
                TextField("Last Name", text: $lname)
                TextField("Bio", text: $bio)
                TextField("Phone Number", text: $phone_number)
                    .keyboardType(.decimalPad)
                //                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                //                                Text("Date of Birth")
                //                            }
                //                Picker("Gender", selection: $gender) {
                //                                        ForEach(Gender.allCases) { gender in
                //                                            Text(gender.rawValue.capitalized).tag(gender)
                //                                        }
                //                            }.pickerStyle(SegmentedPickerStyle())
                //                Picker("Graduation Term", selection: $graduation_term) {
                //                    ForEach(Grad_Term.allCases) { gradterm in
                //                        Text(gradterm.rawValue.capitalized).tag(gradterm)
                //                    }
                //                }
                TextField("Graduation Term", text: $graduation_term)
                
                Picker("On Campus", selection: $on_campus) {
                    Text("On Campus").tag(1)
                    Text("Off Campus").tag(0)
                }
                .pickerStyle(.segmented)
                
            }
            Section(header: Text("Preferred Method of Communication")) {
                Picker("Preferred Style of Communication", selection: $selection) {
                    Text("Text").tag(0)
                    Text("Email").tag(1)
                    Text("Call").tag(2)
                }
                .pickerStyle(.segmented)
            }
            //                Picker("Class", selection: $gender) {
            //                    ForEach(Standing.allCases) { standing in
            //                        Text(standing.rawValue.capitalized).tag(standing)
            //                    }
            //                }
            
            
            
            Button(action: {
                self.showAlert = true
                self.showingAlert = true
                
                CSAPI().registerUserRequest(username: username, password: password1, fname: fname, lname: lname, bio: bio, phone_number: Int(phone_number)!, graduation_term: Int(graduation_term)!, on_campus: on_campus) {(info) in
                    
                }
                //                CSAPI().registerProfileRequest(username: username, password: password1) {(info) in
                //
                //                }
                
            }, label: { Text("Submit" )})
            //                .alert(isPresented: $showAlert) {
            //                    Alert(
            //                        title: Text("Succesfully Submitted"),
            //                        message: Text("Verify account using email link"),
            //                        dismissButton: .default(Text("Close"))
            //                    )
            //                }
        }
        .navigationBarTitle(Text("Register"))
        .alert(isPresented: $showingAlert, content: { self.alert })
    }
    
}



struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
