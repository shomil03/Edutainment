//
//  ContentView.swift
//  Edutainment
//
//  Created by Shomil Singh on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var limit = 10
    @State private var nums1 = Int.random(in: 0...10)
    @State private var nums2 = Int.random(in: 0...10)
   
    @State private var correct_ans : Int = 0

    @State private var option1 = Int.random(in: 0...10)
    @State private var option2 = Int.random(in: 0...10)
    @State private var option3 = Int.random(in: 0...10)
    
    @State private var options :[Int] = [1,2,4,5]
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    
    
   
    
    
   
    
    var body: some View {
        VStack {
            NavigationStack{
                Form{
                    Section{
                        Text("Select Range of Multiplication")
                            .font(.headline)
                        Stepper("\(limit) ", value: $limit, in: 2...20,step: 1)
                    }.onChange(of: limit){ newvalue in
                        createNumbers(limit: newvalue)
                    }
                
                    Section{
                        Text("Multiplication of \(nums1) and \(nums2) :")
                        VStack{
                            HStack{
                                Button("\(options[0])"){
                                    check_input(number: options[0])
                                    
                                }
                                Button("\(options[1])"){
                                    check_input(number: options[1])
                                }
                                
                            
                            }
                            HStack{
                                Button("\(options[2])"){
                                    check_input(number: options[2])
                                    
                                }
                                Button("\(options[3])"){
                                    check_input(number: options[3])
                                    
                                }
                                    
                                
                            }
                        
                        }
                        
                        
                    }
                    Section{
                        Text("Correct ans : \(correct_ans)")
                    }
                    
                }
//                .onAppear(perform:generate_options)
                .alert(alertTitle, isPresented: $showingAlert){
                    Button("Continue"){
                        createNumbers(limit: limit)
                    }
                    
                    
                }message: {
                    Text(alertMessage)
                }
                
            }
            
        }
    }
    func check_input(number : Int){
        if(number == correct_ans){
            alertTitle = "You got it Correct"
            alertMessage = "Keep it up!"
            
            
            // some code
        }
        else{
            alertTitle="Wrong Answer"
            alertMessage = "\(nums1) X \(nums2) = \(correct_ans) -> \(number)"
            // some code
        }
        showingAlert = true
    }
    func generate_options(){
        options.removeAll()
        correct_ans=nums1*nums2
        options.append(option1)
        options.append(option2)
        options.append(option3)
        options.append(correct_ans)
        options.shuffle()
        
        
    }
    func createNumbers(limit:Int){
        nums1 = Int.random(in: 0...limit)
        nums2 = Int.random(in: 0...limit)
        correct_ans=nums1*nums2
        var temp = option1
        while(option1 == correct_ans || temp == option1){
            option1 = Int.random(in: 0...limit*limit)
        }
        temp = option2
        while(option2 == correct_ans || option2 == option1 || temp == option2){
            option2 = Int.random(in: 0...limit*limit)
        }
        temp = option3
        while(option3 == correct_ans || option3 == option2 || option1 == option3) || temp == option3{
            option3 = Int.random(in: 0...limit*limit)
        }
        generate_options()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
