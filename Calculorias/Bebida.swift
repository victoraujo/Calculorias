//
//  Bebida.swift
//  Calculorias
//
//  Created by Victor de Araujo Vieira on 19/03/20.
//  Copyright © 2020 Victor de Araujo Vieira. All rights reserved.
//

import Foundation

class Bebida {
    let caloriasPorMl: Float
    let caloriasPorCopo: Float
    let caloriasPorLitro: Float
    var calorias : Float = 0
    
    init(ml caloriasPorMl: Float) {
        self.caloriasPorMl = caloriasPorMl
        self.caloriasPorLitro = 1000*self.caloriasPorMl
        self.caloriasPorCopo = 200*self.caloriasPorMl
    }
    
    func calcularCalorias(quantidade: Float,unidade: String) -> Float {
        if(unidade=="ml"){
            self.calorias = quantidade*self.caloriasPorMl
        }
        if(unidade=="Copos"){
            self.calorias = quantidade*self.caloriasPorCopo
        }
        if(unidade=="Litros"){
            self.calorias = quantidade*self.caloriasPorLitro
        }
        return self.calorias
    }
    
    
}
