//
//  ViewController.swift
//  HWUITableView
//
//  Created by Карина Дьячина on 4.01.24.
//

import UIKit

class ViewController: UIViewController {
    var programmingLanguages: [Language] = []
    var cellIndex: [Int] = []
    /*["JavaScript", "Python", "C#", "C++", "Swift", "Ruby", "Java", "Dart", "Kotlin", "Go" ]*/
    let jsonDecoder = LocalJSONParser()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTrackData()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "ProgrammingLangTableViewCell", bundle: nil), forCellReuseIdentifier: "ProgrammingLangTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programmingLanguages.count//колво треков
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgrammingLangTableViewCell", for: indexPath) as! ProgrammingLangTableViewCell
        let programmLang = programmingLanguages[indexPath.row] //на каждую ячейку
        cellIndex.append(indexPath.row)
        cell.configure(language: programmLang, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 125.0
    }
    
}

extension ViewController {
        func getTrackData() {
            do {
                let jsonData = try LocalJSONParser.readLocalJSONFile(forName: "language")
                if let programmingLanguages = LocalJSONParser.parse(jsonData: jsonData) {
                    for languageName in programmingLanguages {
                        print("ProgrammLang: \(languageName)")
                        self.programmingLanguages.append(languageName)
                    }
                } else {
                    print("Ошибка парсинга данных")
                }
            } catch {
                print("Ошибка чтения файла JSON: \(error)")
            }
        }
    }
