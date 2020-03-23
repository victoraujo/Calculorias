//
//  Comida.swift
//  Calculorias
//
//  Created by Victor de Araujo Vieira on 17/03/20.
//  Copyright © 2020 Victor de Araujo Vieira. All rights reserved.
//

import Foundation


class Comida {
    let caloriasPorColher: Float
    let caloriasPorGrama: Float
    let caloriasPorUnidade: Float
    let caloriasPorFatia: Float
    var calorias: Float = 0
    
    init(colher caloriasPorColher: Float,grama caloriasPorGrama : Float,unidade caloriasPorUnidade : Float,fatia caloriasPorFatia: Float) {
        self.caloriasPorColher = caloriasPorColher
        self.caloriasPorGrama = caloriasPorGrama
        self.caloriasPorUnidade = caloriasPorUnidade
        self.caloriasPorFatia = caloriasPorFatia
        
        
    }
    
    func calcularCalorias(quantidade: Float,unidade: String) -> Float {
        if(unidade=="Colheres"){
            self.calorias = quantidade*self.caloriasPorColher
        }
        if(unidade=="Gramas"){
            self.calorias = quantidade*self.caloriasPorGrama
        }
        if(unidade=="Unidades"){
            self.calorias = quantidade*self.caloriasPorUnidade
        }
        if(unidade=="Fatias"){
            self.calorias = quantidade*self.caloriasPorFatia
        }
        return self.calorias
    }
}
