//
//  DataManager.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 29/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation

public class DataManager:NSObject {
    
     static let instance:DataManager = DataManager()
    
    
     let calorias = ["50 Kcal","100 Kcal","120 Kcal","500 Kcal","600 Kcal","10 Kcal","250 Kcal","400 Kcal","300 Kcal","400 Kcal","250 Kcal","340 Kcal","190 Kcal","120 Kcal","80 Kcal","400 Kcal","450 Kcal","350 Kcal","100 Kcal","500 Kcal","200 Kcal","70 Kcal","200 Kcal","90 Kcal","300 Kcal"]
    
    var ejercicios:[String:[String]] = [
        "Rutina de Pectorales":["Press de Banca","Aperturas con Mancuernas","Fondos en Paralelas","Press Inclinado","Cruce de Poleas","Flexiones","Contractor","Press Mancuernas","Peck Deck","Press Declinado","Pull Over","Abdominales"],
        "Rutina de Hombros":["Press Militar","Pajaros con Mancuerna","Elevaciones Laterales","Elevaciones a un Brazo","Encogimientos de Hombro","Press Trasnuca","Apertura invertida en polea","Abdominales"],
        "Rutina de Piernas":["Sentadillas","Prensa Inclinada","Extensiones de Cuadriceps","Extensiones de Femoral","Gemelo en Maquina","Zancadas","Sentadillas Bulgaras","Peso Muerto Rumano","Sentadillas Frontales","Abdominales"],
        "Rutina de Espalda":["Jalón tras Nuca","Peso Muerto","Jalón al Pecho","Remo en Barra","Estiramiento de Espalda","Remo con Mancuernas","Hiperextension Lumbar","Dominadas","Abdominales"],
        "Rutina de Biceps":["Curl de Biceps en Barra","Press Alterno Mancuernas","Press Martillo Mancuernas","Curl Concentrado","Dominadas Supinas","Curl cerrado con Cable","Extensiones Invertidas","Curl Banco Scott","Curl Acostado","Flexiones en polea Alta"],
        "Rutina de Triceps":["Jalones con Barra","Jalones en Polea Cuerda","Extensiones Invertidas","Fondos entre Bancos","Patadas Traseras","Press Francés","Flexiones en Paralelas","Extensiones sentado encima de Cabeza"],
        "Rutina de Cardio":["Bicicleta","Eliptica","Remar","Natacion","Padel","Tenis","Hit","Running"],
        "Rutina de Crossfit":["Sentadillas","OverHead Squats","Pistol Squats","Burpees","Muscle Ups","Handstand Push Ups","Rowing","Box Jumps","Cluster","Fondos de Anilla","Clean","Jerk","Snatch"],
        "Rutina de Powerlifting":["Sentadillas","OverHead Squats","Pistol Squats","Burpees","Muscle Ups","Handstand Push Ups","Rowing","Box Jumps","Cluster","Fondos de Anilla","Clean","Jerk","Snatch"],
        "Rutina de Definicion":["Bicicleta","Eliptica","Remar","Natacion","Padel","Tenis","Hit","Running"]
    ]
    
    
    
    
}
