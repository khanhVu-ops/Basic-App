//
//  ViewController.swift
//  Basic App
//
//  Created by KhanhVu on 5/17/22.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
  
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    let arrayIntro: [IntroModel] = [
        IntroModel(image: "intro1", title: "Bác sĩ sẵn lòng chăm sóc khi bạn cần", detail: "Chọn chuyên khoa, bác sĩ phù hợp và được thăm khám trong không gian thoải mái tại nhà"),
        IntroModel(image: "intro2", title: "Bác sĩ sẵn lòng chăm sóc khi bạn cần, Bác sĩ sẵn lòng chăm sóc khi bạn cần", detail: "Chọn chuyên khoa, bác sĩ phù hợp và được thăm khám trong không gian thoải mái tại nhà"),
        IntroModel(image: "intro3", title: "Bác sĩ sẵn lòng chăm sóc khi bạn cần", detail: "Chọn chuyên khoa, bác sĩ phù hợp và được thăm khám trong không gian thoải mái tại nhà Chọn chuyên khoa, bác sĩ phù hợp và được thăm khám trong không gian thoải mái tại nhà")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = arrayIntro.count
        
        btnSignIn.layer.cornerRadius = 20
        btnSignUp.layer.cornerRadius = 20
        btnSignUp.layer.borderWidth = 1
        btnSignIn.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapBtnSignIn(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension IntroViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayIntro.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "IntroCollectionViewCell", for: indexPath) as! IntroCollectionViewCell
        let data = arrayIntro[indexPath.row]
        cell.config(data: data)
        return cell
    }
    
    
}
extension IntroViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
extension IntroViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: myCollectionView.frame.height)
    }
}
