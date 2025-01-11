//
//  HomeViewModel.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 24/11/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var loading = false
    @Published var routesImages = ["routTrain", "routeEco", "routeReserve", "routeCulture"]
    @Published var trainImages = ["trenRegular", "trenRestaurante" , "TrenLargaDistancia"]
    @Published var trainDesc = [
        "Su nombre proviene de la palabra maya Xiinbal que significa viaje o paseo, este es el tren estándar de servicio que brinda a los usuarios un recorrido agradable y tranquilo. Es un modelo confiable y fácil de utilizar, diseñado con ventanas panorámicas que permiten a los visitantes disfrutar de los verdes paisajes del sureste.",
        "Su nombre proviene de la palabra maya Janal que significa comer. Es un tren para los amantes de la gastronomía y el turismo. Este modelo es una verdadera experiencia culinaria en movimiento.",
        "Su nombre proviene de la palabra maya P'atal que significa estadía o permanecer, es un tren diseñado para recorrer largas distancias, permite viajar en confortables asientos reclinables o en camarotes donde te podrás relajar hasta tu destino. Disfruta de una experiencia armónica inspirada en la cultura Maya."]
    
}
