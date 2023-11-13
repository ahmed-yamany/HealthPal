import UIKit

public protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidReachFirstViewController()
    func coordinatorDidReachLastViewController()
}

open class Coordinator: NSObject {
    public private(set) var navigationController: UINavigationController
    public private(set) var currentIndex: Int = -1
    public private(set) var coordinatorTypes: [CoordinatorViewController.Type] = []
    //
    open weak var delegate: CoordinatorDelegate?
    //
    public init(navigationControllerType: UINavigationController.Type) {
        self.navigationController = navigationControllerType.init(nibName: nil, bundle: nil)
        super.init()
    }
    //
    open func push(userInfo: [String: Any]? = nil ) {
        guard currentIndex <= coordinatorTypes.count - 2 else {
            debugPrint("you have reached the last viewController")
            delegate?.coordinatorDidReachLastViewController()
            return
        }
        //
        increaseCurrentIndex()
        //
        let currentCoordinatorType = self.coordinatorTypes[currentIndex]
        let currentCoordinator = currentCoordinatorType.init()
        self.push(to: currentCoordinator, userInfo: userInfo)
    }
    //
    open func push(to viewController: CoordinatorViewController, userInfo: [String: Any]? = nil ) {
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    //
    open func pop() {
        guard currentIndex > 0 else {
            debugPrint("you reached the first viewController")
            delegate?.coordinatorDidReachFirstViewController()
            return
        }
        decreaseCurrentIndex()
    }
    public func setCoordinatorTypes(_ coordinatorTypes: [CoordinatorViewController.Type]) {
        self.coordinatorTypes = coordinatorTypes
        push()
    }
    //
    private func increaseCurrentIndex() {
         self.currentIndex = currentIndex == coordinatorTypes.count - 1 ? currentIndex : currentIndex + 1
     }
     //
     private func decreaseCurrentIndex() {
         currentIndex -= 1
     }
}
