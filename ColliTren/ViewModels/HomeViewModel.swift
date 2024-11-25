//
//  HomeViewModel.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 24/11/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var loading = false
    @Published var Images = ["routTrain", "routeEco", "routeReserve", "routeCulture"]
    
}
