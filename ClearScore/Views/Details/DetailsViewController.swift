//
//  DetailsViewController.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/08/02.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var maxScoreLabel: UILabel!
    @IBOutlet weak private var minScoreLabel: UILabel!
    @IBOutlet weak private var maxScoreView: UIView!
    @IBOutlet weak private var minScoreView: UIView!
    @IBOutlet weak private var tableView: UITableView!
    
    var score: ScoreResponse?
    static func loadController(with score: ScoreResponse) -> DetailsViewController {
        let viewController = DetailsViewController.init(nibName: String.init(describing: self), bundle: Bundle(for: self))
        viewController.loadViewIfNeeded()
        viewController.setUp(with: score)
        return viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        styleViews(minScoreView, maxScoreView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    func setUp(with score: ScoreResponse) {
        loadViewIfNeeded()
        self.score = score
        guard let score = score.creditReportInfo?.score else { return }
        scoreLabel.text = "\(score)"
    }
    
    private func styleViews(_ min: UIView, _ max: UIView){
        min.layer.cornerRadius = min.layer.bounds.width / 2
        min.clipsToBounds = true
        
        min.layer.borderWidth = 1
        min.layer.borderColor = UIColor.white.cgColor
        
        max.layer.cornerRadius = max.layer.bounds.width / 2
        max.clipsToBounds = true
        
        max.layer.borderWidth = 1
        max.layer.borderColor = UIColor.white.cgColor
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: Constants.tableViewCell, bundle: nil), forCellReuseIdentifier: Constants.tableViewCell)
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCell, for: indexPath) as? DetailsTableViewCell, let cellData = score?.creditReportInfo else {  return UITableViewCell() }
        DispatchQueue.main.async {
            if indexPath.row == 0 {
                cell.getValues(ConfigureCell.init(title: Constants.detailsTitles.creditUsed, amount: cellData.percentageCreditUsed))
            }else if indexPath.row == 1 {
                cell.getValues(ConfigureCell.init(title: Constants.detailsTitles.shortTermDebt, amount: cellData.currentShortTermDebt))
            }else if indexPath.row == 2 {
                cell.getValues(ConfigureCell.init(title: Constants.detailsTitles.shortTermCreditLimit, amount: cellData.currentShortTermCreditLimit))
            }else if indexPath.row == 3 {
                cell.getValues(ConfigureCell.init(title: Constants.detailsTitles.changeInShortTermDebt, amount: cellData.changeInShortTermDebt))
            }else{
                cell.getValues(ConfigureCell.init(title: Constants.detailsTitles.longTermDebt, amount: cellData.currentLongTermDebt))
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
