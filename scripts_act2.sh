#! a. Crear el torneo con fechas de inicio y final.
db.periodoTorneo.insert({"Fecha Inicial":"20/04/2024","Fecha Final":"18/05/2024"})

#! b. Inscribir, modificar y eliminar equipos.
db.equipos.insert({"Nombre":"Tiburones FC","Ciudad":"Santa Marta","Año":2005})

db.equipos.update({_id:ObjectId("61d7add6272dcce41b4ba6cd")}, {$set:{"Ciudad":"Cali"}})

db.equipos.deleteOne({"_id": ObjectId("61d7add6272dcce41b4ba6cd")})

#! c.Inscribir, modificar y eliminar deportistas a los equipos.
db.deportistas.insert({"Nombres": "Juan",
"Apellidos": "López Martínez",
  "Edad": 24,
  "Cedula": 1012354879,
  "Celular": 3106547890,
  "Equipo": "Tigres FC",
  "Ranking": 7.2,
  "Nacionalidad": "Mexicano",
  "Ciudad": "Guadalajara" })

db.deportistas.update({"_id": ObjectId("61d7214433c9f0547630c55c")},{
                       $set: {
                                "Nombres": "Carlos",
                                "Apellidos": "Lopez Sánchez"
                            }
                       })

db.deportistas.deleteOne({"_id": ObjectId("61d7214433c9f0547630c55c")})

#! d.Crear, modificar  y eliminar encuentros deportivos.
db.encuentros.insert({"Fecha": "04/05/2024",
                       "Hora": "10:30 am",
                       "Lugar": "Estadio Metropolitano",
                       "Equipo Local": "Tigres FC",
                       "Equipo Visitante": "Águilas SC",
                       "Estado": "Por jugar",
                       "Resultado Final": "Por definir",
                       "Arbitros": [
                           "Laura Torres Paz",
                           "Juan David Parra Perez"
                       ]})

db.encuentros.update({"_id": ObjectId("61d725fb33c9f0547630c55f")},{
                       $set: {
                                "Estado": "Jugado",
                                "Resultado Final": "Victoria visitante"
                            }
                       })

db.encuentros.deleteOne({"_id": ObjectId("61d725fb33c9f0547630c55f")})


#! e.Registrar resultados de eventos deportivos.
db.tablaPosiciones.insert({"Posición": 3,
                           "Equipo": "Tigres FC",
                           "Partidos Jugados": 3,
                           "Victorias": 1,
                           "Empates": 1,
                           "Derrotas": 1,
                           "Puntos": 4})

#! f.Reportar el ranking de los deportistas con mejor rendimiento
db.deportistas.find({"Ranking": { $gte: 8 }}, {"_id": 0, "Nombres": 1, "Apellidos": 1, "Ranking": 1}).sort({"Ranking": -1})