//
//  ViewController.swift
//  ReactorkitPractice
//
//  Created by Lyine on 2020/11/15.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift


class ViewController: UIViewController, StoryboardView {
    var disposeBag: DisposeBag = DisposeBag()
    
    func bind(reactor: CounterViewReactor){
        increase.rx.tap.map{Reactor.Action.increase}.bind(to: reactor.action).disposed(by: disposeBag)
        decrease.rx.tap.map{Reactor.Action.decrease}.bind(to: reactor.action).disposed(by: disposeBag)
        
        reactor.state.map{$0.value}.distinctUntilChanged().map{"\($0)"}.bind(to: label.rx.text).disposed(by: disposeBag)
    }
    
    @IBOutlet var increase:UIButton!
    @IBOutlet var decrease:UIButton!
    @IBOutlet var label:UILabel!
    
	override func viewDidLoad() {

        
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

class CounterViewReactor :Reactor{
    enum Action {
        case increase
        case decrease
        
    }
    
    enum Mutation{
        case increaseValue
        case decreaseValue
        
    }
    
    struct State {
        var value:Int = 0
    }
    
    let initialState = State()
    
    func mutate(action: CounterViewReactor.Action) -> Observable<CounterViewReactor.Mutation> {
        switch action {
        case .increase:
            return Observable.just(Mutation.increaseValue)
        case .decrease :
            return Observable.just(Mutation.decreaseValue)
        }
    }
    
    func reduce(state: CounterViewReactor.State
                , mutation: CounterViewReactor.Mutation) -> State {
        var newState = state
        switch mutation {
        case .increaseValue:
            newState.value  += 1
        case .decreaseValue:
            newState.value -= 1
        }
        return newState
    }
}
