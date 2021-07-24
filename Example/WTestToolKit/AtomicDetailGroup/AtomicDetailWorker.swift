//
//  AtomicDetailWorker.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

protocol AtomicDetailWorkerProtocol {
    func fetchAtoms() -> [AtomicDetailViewModel]
    func fetchMolecules() -> [AtomicDetailViewModel]
    func fetchOrganisms() -> [AtomicDetailViewModel]
    func fetchTemplates() -> [AtomicDetailViewModel]
}

class AtomicDetailWorker: AtomicDetailWorkerProtocol {
    func fetchAtoms() -> [AtomicDetailViewModel] {
        var atoms = AtomsGroup.atoms
        //Restart the animations
        atoms.append(AtomicDetailViewModel(title: "Download Animation", view: DownloadAnimationBuild().build()))
        atoms.append(AtomicDetailViewModel(title: "Checkmark Animation", view: CheckmarkAnimationBuild().build()))
        return sortedAtomicsModel(details: atoms)
    }

    func fetchMolecules() -> [AtomicDetailViewModel] {
        return sortedAtomicsModel(details: MoleculesGroup.molecules)
    }

    func fetchOrganisms() -> [AtomicDetailViewModel] {
        return  sortedAtomicsModel(details: OrganismsGroup.organisms)
    }
    
    func fetchTemplates() -> [AtomicDetailViewModel] {
        return  sortedAtomicsModel(details: TemplatesGroup.templates)
    }
    
    func sortedAtomicsModel(details: [AtomicDetailViewModel]) -> [AtomicDetailViewModel] {
        details.sorted(by: { (atomic, otherAtomic) -> Bool in
            otherAtomic.title > atomic.title
       })
    }
}
