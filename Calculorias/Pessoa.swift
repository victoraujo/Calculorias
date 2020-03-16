//
//  Pessoa.swift
//  Calculorias
//
//  Created by Victor de Araujo Vieira on 10/03/20.
//  Copyright © 2020 Victor de Araujo Vieira. All rights reserved.
//

import Foundation

class Pessoa {
    var peso : Float
    var idade : Float
    var sexo: String
    var meta: Float
    
    init(peso: Float, idade: Float, sexo: String, meta: Float) {
        self.peso = peso
        self.idade = idade
        self.sexo = sexo
        self.meta = meta
    }
    
    func calcularMetabolismo() -> Float{
        //Calcular o metabolismo basal
        var fator: Float = 0
        var somador: Float = 0
        var resultado: Float = 0
        
        if sexo=="m"{
            if idade<3 {
                fator = 60.9
                somador = -54
            }
            else if idade>=3,idade<10 {
                fator = 22.7
                somador = 495
            }
            else if idade>=10,idade<18 {
                fator = 17.5
                somador = 651
            }
            else if idade>=18,idade<30 {
                fator = 15.3
                somador = 679
            }
            else if idade>=30,idade<60 {
                fator = 11.6
                somador = 879
            }
            else if idade>=60 {
                fator = 13.5
                somador = 487
            }
        }
        else{
            if idade<3 {
                fator = 61
                somador = -51
            }
            else if idade>=3,idade<10 {
                fator = 22.5
                somador = 499
            }
            else if idade>=10,idade<18 {
                fator = 12.2
                somador = 746
            }
            else if idade>=18,idade<30 {
                fator = 14.7
                somador = 496
            }
            else if idade>=30,idade<60 {
                fator = 8.7
                somador = 829
            }
            else if idade>=60 {
                fator = 10.5
                somador = 596
            }
        }
        
        
        resultado = (fator * peso) + somador
        
        return resultado
    }
    
}
