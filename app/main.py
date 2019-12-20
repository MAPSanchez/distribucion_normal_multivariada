from flask import Flask, request, render_template, jsonify
from app import app
import numpy as np
import sys
from .database import Database
from .probabilidad import Probabilidad

sys.setrecursionlimit(999)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/acerca_de', methods=['GET'])
def about():
    return render_template("about.html")


@app.route('/ajax/generar_matriz', methods=['POST'])
def generar_matriz():
    N_variables = int(request.json['N_variables'])
    k = int(request.json['k'])
    lim_inferior = float(request.json['lim_inferior'])
    lim_superior = float(request.json['lim_superior'])

    data = Probabilidad()
    dataset = data.GetDataset(N_variables,k,lim_inferior,lim_superior)
    dataset_rechazados = data.GetDatasetRechazados()
    matriz_covarianza = data.GetMatrizCovarianza()
    determinante = data.GetDeterminante()
    desviacion_estandar = data.GetDEstandar()
    medias = data.GetMedias()
    vector_fx = data.GetFX()
    vector_z = data.GetZ()
    rechazados = data.GetRechazados()
    return jsonify([dataset,matriz_covarianza,determinante,desviacion_estandar,medias,vector_fx,vector_z,dataset_rechazados,rechazados])
