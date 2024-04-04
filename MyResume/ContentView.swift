//
//  ContentView.swift
//  MyResume
//
//  Created by Chris on 2024/4/3.
//

import SwiftUI

struct ContentView: View {
    
    let me = Resume.shared
    @State var isShowingContact = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack(spacing: 15) {
                    Image("avatar")
                        .resizable().aspectRatio(0.9, contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200)
                    VStack(spacing: 20) {
                        Text(me.name)
                            .font(.title).bold()
                        Text(me.title)
                            .font(.title3)
                        Label(me.location, systemImage: "location.fill").foregroundColor(.secondary)
                    }
                }
                
                Text(me.bio).font(.title3).lineSpacing(10)
                
                
                Button {
                    isShowingContact = true
                    
                    
                } label: {
                    Text("與我連絡")
                        .font(.title2.weight(.medium))
                        .foregroundStyle(.white)
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20)).foregroundColor(.secondary)
                }
                
               
                
                Text("Skills").bold().font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                HStack {
                    ForEach(me.skills, id: \.self) { skill in
                        VStack {
                            Image(skill.lowercased()).resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            Text(skill)
                        }.frame(width: 80)
                    }
                    
                }
                
                Text("Experience").bold().font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 0) {
                    ForEach(me.experiences.indices, id: \.self) { index in
                        
                        HStack {
                            
                            DotLineShape(lineWidth: 2, dotSize: 10, style: index == 0 ? .bottomHalf : index == me.experiences.count - 1 ? .topHalf: .full)
                                .frame(width: 70)
                                .foregroundColor(.secondary)
                            
                            let exp = me.experiences[index]
                            
                            VStack(spacing: 8) {
                                Group {
                                    Text("\(exp.start) - \(exp.end)")
                                        .foregroundColor(.secondary)
                                    Text(exp.title).bold()
                                    Text(exp.company).padding(.bottom, 30)
                                }.frame(maxWidth: .infinity, alignment: .leading)
                               
                            }
                        }
                        
                        
                        
                    }
                }
                
                
            }
            .padding()
            .overlay(Color.black.opacity(isShowingContact ? 0.5 : 0))
                .overlay(alignment: .top){
                    Group {
                        if(isShowingContact) {
                            ContactView(isShowing: $isShowingContact)
                                .offset(y: UIScreen.main.bounds.maxY * 0.32)
                                .transition(.slide)
                        }
                    }.animation(.spring(), value: isShowingContact)
                   
                    
                }
        }.background(Color(uiColor: .secondarySystemBackground))
        
        
        
    }
}

#Preview {
    ContentView()
}
