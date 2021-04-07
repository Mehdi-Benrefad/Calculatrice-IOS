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
        if(validerInput()){
            let expression=NSExpression(format: op.replacingOccurrences(of: "%", with:""))
            let resultatfinal=expression.expressionValue(with: nil, context: nil) as!Double
            let resultatformate=formate_resultat(val:resultatfinal)
            Resultat.text=resultatformate
        }else
        {
            clear()
        }
    }
    
    func formate_resultat(val:Double)->String{
        if(val.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f", val)
            
        }else{
            return String(format: "%.2f" ,val)        }

    }
    
    
    func validerInput() ->Bool
    {
        var count = 0
        var indices = [Int]()
        
        for char in op
        {
            if(est_il_operateur(char:char))
            {
                indices.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for indice in indices
        {
            if(indice == 0)
            {
                return false
            }
            
            if(indice == op.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(indice - previous == 1)
                {
                    return false
                }
            }
            previous = indice
        }
        
        return true
    }
    
    
    
    func est_il_operateur (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
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

