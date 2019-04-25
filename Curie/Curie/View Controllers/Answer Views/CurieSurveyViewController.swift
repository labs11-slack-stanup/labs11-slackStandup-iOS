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
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension CurieSurveyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 25.0
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: view.frame.width * 0.9, height: view.frame.height)
//        return size
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        let totalCellWidth = 80 * collectionView.numberOfItems(inSection: 0)
//        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
//
//        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
//        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
    }
    

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
//        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)

        let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
        

    }
    
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//
//        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
//    }
    
}
