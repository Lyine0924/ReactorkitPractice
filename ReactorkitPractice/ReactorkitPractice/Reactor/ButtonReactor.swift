//
//  ButtonReactor.swift
//  ReactorkitPractice
//
//  Created by Lyine on 2020/11/15.
//

import Foundation
import ReactorKit

class ButtonReactor: Reactor {
	enum Action {
		case push
	}
	
	enum Mutation {
		case setPush(String)
	}
	
	struct State {
		var isPushed: Bool = false
		var message: String = ""
	}
	
	let initialState: State = State(isPushed: false)
	
	var service: ButtonAPI
	
	init(service: ButtonAPI) {
		self.service = service
	}
	
	func mutate(action: Action) -> Observable<Mutation> {
		switch action {
			case .push:
				return service.push()
					.map { Mutation.setPush($0) }
		}
	}
	
	func reduce(state: State, mutation: Mutation) -> State {
		var newState = state
		switch mutation {
			case .setPush(let message):
				newState.isPushed.toggle()
				newState.message = message
				return newState
		}
	}
}
