//
//  Home.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 26/05/24.
//

import SwiftUI

struct Home: View {
    @State var loading: Bool = false
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.blank)
                Image(.back)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                
                VStack{
                    NavBar()
                    if(loading){
                        Spacer()
                        VStack{
                            ProgressView()
                                .progressViewStyle(.circular)
                                .scaleEffect(2)
                        }
                        Spacer()
                        
                    }else{
                        ScrollView{
                            Text("Rutas del Tren Maya")
                                .font(Font.custom("Montserrat-Black", size: 25))
                                .padding(.top, 30)
                            TabView{
                                
                                ForEach(0 ..< $homeVM.routesImages.count, id: \.self){ img in
                                    Image("\(homeVM.routesImages[img])")
                                        .resizable()
                                }
                            }
                            .frame(height: 220)
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                            .tabViewStyle(PageTabViewStyle())
                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                            
                            Text("Nuestros Trenes")
                                .font(Font.custom("Montserrat-Black", size: 25))
                                .padding(.top, 30)
                            
                            TabView{
                                
                                ForEach(0 ..< $homeVM.trainImages.count, id: \.self){ img in
                                    VStack{
                                        Spacer()
                                        Image("\(homeVM.trainImages[img])")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width, height: 100)
                                        Spacer()
                                        Text("\(homeVM.trainDesc[img])")
                                            .font(Font.custom("Montserrat-Black", size: 15))
                                            .frame( alignment: .center)
                                        Spacer()
                                    }
                                   
                                }
                                
                                
                                
                            }
                            .frame(height: 280)
                            .padding(.vertical, 0)
                            .padding(.horizontal, 20)
                            .tabViewStyle(PageTabViewStyle())
                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                            
                        }
                    }
                    
                }
                
            }
        }
       
    }
}

#Preview {
    Home()
}
