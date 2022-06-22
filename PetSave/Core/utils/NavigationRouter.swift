//
//  NavigationRouter.swift
//  PetSave
//
//  Created by Simon Rofe on 22/6/2022.
//

import SwiftUI

protocol NavigationRouter {
    associatedtype Data

    func navigate<T: View>(data: Data, navigationState: NavigationState, view: (() -> T)?) -> AnyView
}
