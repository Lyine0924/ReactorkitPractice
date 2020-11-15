//
//  ButtonAPI.swift
//  ReactorkitPractice
//
//  Created by Lyine on 2020/11/15.
//

import Foundation
import RxSwift


struct ButtonAPI {
	func push() -> Observable<String> {
		return Observable.create { observer in
			observer.onNext("Hello")
			observer.onCompleted()
			return Disposables.create()
		}
	}
}
