//
//  OnboardingVC.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 10.11.2022.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    var slide : [OnboardinSlide] = []

    var currentPage = 0 {
        didSet {
            
            pageController.currentPage = currentPage
           
            if currentPage == slide.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
                
            }else {
                nextButton.setTitle("Next", for: .normal)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slide = [
            OnboardinSlide(title: "Bitcoin", description: "dfsgsd", image: UIImage(named: "splashScreen")!),
            OnboardinSlide(title: "Etherium", description: "ikinci en degerli", image: UIImage(named: "splashScreen")!),
            OnboardinSlide(title: "DogeCoin", description: "Elon Musk", image: UIImage(named: "splashScreen")!)
            
          ]
        
    }
    

   
    @IBAction func nextButtonClıcked(_ sender: UIButton) {
        
        if currentPage == slide.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! UINavigationController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .partialCurl
            present(controller, animated: true, completion: nil)
        }else {
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          
        }
        
        
    }
    
}

extension OnboardingVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardinCollectionViewCell.idenfier, for: indexPath) as! OnboardinCollectionViewCell
        cell.setup(slide[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
