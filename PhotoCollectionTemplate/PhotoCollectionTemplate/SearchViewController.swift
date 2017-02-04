//
//  ViewController.swift
//  PhotoCollectionTemplate
//
//  Created by Nicolas Roy on 2/2/17.
//  Copyright © 2017 Nick's Basement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [Photo] = [];
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        
        do{
            try photos = context.fetch(Photo.fetchRequest());
            tableView.reloadData();
        } catch {
            print("there was an error fetching the photots");
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        tableView.delegate = self;
        tableView.dataSource = self;
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row;
        let cell = UITableViewCell();
        cell.textLabel?.text = photos[i].title;
        cell.imageView?.image = UIImage(data: photos[i].image as! Data);
        return cell;
    }

}

