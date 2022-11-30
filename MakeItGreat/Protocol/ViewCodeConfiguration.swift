import Foundation

protocol ViewCodeConfiguration {
    func configureViews()
    func buildHierarchy()
    func setupConstraints()
}

extension ViewCodeConfiguration {
    func applyViewCode() {
        configureViews()
        buildHierarchy()
        setupConstraints()

    }
}
