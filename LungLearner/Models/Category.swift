//
//  Category.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/29/20.
//

import Foundation

struct Category: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}

let imageCategories: [String] = [
    "LabValues",
    "XRay"
]

var testCategories: [Category] = [
    Category(imageName: "Persona", title: "Persona", description: "Example description."),
    Category(imageName: "Symptoms", title: "Symptoms", description: "Example description."),
    Category(imageName: "PhysicalExam", title: "Physical Exam", description: "Example description."),
    Category(imageName: "LabValues", title: "Lab Values", description: "Example description."),
    Category(imageName: "BloodGas", title: "Blood Gas", description: "Example description."),
    Category(imageName: "XRay", title: "X-Ray", description: "Example description.")
]
