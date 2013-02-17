/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package main;
import mpro.runInfo;

public class Main 
{
    public static void main(String[] args) 
    {
        runInfo run = new runInfo();
        for(int i = 0; i < 50000; i++)
        {
            System.out.println("Printa");
        }
        System.out.println(run.endRun());
    }
}
