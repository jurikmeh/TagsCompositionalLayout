import UIKit

final class TagsViewController: UIViewController {
    
    // MARK: - Constants
    private struct Constants {
        static let tagCellIdentifier: String = "TagCollectionViewCell"
        static let backgroundColor: String = "System"
        static let itemSizeWidth: CGFloat = 80.0
        static let groupSizeHeight: CGFloat = 56.0
        static let groupContentInsetsTopPadding: CGFloat = 12.0
        static let groupInterItemSpacing: CGFloat = 12.0
    }
    
    // MARK: - Properties
    private let dataSource: DataSource
    
    // MARK: - UI
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = dataSource
        $0.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: Constants.tagCellIdentifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: makeLayout()))
    
    // MARK: - Lifecycle
    init(dataSource: DataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupConstraints()
    }
    
}

// MARK - Common Setup
private extension TagsViewController {
    func configureView() {
        view.backgroundColor = UIColor(named: Constants.backgroundColor)
    }
    
    func setupConstraints() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewCompositionalLayout
private extension TagsViewController {
    func makeLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, env in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(Constants.itemSizeWidth), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(Constants.groupSizeHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: Constants.groupContentInsetsTopPadding, leading: 0.0, bottom: 0.0, trailing: 0.0)
            group.interItemSpacing = .fixed(Constants.groupInterItemSpacing)
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}
