//
//  HomeScreenViewController.swift
//  MVVM_example
//
//  Created by Huseyin on 28.09.2026.
//

import UIKit

protocol HomeScreenInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
    func reloadData()
    func reloadCollectionView()
    func navigateToDetailScreen(movie: MovieResult)
}

final class HomeScreenViewController: UIViewController {

    private let viewModel = HomeViewModel() //HomeScreen içinde viewModel oluşturdum
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view=self
        viewModel.viewDidLoad()
        
    }
    


}

extension HomeScreenViewController: HomeScreenInterface {
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false //storyboard ile uğraşmıyorken bunu false yapıyoruz

        collectionView.pinToEdgeOf(view: view)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "POPULAR MOVIES"
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}



extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        
        cell.setCell(movie: viewModel.movies[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        guard contentHeight != 0 else {return}
        
        if offsetY >= contentHeight - (2 * height) && viewModel.shouldDownloadMore {
            viewModel.getMovies()
        }
    }
    
    func navigateToDetailScreen(movie: MovieResult){
        DispatchQueue.main.async{
            let detailScreen = DetailScreenViewController(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
    
    func reloadCollectionView(){
        collectionView.reloadOnMainThread()
    }
    
}
