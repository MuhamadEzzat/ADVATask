//
//  PhotoListViewModel.swift
//  MVVMPlayground
//
//  Created by Mohamed Ezzat on 6/3/22.
//

import Foundation

class PhotoListViewModel {
    
    let apiService: APIServiceProtocol

    private var photos: [Photo] = [Photo]()
    
    private var cellViewModels: [PhotoListCellViewModel] = [PhotoListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }

    // callback for interfaces
    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var isAllowSegue: Bool = false
    
    var selectedPhoto: Photo?

    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?

    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        state = .loading
        apiService.fetchPopularPhoto { [weak self] (success, photos, error) in
            guard let self = self else {
                return
            }

            guard error == nil else {
                self.state = .error
                self.alertMessage = error?.rawValue
                return
            }

            self.processFetchedPhoto(photos: photos)
            self.state = .populated
        }
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> PhotoListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( photo: Photo ) -> PhotoListCellViewModel {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return PhotoListCellViewModel( titleText: photo.title, imageUrl: photo.url )
    }
    
    private func processFetchedPhoto( photos: [Photo] ) {
        self.photos = photos // Cache
        var vms = [PhotoListCellViewModel]()
        for photo in photos {
            vms.append( createCellViewModel(photo: photo) )
        }
        self.cellViewModels = vms
    }
    
}

extension PhotoListViewModel {
    func userPressed( at indexPath: IndexPath ){
        let photo = self.photos[indexPath.row]
            self.isAllowSegue = true
            self.selectedPhoto = photo
        
        
    }
}
