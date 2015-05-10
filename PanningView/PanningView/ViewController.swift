//
//  ViewController.swift
//  PanningView
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelContainer: UIView!
    @IBOutlet weak var panGesture: UIGestureRecognizer!
    weak var labelBeingMoved: UILabel?
    
    var labels: [UILabel] = [] //NB: This creates a strong reference to the labels, watch out for memory leaks
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabelsInContainer(labelContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupLabelsInContainer(container:UIView) {
        
        let label1 = UILabel(frame: CGRect.zeroRect)
        label1.text = "One"
        label1.font = UIFont.systemFontOfSize(20.0)
        label1.sizeToFit()
        label1.center = CGPoint(x: 40, y: 100)
        container.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect.zeroRect)
        label2.text = "Two"
        label2.font = UIFont.systemFontOfSize(20.0)
        label2.sizeToFit()
        label2.center = CGPoint(x: 200, y: 300)
        container.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect.zeroRect)
        label3.text = "Three"
        label3.font = UIFont.systemFontOfSize(20.0)
        label3.sizeToFit()
        label3.center = CGPoint(x: 150, y: 200)
        container.addSubview(label3)
        
        labels = [label1, label2, label3]
        
        
    }



}

// MARK: Actions

extension ViewController {
    
    @IBAction func moveLabel(gesture:UIPanGestureRecognizer)  {
        
        if let labelBeingMoved = labelBeingMoved {
            labelBeingMoved.center = gesture.locationInView(labelContainer)
        }
    }
    
}


// MARK: UIGestureRecognizerDelegate

extension ViewController : UIGestureRecognizerDelegate {
    
    
    func gestureRecognizerShouldBegin(gesture: UIGestureRecognizer) -> Bool {

        let location = gesture.locationInView(labelContainer)

        
        
        //You'll have to change this to account for labels on top of one another
        for label in labels {
            if label.frame.contains(location) {
                labelBeingMoved = label
                labelContainer.bringSubviewToFront(labelBeingMoved!)
                return true
            }
            
        }
        return false
    }
    
    
}
