import UIKit

final class DataSource: NSObject {
    
    // MARK: - Constants
    private struct Constants {
        static let tagCellIdentifier: String = "TagCollectionViewCell"
    }
    
    // MARK: - Properties
    private var tags: [String] = []
    
    // MARK: - Lifecycle
    init(tags: [String]) {
        self.tags = tags
    }
    
}

// MARK: - UICollectionViewDataSource
extension DataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.tagCellIdentifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
        let tag = tags[indexPath.row]
        cell.configure(title: tag)
        return cell
    }
}
