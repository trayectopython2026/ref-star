from app.database import conectar
from app.models.personaje import Personaje


CONSULTA_PERSONAJES = """
    SELECT p.id,p.nombre,p.descripcion,p.imagen, c.nombre AS categoria, 
    e.nombre AS especie,pl.nombre AS planeta 
    FROM personajes p
    INNER JOIN categorias c 
    ON p.categoria_id = c.id
    INNER JOIN especies e 
    ON p.especie_id = e.id
    INNER JOIN planetas pl
    ON p.planeta_id = pl.id
"""


# Mostrar las categorias

def listar_categorias():
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)

    try:
        cursor.execute("SELECT nombre FROM categorias ORDER BY id")
        filas = cursor.fetchall()
        categorias  = []

        for fila in filas:
            categorias.append(fila['nombre'])
        return categorias
    finally:
        cursor.close()
        conexion.close()


def listar_personajes(nombre='' , categoria=''):
    conexion = conectar()
    cursor = conexion.cursor(dictionary=True)

    try:
        # %s marcado de posicion
        sql = CONSULTA_PERSONAJES + ' WHERE p.nombre LIKE %s'
        parametros = ['%' +  nombre + '%' ] 
        if categoria != '':
            sql += ' AND c.nombre = %s'
            parametros.append(categoria)
        sql += ' ORDER BY p.nombre'

        cursor.execute(sql, parametros)
        # convertir en array lo que viene de la base de datos y trae 
        filas = cursor.fetchall()
        personajes = []
        for fila in filas:
            personaje = Personaje(
                fila['id'], fila['nombre'], fila['categoria'],
                fila['especie'], fila['planeta'], fila['descripcion'], fila['imagen']
            )
            personajes.append(personaje)
        return personajes
    finally:
        cursor.close()
        conexion.close()


    