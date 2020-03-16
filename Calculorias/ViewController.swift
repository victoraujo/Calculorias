//
//  ViewController.swift
//  Calculorias
//
//  Created by Victor de Araujo Vieira on 02/03/20.
//  Copyright © 2020 Victor de Araujo Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rotina.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tabv.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.text = rotina[indexPath.row]
        return cell
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==2{
            return tipo[row]
        }
        else if component==0{
            return String(row+1)
        }
        else {
            return unidades[row]
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component==0{
            quantidadeEscolhida = String(row+1)
        }
        else if component==1 {
            unidadeEscolhida = unidades[row]
        }
        else if component==2 {
            tipoEscolhido = tipo[row]
        }
        
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==2 {return tipo.count}
        else if component==1{return unidades.count}
        return 5000
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerDisplay.dataSource = self
        pickerDisplay.delegate = self
        tabv.dataSource = self
        tabv.delegate = self
    }
    @IBOutlet var pickerDisplay: UIPickerView!
    @IBOutlet var botaoIsMale: UIButton!
    @IBOutlet var botaoIsFemale: UIButton!
    @IBOutlet var comida: UIButton!
    @IBOutlet var bebida: UIButton!
    @IBOutlet var exercicio: UIButton!
    @IBOutlet var botaoMale: UIButton!
    @IBOutlet var botaoFemale: UIButton!
    @IBOutlet var tabv: UITableView!
    @IBOutlet var adicionarPicker: UIButton!
    
    
    
    
    let bebidas = ["Suco","Refri","Café","Leite",]
    let unidadesDeBebida = ["Copos","ml","Litros","Calorias"]
    let comidas = ["Feijão","Arroz","Macarrão","Purê","Cuscuz","Banana","Maçã","Feijão","Feijão","Feijão"]
    let unidadesDeComida = ["Colheres","Gramas","Calorias","Unidades"]
    let exercicios = ["Corrida","Bike","Natação","Corda"]
    let unidadesExercicios = ["Minutos","Horas","Calorias"]
    var unidades:[String] = []
    var tipo:[String] = []
    var cadastroFeito = false
    var rotina: [String] = []
    var adicionarRotina = ""
    var quantidadeEscolhida = ""
    var unidadeEscolhida = ""
    var tipoEscolhido = ""
    
    
    
    @IBAction func clicouAdicionar() {
        rotina.append(quantidadeEscolhida + " " + unidadeEscolhida + " de " + tipoEscolhido)
        tabv.reloadData()
        adicionarPicker.isHidden = true
        pickerDisplay.isHidden = true
        
    }
    
    
    @IBAction func botaoSexo(_ sender: UIButton) {
        if sender == botaoMale{
            botaoIsMale.isHidden=false
            botaoIsFemale.isHidden=true
        }
        if sender == botaoFemale{
            botaoIsMale.isHidden=true
            botaoIsFemale.isHidden=false
        }

    }
    
    
    
    @IBAction func adicionar(_ sender: UIButton) {
        pickerDisplay.isHidden = false
        adicionarPicker.isHidden = false
        if sender==comida{
            tipo = comidas
            unidades=unidadesDeComida
        }
        else if sender==exercicio{
            tipo = exercicios
            unidades = unidadesExercicios
        }
        else {
            if sender==bebida{
                tipo = bebidas
                unidades = unidadesDeBebida
            }
            
        }
        pickerDisplay.dataSource = self
        pickerDisplay.delegate = self
        
    }
    


    @IBOutlet var botoesAdicionar: UIButton!
    @IBOutlet var totalCalorias: UILabel!
    @IBOutlet var labelUnidadePeso: UILabel!
    @IBOutlet var labelUnidadeIdade: UILabel!
    @IBOutlet var labelUnidadeMeta: UILabel!
    @IBOutlet var labelPeso: UILabel!
    @IBOutlet var labelIdade: UILabel!
    @IBOutlet var labelMeta: UILabel!
    @IBOutlet var labelSexo: UILabel!
    @IBOutlet var peso: UITextField!
    @IBOutlet var idade: UITextField!
    @IBOutlet var meta: UITextField!
    
    
    
    var usuario : Pessoa = Pessoa(peso: 0, idade: 0, sexo: "", meta: 0)
    
//    var pesoInt: Float = 0
//    var idadeInt: Float = 0
//    var metaInt: Float = 0
//    var sexoSalvo: String = "m"
    
    
    
    @IBAction func clicarCalcular() {
        if cadastroFeito==false{
            cadastrar()
        }
    }
    
    
    
    func cadastrar(){
        //Ler o que está escrito nos textfields do cadastro
        
        usuario = Pessoa(peso: Float(peso.text!)!, idade: Float(idade.text!)!, sexo: "", meta: Float(meta.text!)!)
//        usuario.peso = Float(peso.text!)!
//        usuario.idade = Float(idade.text!)!
//        usuario.meta = Float(meta.text!)!
        
        
        if botaoIsMale.isHidden==false,botaoIsFemale.isHidden==true {
            usuario.sexo = "m"
        }
        if botaoIsFemale.isHidden==false,botaoIsMale.isHidden==true {
            usuario.sexo = "f"
        }
        
        
        let resultado: Float = usuario.calcularMetabolismo()
        totalCalorias.text = String(Int(resultado)) + " Cal"
        
        //Esconder o cadastro do display
        desabilitarCadastro()
        cadastroFeito=true
        
    }
    
    func desabilitarCadastro(){
        
        labelPeso.isHidden=true
        labelSexo.isHidden=true
        labelMeta.isHidden=true
        labelIdade.isHidden=true
        //sexo.isHidden=true
        idade.isHidden=true
        meta.isHidden=true
        peso.isHidden=true
        labelUnidadePeso.isHidden=true
        labelUnidadeIdade.isHidden=true
        labelUnidadeMeta.isHidden=true
        comida.isHidden=false
        bebida.isHidden=false
        exercicio.isHidden=false
        botoesAdicionar.isHidden=false
        botaoMale.isHidden=true
        botaoFemale.isHidden=true
        botaoIsMale.isHidden=true
        botaoIsFemale.isHidden=true
        tabv.isHidden=false
    }
    
    func adicionarComida(){
        //adicionar os 3 pickers relacionados a comida
    }
    func adicionarBebida(){
        //adicionar os 3 pickers relacionados a bebida
    }
    func adicionarExercicio(){
        //adicionar os 3 pickers relacionados a exercicio
    }
    func calcularCaloriasDoDia() {
        //Calcular quantas calorias foram consumidas no dia
    }
    func mostrarResultado(){
        //Esconder o que foi adicionado no display
        //Mostrar o resultado calculado no display
    }
    
    func recomecar(){
        
    }
    
    
}
