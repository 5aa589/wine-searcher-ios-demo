import UIKit

class CardDetailsViewController: UIViewController {

    init(inputs: CardDetailsViewControllerInputs,
         winesConfigurator: CardDetailsWinesConfiguring = CardDetailsWinesConfigurator()) {
        self.inputs = inputs
        self.winesConfigurator = winesConfigurator
        super.init(nibName: nil, bundle: nil)
    }

    var cardDetailsView: CardDetailsView! {
        return view as? CardDetailsView
    }

    override func loadView() {
        view = CardDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupWines()
    }

    // MARK: - Private

    private let inputs: CardDetailsViewControllerInputs
    private let winesConfigurator: CardDetailsWinesConfiguring

    private func setupView() {
        cardDetailsView.headerView.topImageView.image = inputs.topImage
        cardDetailsView.headerView.topTitleLabel.text = inputs.title
        cardDetailsView.headerView.topSubtitleLabel.attributedText = inputs.subtitle
    }

    private func setupWines() {
        let wines = CardDetailsWineViewModel.wines
        winesConfigurator.configure(wines: wines, stackView: cardDetailsView.winesView.contentStackView)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
