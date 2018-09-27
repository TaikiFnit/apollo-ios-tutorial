//
//  ViewController.swift
//  apollo-test
//
//  Created by TaikiFnit on 2018/09/27.
//  Copyright © 2018 TaikiFnit. All rights reserved.
//

import UIKit
import Apollo

struct Book: Codable {
    let title: String?
    let author: String?
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apollo = ApolloClient(url: URL(string: "http://localhost:4000")!)
        apollo.fetch(query: BooksQuery()) { (result, error) in
            guard let books = result?.data?.books else {
                return
            }
            
            self.label.text = books.map { books in "\(books?.title ?? "") by \(books?.author ?? "")"}.joined(separator: "\n")
        }
    }
}

