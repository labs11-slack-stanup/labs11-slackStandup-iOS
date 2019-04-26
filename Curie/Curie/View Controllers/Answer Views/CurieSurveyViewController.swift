//
//  CurieSurveyViewController.swift
//  Curie
//
//  Created by Farhan on 4/11/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class CurieSurveyViewController: UIViewController {
    
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    
    var userController: UserController?{
        didSet {
            guard let userController = userController, let user = userController.user else {return}
            
            userController.loadPossibleCurieSurveys(user: user) { (surveys) in
                guard let surveys = surveys else {return}
                
                self.currentSurveys = surveys                
            }
        }
    }
    var currentSurveys:[CurieSurvey]?{
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.pageIndicatorTintColor = .gray
        
        let cellScaling = CGFloat(0.7)
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 2
        let insetY = (view.bounds.height - cellHeight) / 2
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension CurieSurveyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let currentSurveys = currentSurveys else {return 0}
        
        let count = currentSurveys.count
        
        pageControl.numberOfPages = count
        pageControl.isHidden = !(count > 1)
        
        return count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "surveyCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CurieCollectionViewCell
        
        guard let currentSurveys = currentSurveys else {return UICollectionViewCell()}
        
        cell.survey = currentSurveys[indexPath.row]

        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
//        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

        let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
        

    }
    
}
