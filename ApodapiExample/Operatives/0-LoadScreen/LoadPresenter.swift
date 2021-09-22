import UIKit

protocol LoadPresentationLogic {
    func presentSetup(response: LoadModel.Setup.Response)
    func presentDownloadData(response: LoadModel.DownloadData.Response)
}

class LoadPresenter: LoadPresentationLogic {
    weak var viewController: LoadDisplayLogic?

    func presentSetup(response: LoadModel.Setup.Response) {
        let viewModel = LoadModel.Setup.ViewModel(navigationTitle: "Carga de Datos",
                                                  backgroundColor: UIColor(named: "AccentColor") ?? .white,
                                                  actionTitle: "Descargando datos de APODAPI...",
                                                  actionColor: .white)
        viewController?.displaySetup(viewModel: viewModel)
    }

    func presentDownloadData(response: LoadModel.DownloadData.Response) {
        let viewModel = LoadModel.DownloadData.ViewModel()
        viewController?.displayDownloadData(viewModel: viewModel)
    }
}
