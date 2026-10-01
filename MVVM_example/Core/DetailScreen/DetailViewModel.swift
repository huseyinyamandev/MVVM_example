//
//  DetailViewModel.swift
//  MVVM_example
//
//  Created by Huseyin on 1.10.2026.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? {get set}
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface?
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
