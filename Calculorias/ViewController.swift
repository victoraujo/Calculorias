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
        //        cell.tintColor = UIColor(red: 241, green: 206, blue: 159, alpha: 1.0)
        cell.backgroundColor = botoesAdicionar.backgroundColor
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
        //        if component==0{
        //            escolhas[0] = row+1
        //        }
        //        else if component==1 {
        //            escol = unidades[row]
        //        }
        //        else if component==2 {
        //            tipoEscolhido = tipo[row]
        //        }
        escolhas[component] = row
        
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
        //        tabv.backgroundColor =
        //        var escolhas: [Int] = [0,0,0]
        //        cadastrarComidas()
        //        cadastrarBebidas()
        //        cadastrarExercicios()
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
    
    
    
    let bebidas = ["Suco","Refri","Café","Leite","Achocolatado","Cerveja","Chá"]
    let unidadesDeBebida = ["Copos","ml","Litros","Calorias"]
    let comidas = ["Feijão","Arroz","Macarrão","Purê","Cuscuz","Banana","Maçã","Pão","Queijo","Presunto","Carne","Frango"]
    let unidadesDeComida = ["Colheres","Gramas","Calorias","Unidades","Fatias"]
    let exercicios = ["Corrida","Bike","Natação","Corda"]
    let unidadesExercicios = ["Minutos","Horas","Calorias","Repetições"]
    var unidades:[String] = []
    var tipo:[String] = []
    var cadastroFeito = false
    var rotina: [String] = []
    var adicionarRotina = ""
    var quantidadeEscolhida = ""
    var unidadeEscolhida = ""
    var tipoEscolhido = ""
    var escolhas: [Int] = [0,0,0]
    var i: Int = 0
    var caloriasConsumidas: Float = 0
    var caloriasGastas: Float = 0
    
    
    
    
    @IBAction func clicouAdicionar() {
        var caloriaDoItem: Float = 0
        
        quantidadeEscolhida = String(escolhas[0] + 1)
        unidadeEscolhida = unidades[escolhas[1]]
        tipoEscolhido = tipo[escolhas[2]]
        
        rotina.append(quantidadeEscolhida + " " + unidadeEscolhida + " de " + tipoEscolhido)
        tabv.reloadData()
        adicionarPicker.isHidden = true
        pickerDisplay.isHidden = true
        
        caloriaDoItem = calcularCaloriasDoItem(quantidade: Float(quantidadeEscolhida)!, unidade: unidadeEscolhida, tipo: tipoEscolhido)
        if caloriaDoItem>0{
            caloriasConsumidas+=caloriaDoItem
        }
        if caloriaDoItem<0{
            caloriasGastas-=caloriaDoItem
        }
        
        print(caloriasConsumidas)
        
        labelCaloriasConsumidas.text = String(Int(caloriasConsumidas)) + " Cal Consumidas"
        labelCaloriasGastas.text = String(Int(caloriasGastas)) + " Cal Gastas"
        
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
        if escolhas[1]>=unidades.count{
            escolhas[1]=0
        }
        if escolhas[2]>=tipo.count{
            escolhas[2]=0
        }
        pickerDisplay.dataSource = self
        pickerDisplay.delegate = self
        
    }
    
    
    
    @IBOutlet var botoesAdicionar: UIButton!
    @IBOutlet var totalCalorias: UILabel!
    @IBOutlet var labelUnidadePeso: UILabel!
    @IBOutlet var labelUnidadeIdade: UILabel!
    @IBOutlet var labelUnidadeMeta: UILabel!
    @IBOutlet var labelCaloriasConsumidas: UILabel!
    @IBOutlet var labelCaloriasGastas: UILabel!
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
    
    
    //    func cadastrarComidas(){
    let feijao: Comida = Comida(colher: 10, grama: 0.736, unidade: 0, fatia: 0)
    let arroz: Comida = Comida(colher: 32, grama: 1.29, unidade: 0, fatia: 0)
    let macarrao: Comida = Comida(colher: 12.86, grama: 0.83, unidade: 0, fatia: 0)
    let pao: Comida = Comida(colher: 0, grama: 0, unidade: 137, fatia: 0)
    let pure: Comida = Comida(colher: 32, grama: 13.13, unidade: 0, fatia: 0)
    let banana: Comida = Comida(colher: 0, grama: 0.89, unidade: 105, fatia: 0)
    let queijo: Comida = Comida(colher: 0, grama: 3.07, unidade: 0, fatia: 86)
    let presunto: Comida = Comida(colher: 0, grama: 0.825, unidade: 0, fatia: 33)
    let maca: Comida = Comida(colher: 0, grama: 0.52, unidade: 72, fatia: 0)
    let cuscuz: Comida = Comida(colher: 7, grama: 1.12, unidade: 0, fatia: 0)
    let carne: Comida = Comida(colher: 0, grama: 2.87, unidade: 244, fatia: 0)
    let frango: Comida = Comida(colher: 0, grama: 1.95, unidade: 195, fatia: 27)
    //    }
    
    //    func cadastrarBebidas(){
    let refrigerante: Bebida = Bebida(ml: 0.43)
    let suco: Bebida = Bebida(ml: 0.25)
    let cafe: Bebida = Bebida(ml: 0.12)
    let leite: Bebida = Bebida(ml: 0.6)
    let achocolatado: Bebida = Bebida(ml: 0.8)
    let cerveja: Bebida = Bebida(ml: 0.43)
    let cha: Bebida = Bebida(ml: 0.02)
    //    }
    //
    //    func cadastrarExercicios(){
    var corrida: Exercicio = Exercicio(minuto: 0, repeticao: 0)
    let bike: Exercicio = Exercicio(minuto: 5, repeticao: 0)
    let natacao: Exercicio = Exercicio(minuto: 10, repeticao: 0)
    let corda: Exercicio = Exercicio(minuto: 10, repeticao: 0)
    //    }
    
    
    func calcularCaloriasDoItem(quantidade: Float,unidade: String,tipo: String)->Float {
        if(tipo=="Feijão"){
            return feijao.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Arroz"){
            return arroz.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Macarrão"){
            return macarrao.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Pão"){
            return pao.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Purê"){
            return pure.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Banana"){
            return banana.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Queijo"){
            return queijo.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Presunto"){
            return presunto.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Maçã"){
            return maca.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Cuscuz"){
            return cuscuz.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Carne"){
            return carne.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Frango"){
            return frango.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
            
        else if(tipo=="Suco"){
            return suco.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Refri"){
            return refrigerante.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Café"){
            return cafe.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Leite"){
            return leite.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Achocolatado"){
            return achocolatado.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Cerveja"){
            return cerveja.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Chá"){
            return cha.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Corrida"){
            corrida.calcularComPeso(peso: usuario.peso)
            return corrida.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Bike"){
            return bike.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Natação"){
            return natacao.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
        else if(tipo=="Corda"){
            return corda.calcularCalorias(quantidade: quantidade, unidade: unidade)
        }
            
            
            
            
        else {
            return 0
        }
        
    }
    func mostrarResultado(){
        //Esconder o que foi adicionado no display
        //Mostrar o resultado calculado no display
    }
    
    func recomecar(){
        
    }
    
    
}
