//
//  MainController.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import Foundation
import UIKit

protocol MainControllerProtocol {
    func clicked()
}

final class MainController: UIViewController {
    
    /// MARK:
    private lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        btn.setTitle("버튼", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return btn
    }()
    
    var delegate: MainControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
    }
    
    
    @objc
    func buttonDidTap() {
        self.delegate?.clicked()
    }
}
