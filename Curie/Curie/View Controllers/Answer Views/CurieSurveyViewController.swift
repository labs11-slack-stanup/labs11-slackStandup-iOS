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
            print(currentSurveys)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(CurieCollectionViewCell.self, forCellWithReuseIdentifier: "surveyCell")
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
        
        cell.layer.cornerRadius = 12
        cell.survey = currentSurveys[indexPath.row]

        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
