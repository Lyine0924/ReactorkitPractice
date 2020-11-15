//
//  ViewController.swift
//  ReactorkitPractice
//
//  Created by Lyine on 2020/11/15.
//

import UIKit

import ReactorKit
import SnapKit

class ButtonViewController: BaseViewController, View {
	
	var disposeBag = DisposeBag()
	
	var reactor: ButtonReactor
	
	init(reactor: ButtonReactor) {
		defer {
			self.reactor = reactor
		}
		
		super.init()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	override func configureUI() {
		super.configureUI()
	}
	
	override func setupConstraints() {
		super.setupConstraints()
	}

	func bind(reactor: ButtonReactor) {
		reactor.state
			.filter { $0.isPushed }
			.map { $0.message }
			.subscribe(onNext: {
				print("push Message = \($0)")
			}).disposed(by: self.disposeBag)
	}

}

