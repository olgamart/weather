//
//  MyCityesController.swift
//  Weather
//
//  Created by Olga Martyanova on 21/07/2018.
//  Copyright © 2018 olgamart. All rights reserved.
//

import UIKit

class MyCityesController: UITableViewController {
    var cityes = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCityesCell", for: indexPath) as! MyCityesCell
        let city = cityes[indexPath.row]
        cell.cityName.text = city
        return cell
    }
    
    @IBAction func addCity(segue: UIStoryboardSegue){
        if segue.identifier == "addCity" {
            
            let allCityesController = segue.source as! AllCityesController
            // получаем индекс выделенной ячейки
            if let indexPath = allCityesController.tableView.indexPathForSelectedRow {
            // получаем город по индексу
                let city = allCityesController.cityes[indexPath.row]
            // добавляем город в список выбранных городов (если такого города нет в списке)
                if !cityes.contains(city){
                cityes.append(city)
            // обновляем таблицу
                tableView.reloadData()
                }
            }
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cityes.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
