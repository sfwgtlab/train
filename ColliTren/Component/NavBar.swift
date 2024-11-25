//
//  NavBar.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 13/10/24.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        VStack{
            ZStack{
                Image(.backBanner)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height * 0.08)
                VStack{
                    HStack{
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                        Image(.logoH)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.2, height:UIScreen.main.bounds.height * 0.08)
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    NavBar()
}
