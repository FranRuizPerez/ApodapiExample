import UIKit

enum AddModel {
    enum Setup {
        struct Request { }
        struct Response { }
        struct ViewModel {
            let navigationTitle: String
            let mercuryLabel: String
            let venusLabel: String
            let earthLabel: String
            let marsLabel: String
            let jupiterLabel: String
            let saturnLabel: String
            let uranusLabel: String
            let neptuneLabel: String
            let plutoLabel: String
        }
    }

    enum AddMercury {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddVenus {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddEarth {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddMars {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddJupiter {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddSaturn {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddUranus {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddNeptune {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }

    enum AddPluto {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let model: ApodapiModel
        }
    }
}
