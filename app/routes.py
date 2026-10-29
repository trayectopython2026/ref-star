from flask import render_template
from app import app
from app.utilities.personajes import (
    listar_categorias, listar_personajes
)

@app.route('/')
def index():
    categorias = listar_categorias()
    personajes = listar_personajes()
    # [:4] toma los ultimos cuatro objetos como vista previa del catalogo
    return render_template('index.html',categorias = categorias ,  personajes= personajes[:4] , titulo="Inicio")


@app.route('/personajes')
def personajes():
    return render_template('personajes.html', titulo="Personajes")
    


@app.errorhandler(404)
def pagina_no_encontrada(error):
    return  render_template('404.html', titulo='Pagina no encontrada'),404

