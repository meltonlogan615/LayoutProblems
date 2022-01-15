
import Foundation
import UIKit

protocol PassingRequest {
  func loadRecipes(for: String)
}

class SearchViewController: UIViewController {
  
  let navigationBar = UINavigationController()
  let imageView = UIImageView()
  let searchView = SearchView()
  var searched: String? {
    return searchView.searchTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .primaryActionTriggered)
    style()
    layout()
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    searchView.searchTextField.text = ""
    searchView.errorLabel.isHidden = true
  }
}

extension SearchViewController {
  private func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "airpods.gen3")?.applyingSymbolConfiguration(.preferringMulticolor())
    imageView.contentMode = .scaleAspectFit
    searchView.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  private func layout() {
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 125),
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5),
      imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    view.addSubview(searchView)
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 10),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 1),
      searchView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // will not work without this. if removed, textfield and button become unresponsive. not able to find any conflicting constraints
      searchView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}


extension SearchViewController {
  // if searchTextField is blank, show error
  private func configureLabel(withMessage message: String) {
    searchView.errorLabel.isHidden = false
    searchView.errorLabel.text = message
  }
}

extension SearchViewController {
  @objc func searchButtonTapped(sender: UIButton) {
    guard let searched = searched else {
      assertionFailure("searched shouldn't be nil!")
      return
    }
    if searched.isEmpty {
      configureLabel(withMessage: "Search Field Cannot Be Empty")
      return
    } else {
      print(searched)
    }
  }
}


