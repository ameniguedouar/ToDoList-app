//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//

import SwiftUI 

struct RegisterView: View {
 @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        VStack{
            
            HeaderView(title: "Register", subtitle: "Start your to do list", angle: -15, background: .blue)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }
                    

            }
            .offset(y: -50)
            Spacer()
            
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
