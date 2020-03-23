//
//  Exercicio.swift
//  Calculorias
//
//  Created by Victor de Araujo Vieira on 19/03/20.
//  Copyright © 2020 Victor de Araujo Vieira. All rights reserved.
//

import Foundation

class Exercicio {
    var caloriasPorMinuto: Float
    var caloriasPorHora: Float
    var caloriasPorRepeticao: Float
    var calorias: Float = 0
    
    init(minuto caloriasPorMinuto:Float, repeticao caloriasPorRepeticao:Float) {
        self.caloriasPorMinuto = caloriasPorMinuto
        self.caloriasPorHora = 60*caloriasPorMinuto
        self.caloriasPorRepeticao = caloriasPorRepeticao
    }
    func calcularComPeso(peso: Float){
        caloriasPorMinuto = peso*0.1225
        caloriasPorHora = caloriasPorMinuto*60
    }
    func calcularCalorias(quantidade: Float,unidade: String) -> Float {
        if(unidade=="Minutos"){
            self.calorias = quantidade*self.caloriasPorMinuto
        }
        if(unidade=="Horas"){
            self.calorias = quantidade*self.caloriasPorHora
        }
        if(unidade=="Repetições"){
            self.calorias = quantidade*self.caloriasPorRepeticao
        }
        return -self.calorias
    }
}
