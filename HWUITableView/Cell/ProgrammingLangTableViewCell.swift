//
//  ProgrammingLangTableViewCell.swift
//  HWUITableView
//
//  Created by Карина Дьячина on 4.01.24.
//

import UIKit

class ProgrammingLangTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progLangLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(language: Language, index: Int, section1: Int, section2: Int) {
        progLangLabel.text = language.languageName
        numberLabel.text = String(index)
        sectionLabel.text = String(section1)
        sectionLabel.text = String(section2)
    }
}
