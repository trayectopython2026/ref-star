import mysql.connector

def conectar():
    return mysql.connector.connect(
        host='127.0.0.1',
        port = 3306,
        user='root',
        password='',
        database='star_wars_aula',
        charset= 'utf8mb4',
        # Implementacion interna con python
        use_pure=True
    )



