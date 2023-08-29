import UIKit

final class TagCollectionViewCell: UICollectionViewCell {
    
    // MARK: Constants
    private struct Constants {
        static let contentViewCornerRadius: CGFloat = 10.0
        static let tagVerticalPadding: CGFloat = 12.0
        static let tagHorizontalPadding: CGFloat = 24.0
    }
    
    // MARK: - UI
    private lazy var tagLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.sizeToFit()
        $0.textColor = .label
        return $0
    }(UILabel())
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TagCollectionViewCell {
    func configure(title: String) {
        self.tagLabel.text = title
    }
}

private extension TagCollectionViewCell {
    func setupCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = Constants.contentViewCornerRadius
    }
    
    func setupConstraints() {
        contentView.addSubview(tagLabel)
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.tagVerticalPadding),
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.tagHorizontalPadding),
            tagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.tagVerticalPadding),
            tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.tagHorizontalPadding)
        ])
    }
}
