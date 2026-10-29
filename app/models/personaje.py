class Personaje:
    def __init__(self,id,nombre,categoria,especie,planeta,descripcion,imagen):
        self.id = id
        self.nombre = nombre
        self.categoria = categoria
        self.especie = especie
        self.planeta = planeta
        self.descripcion= descripcion
        self.imagen = imagen


    def resumen(self):
        if len(self.descripcion) > 100:
            return self.descripcion[:100] + '...'
        return self.descripcion
        