//
//  ViewController.swift
//  randomTable
//
//  Created by Aizawa Takashi on 2015/06/19.
//  Copyright (c) 2015年 Aizawa Takashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate {

    private var values:[Int] = []
    private var valueCountDict:[Int:Int] = [:]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var maxValue: UITextField!
    @IBOutlet weak var minimumeValue: UITextField!
    @IBAction func actionButton(sender: AnyObject) {
        let max:Int = maxValue.text.toInt()!
        let min:Int = minimumeValue.text.toInt()!
        calRandom(max,min: min)
        countNumber()
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueCountDict.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RandomCell") as! RandomTableViewCell
        let (value,count) = self.getValues(indexPath.row)
        cell.value.text = String(value)
        cell.count.text = String(count)
        return cell
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    private func calRandom( max:Int, min:Int ) {
        values.removeAll(keepCapacity: false)
        for var i=0; i<1000; i++ {
            let value = random() % (max+1) * (max - min)
            values.append(value)
        }
    }
    private func countNumber() {
        for value in values {
            if contains(self.valueCountDict.keys, value) {
                var counter:Int = self.valueCountDict[value]!
                counter++
                self.valueCountDict[value] = counter
            }else{
                self.valueCountDict[value] = 1
            }
        }
    }
    private func getValues(index:Int)->(Int,Int) {
        var counter:Int = 0
        for (key, value) in self.valueCountDict {
            if index == counter {
                return (key,value)
            }
        }
        return(0,0)
    }
}

