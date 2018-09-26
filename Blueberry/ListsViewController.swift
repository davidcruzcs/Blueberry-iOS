//
//  ListsViewController.swift
//  Blueberry
//
//  Created by Juan David Cruz Serrano on 9/25/18.
//  Copyright © 2018 Juan David Cruz Serrano. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController {

    @IBOutlet weak var listsTableView: UITableView!
    
    private var gradient: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpListTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientFrame()
    }


}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpListTable() {
        listsTableView.delegate = self
        listsTableView.dataSource =  self
        
        listsTableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        
        gradient = CAGradientLayer()
        gradient.frame = listsTableView.superview?.bounds ?? CGRect.null
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        gradient.delegate = self
        listsTableView.layer.mask = gradient
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellList", for: indexPath)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateGradientFrame()
    }
    
}

extension ListsViewController: CALayerDelegate {
    
    // MARK: - CALayerDelegate
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        return NSNull()
    }
    
    func updateGradientFrame() {
        guard gradient != nil else {
            return
        }
        gradient.frame = CGRect(
            x: 0,
            y: listsTableView.contentOffset.y,
            width: listsTableView.bounds.width,
            height: listsTableView.bounds.height
        )
    }
}

