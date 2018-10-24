//
//  ViewController.swift
//  Clima
//
//  Created by Alumno on 18/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    let URLClima = "https://free.currencyconverterapi.com/api/v6/convert?q=USD_MXN&compact=y"
    
    
    @IBOutlet weak var lblGrados: UILabel!
    @IBOutlet weak var aiCargarClima: UIActivityIndicatorView!
    
    @IBOutlet weak var doTapActualizarClima: UIButton!
    @IBAction func doTapActualizarClima(_ sender: Any) {
        
        lblGrados.text = "-"
        aiCargarClima.startAnimating()
        
        Alamofire.request(URLClima).responseJSON { response in
            //Aquì te regresa todo los datos crudos como tal (Codigo JSON)
            if let dictRespuesta = response.result.value as? NSDictionary{
                
                if let dictMain = dictRespuesta.value(forKey: "USD_MXN") as? NSDictionary{
                    
                    if let val = dictMain.value(forKey: "val") as? Double {
                        
                        self.lblGrados.text = "\(val) peso"
                        self.aiCargarClima.stopAnimating()
                    }
                    
                }
                
            }else{
                
                //Avisarle al usuario que no se pudo leer la respuesta
            }
            
            
        }
        
        
        
    }
    
    
    
      
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        aiCargarClima.startAnimating()
        
        
        
        
        Alamofire.request(URLClima).responseJSON { response in
            //Aquì te regresa todo los datos crudos como tal (Codigo JSON)
            if let dictRespuesta = response.result.value as? NSDictionary{
                
                if let dictMain = dictRespuesta.value(forKey: "USD_MXN") as? NSDictionary{
                    
                    if let val = dictMain.value(forKey: "val") as? Double {
                        
                        self.lblGrados.text = "\(val) Peso"
                        self.aiCargarClima.stopAnimating()
                    }
                    
                }
                
            }else{
                
                //Avisarle al usuario que no se pudo leer la respuesta
            }
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

