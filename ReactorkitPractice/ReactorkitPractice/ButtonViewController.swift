//
//  ViewController.swift
//  ReactorkitPractice
//
//  Created by Lyine on 2020/11/15.
//

import UIKit

import ReactorKit
import SnapKit

import RxCocoa

class ButtonViewController: UIViewController, View {
	
	typealias Reactor = ButtonReactor
	
	var disposeBag: DisposeBag = DisposeBag()
	
	let button: UIButton = {
		var button = UIButton(frame: .zero)
		button.setTitle("Push", for: .normal)
		button.setTitleColor(UIColor.white, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.backgroundColor = UIColor.systemBlue
		button.layer.cornerRadius = 8.0
		button.clipsToBounds = true
		return button
	}()
		
	init(reactor: ButtonReactor) {
		super.init(nibName: nil, bundle: nil)
		self.reactor = reactor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		configureUI()
	}
	
	func configureUI() {
		[button].forEach {
			self.view.addSubview($0)
		}
		
		setupConstraints()
	}
	
	func setupConstraints() {
		
		button.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.width.equalToSuperview().multipliedBy(0.4)
			$0.height.equalTo(button.snp.width).multipliedBy(0.4)
		}
	}

	func bind(reactor: Reactor) {
		button.rx.tap
			.throttle(.milliseconds(5), scheduler: MainScheduler.instance)
			.map { _ in Reactor.Action.push }
			.bind(to: reactor.action)
			.disposed(by: self.disposeBag)
		
		reactor.state
			.filter { $0.isPushed }
			.map { $0.message }
			.subscribe(onNext: {
				print("push Message = \($0)")
			}).disposed(by: self.disposeBag)
	}
}

