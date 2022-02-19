//
//  ViewController.swift
//  touch-effect
//
//  Created by 이정우 on 2022/02/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actionView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addNewView(to: actionView, x: touches.first!.location(in: actionView).x, y: touches.first!.location(in: actionView).y)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        addNewView(to: actionView, x: touches.first!.location(in: actionView).x, y: touches.first!.location(in: actionView).y)
    }
    
    func addNewView(to container: UIView, x : CGFloat, y : CGFloat) {

        let newView = UIView()
        container.addSubview(newView)
        
        newView.layer.borderWidth = 1
        newView.layer.borderColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: 1).cgColor
        newView.backgroundColor = .clear
        

        newView.frame = CGRect(x: x - 25, y: y - 25, width: 50, height: 50)
        
        newView.layer.masksToBounds = true
        newView.layer.cornerRadius = 25
        
        actionAnimation(view: newView)
    }
    
    func actionAnimation(view : UIView){
        let randomBool = Bool.random()
        let randomXArray = [0,Int(actionView.frame.maxX-50)]
        let randomYArray = [0,Int(actionView.frame.maxY-50)]
        
        var randomX = 0
        var randomY = 0
        
        if randomBool == true{
            randomX = randomXArray.randomElement()!
            randomY = Int.random(in: 0...Int(actionView.frame.maxY-50))
        }else{
            randomY = randomYArray.randomElement()!
            randomX = Int.random(in: 0...Int(actionView.frame.maxX-50))
        }
        
        
        UIView.animate(withDuration: 1, animations: {
            view.frame = CGRect(x: randomX, y: randomY, width: 50, height: 50)
        })
    }
    
    


}

