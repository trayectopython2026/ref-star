from flask import render_template
from app import app
from app.utilities.personajes import (
    listar_categorias
)

@app.route('/')
def index():
    categorias = listar_categorias()
    return render_template('index.html',categorias = categorias ,  titulo="Inicio")
    

