//
//  ViewController.swift
//  Calculatrice
//
//  Created by Mehdi Benrefad on 06/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var op:String=""
    @IBOutlet weak var Operation: UILabel!
    
    @IBOutlet weak var Resultat: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clear()
    }

    func clear(){
        op=""
        Resultat.text=""
        Operation.text=""
    }
    
    func Ajouter_a_l_operation(_ valeur:String){
        op=op+valeur
        Operation.text=op
    }
    @IBAction func ToutEffacer(_ sender: Any) {
        clear()
    }
   
    @IBAction func sup(_ sender: Any) {
        if(!op.isEmpty)
        {
            op.removeLast()
            Operation.text = op
        }    }
    
    
    
    @IBAction func modulo(_ sender: Any) {
        Ajouter_a_l_operation("%")
        
    }
    
    @IBAction func division(_ sender: Any) {
        Ajouter_a_l_operation("/")
        
    }
    
    @IBAction func multiplication(_ sender: Any) {
        Ajouter_a_l_operation("*")
        
    }
    
    @IBAction func soustraction(_ sender: Any) {
        Ajouter_a_l_operation("-")
        
    }
    @IBAction func addition(_ sender: Any) {
        Ajouter_a_l_operation("+")
        
    }
    
    
    @IBAction func egale(_ sender: Any) {
        let expression=NSExpression(format: op)
        let resultatfinal=expression.expressionValue(with: nil, context: nil) as!Double
        let resultatformate=formate_resultat(val:resultatfinal)
        Resultat.text=resultatformate    }
    
    func formate_resultat(val:Double)->String{
        if(val.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f", val)
            
        }else{
            return String(format: "%.2f" ,val)        }

    }
    

    @IBAction func zero(_ sender: Any) {
        Ajouter_a_l_operation("0")
        
    }
    @IBAction func point(_ sender: Any) {
        Ajouter_a_l_operation(".")    }
    
    
    @IBAction func un(_ sender: Any) {
        Ajouter_a_l_operation("1")
        
    }
    
    @IBAction func deux(_ sender: Any) {
        Ajouter_a_l_operation("2")
        
    }
    
    @IBAction func trois(_ sender: Any) {
        Ajouter_a_l_operation("3")
        
    }
    @IBAction func quatre(_ sender: Any) {
        Ajouter_a_l_operation("4")
    }
    
    @IBAction func cinq(_ sender: Any) {
        Ajouter_a_l_operation("5")
    }
    @IBAction func six(_ sender: Any) {
        Ajouter_a_l_operation("6")
    }
    @IBAction func sept(_ sender: Any) {
        Ajouter_a_l_operation("7")
    }
    
    @IBAction func huit(_ sender: Any) {
        Ajouter_a_l_operation("8")
    }
    @IBAction func neuf(_ sender: Any) {
        Ajouter_a_l_operation("9")
    }
}

