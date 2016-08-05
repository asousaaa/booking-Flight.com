/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.Date;

/**
 *
 * @author AL-SALAM
 */
public class Flight 
{
    int id;
    int numberOFseats1;
    int numberOFseats2;
    int numberOFseats3;
    int ava1;
    
    int ava2;
    int ava3;
    public String source;
    String destination;
    String d;
    String time;
    int price1;
    int price2;
    int price3;
  

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumberOFseats1() {
        return numberOFseats1;
    }

    public void setNumberOFseats1(int numberOFseats1) {
        this.numberOFseats1 = numberOFseats1;
    }

    public int getNumberOFseats2() {
        return numberOFseats2;
    }

    public void setNumberOFseats2(int numberOFseats2) {
        this.numberOFseats2 = numberOFseats2;
    }

    public int getNumberOFseats3() {
        return numberOFseats3;
    }

    public void setNumberOFseats3(int numberOFseats3) {
        this.numberOFseats3 = numberOFseats3;
    }

    public int getAva1() {
        return ava1;
    }

    public void setAva1(int ava1) {
        this.ava1 = ava1;
    }

    public int getAva2() {
        return ava2;
    }

    public void setAva2(int ava2) {
        this.ava2 = ava2;
    }

    public int getAva3() {
        return ava3;
    }

    public void setAva3(int ava3) {
        this.ava3 = ava3;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getPrice1() {
        return price1;
    }

    public void setPrice1(int price1) {
        this.price1 = price1;
    }

    public int getPrice2() {
        return price2;
    }

    public void setPrice2(int price2) {
        this.price2 = price2;
    }

    public int getPrice3() {
        return price3;
    }

    public void setPrice3(int price3) {
        this.price3 = price3;
    }
    
    Flight ()
    {
        
    }
    public Flight (int id, int num1, int num2, int num3, 
            int booked1, int booked2,int booked3, String s, String des,String d, String t
            ,int p1, int p2, int p3)
    {
        this.ava1= num1-booked1;
        this.ava2= num2- booked2;
        this.ava3= num3-booked3;
        this.d=d;
        this.destination=des;
        this.id=id;
        this.numberOFseats1=num1;
        this.numberOFseats2=num2;
        this.numberOFseats3=num3;
        this.source=s;
        this.time=t;
        this.price1=p1;
        this.price2=p2;
        this.price3=p3;
    }
    
    
}
