/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.other;

/**
 *
 * @author Mannu
 */
public class CalBMI {

    public static String getBMI(double weight, double height) {
        double bmi = (weight / (height * height)) * 10000;

        System.out.printf("%n Your weight in kilos: " + weight);
        System.out.printf("%n Your height centemeters: " + height);
        System.out.printf("%n Your BMI is " + Math.round(bmi));

        if (Math.round(bmi) < 16) {
            return "You are seriously underweight" + Math.round(bmi);
        } else if (Math.round(bmi) < 18) {
            return "You are underweight" + Math.round(bmi);
        } else if (Math.round(bmi) < 24) {
            return "You are normal weight" + Math.round(bmi);
        } else if (Math.round(bmi) < 29) {
            return "You are overweight" + Math.round(bmi);
        } else if (Math.round(bmi) < 35) {
            return "You are seriously overweight" + Math.round(bmi);
        } else {
            return "You are gravely overweight" + Math.round(bmi);
        }
    }
}
