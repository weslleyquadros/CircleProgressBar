//
//  ViewController.swift
//  CircleProgressBar
//
//  Created by Weslley Tavares de Aguiar e Quadros on 07/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet var circleProgressBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addButton.layer.cornerRadius = 15
        infoButton.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
        
        if let progressBar = Bundle.main.loadNibNamed("CircleProgressBarView", owner: self, options: nil)?.first as? CircleProgressBarView {

            progressBar.setupProgress()
            progressBar.animationProgress(percente: 0.4)
            circleProgressBarView.addSubview(progressBar)
        }
    }
    
    @objc func handleInfo() {
        
        let messageText = " Saldo alocado é o valor que você reserva da sua conta PagBank para investir em ações, fundo imobiliário, e outros produtos da bolsa (B3).\n\n Esse saldo será utilizado em todas as transações (compra e venda) de produtos na bolsa."
        
        let alert = UIAlertController(title: "Saldo alocado", message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Voltar", style: UIAlertAction.Style.cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
