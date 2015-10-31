//
//  ChartsTableViewController.swift
//  red-analyzer
//
//  Created by Arvind Jagesser on 31/10/15.
//  Copyright © 2015 Arvind Jagesser. All rights reserved.
//

import UIKit
import Charts

class ChartsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifierLabel", forIndexPath: indexPath)

        var chartView: PieChartView = cell.contentView.viewWithTag(99) as! PieChartView
        
        self.title = "Generated Charts";
        
        chartView.usePercentValuesEnabled = true
        chartView.holeTransparent = true;
        chartView.holeRadiusPercent = 0.58;
        chartView.transparentCircleRadiusPercent = 0.61;
        chartView.descriptionText = "";
//        chartView.setExtraOffsets(left: 5.f, top: 10.f, right: 5.f, bottom: 5.f)
        
        chartView.rotationAngle = 0.0
        chartView.data = self.setDataCount(4, range: Double(4))
        
        
//        var l = chartView.legend
//        l.position = ChartLegendPosition.RightOfChart
//        l.xEntrySpace = 7.0;
//        l.yEntrySpace = 0.0;
//        l.yOffset = 0.0;
        
//        [chartView animateWithXAxisDuration:1.4 yAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];


        return cell
    }
    
    func setDataCount(count:Int, range:Double) -> PieChartData
    {
        let mult = UInt32(range)
        
        var yVals1 : [ChartDataEntry] = []
        
        // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
        for var i = 0; i < count; i++
        {
            let value = Double(arc4random_uniform(mult) + mult / 5)
            yVals1.append(ChartDataEntry.init(value: value , xIndex: i))
        }
        
        var xVals : [String?] = []
        
        for var i = 0; i < count; i++
        {
            xVals.append("Party A")
        }
        
        
        var dataSet : [ChartDataSet] = []
        dataSet.append(PieChartDataSet(yVals: yVals1, label: "Results"))
//        dataSet.sliceSpace = 2.0
        
        // add a lot of colors
        
        //        var colors : [UIColor]
        //        colors.append(ChartColorTemplates.vordiplom)
        //
        //    [colors addObjectsFromArray:ChartColorTemplates.joyful];
        //    [colors addObjectsFromArray:ChartColorTemplates.colorful];
        //    [colors addObjectsFromArray:ChartColorTemplates.liberty];
        //    [colors addObjectsFromArray:ChartColorTemplates.pastel];
        //    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
        //
        //    dataSet.colors = colors;
        
        let data = PieChartData(xVals: xVals, dataSets: dataSet)
        return data
        //    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
        //    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
        //    pFormatter.maximumFractionDigits = 1;
        //    pFormatter.multiplier = @1.f;
        //    pFormatter.percentSymbol = @" %";
        //    [data setValueFormatter:pFormatter];
        //    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
        //    [data setValueTextColor:UIColor.whiteColor];
        //
        //    [_chartView highlightValues:nil];
    }
    
    



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
