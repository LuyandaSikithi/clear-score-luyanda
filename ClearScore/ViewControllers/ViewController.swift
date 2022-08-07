//
//  ViewController.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/07/28.
//

import UIKit
import Resolver

class ScoreViewController: UIViewController {

    @IBOutlet weak var cicleView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    private var score: ScoreResponse!
    lazy var viewModel: ScoreViewModel = {
        return ScoreViewModel(self)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getScore()
        cicleView.styleView()
    }
    
    private func showProgressBar() {
        let cp = CircularProgressView(frame: CGRect(x: 20.0, y: 20.0, width: 240.0, height: 240.0))
        cp.trackColor = UIColor.white
        cp.progressColor = .orange
        cp.tag = 700
        self.view.addSubview(cp)
        cp.center = self.view.center
        
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ScoreViewController.viewTapped(gesture:)))
        cp.addGestureRecognizer(tapGesture)
        cp.isUserInteractionEnabled = true
    }
    
    @objc func animateProgress() {
        let cP = self.view.viewWithTag(700) as! CircularProgressView
        cP.setProgressWithAnimation(duration: 1.0, value: 0.5)
        
    }

    private func showScore() {
        scoreLabel.text = String(describing: score.creditReportInfo?.score)
    }
    
    @objc func viewTapped(gesture: UIGestureRecognizer) {
        if (gesture.view) != nil {
            showDetails()
        }
    }
    
    private func showDetails() {
        let controller = DetailsViewController.loadController(with: score)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ScoreViewController: LaunchScore {
    func displayScore(score: ScoreResponse) {
        DispatchQueue.main.async { [self] in
            self.score = score
            hideLoadingIndicator()
            guard let score = score.creditReportInfo?.score else { return }
            scoreLabel.text = "\(score)"
            showProgressBar()
        }
    }
    
    func showError(errorMessage: String) {
        DispatchQueue.main.async{
            let alert = UIAlertController(title: "Error", message: errorMessage , preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Close", style: .destructive) { (action:UIAlertAction) in  }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            self.showActivityIndicatory()
        }
    }
    
    func showLoadingIndicator() { showActivityIndicatory() }
    
    func hideLoadingIndicator() { hideActivityIndicatory() }
}
