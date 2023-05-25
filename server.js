require('dotenv').config();

//Creamos el servidor
const express = require('express');
const app = express();
const tasks = require('./tasks.json');

////// los midelware siempre tienen que estar entre el app.listener y la creacion del servidor

//midelware que lista las tareas
app.get('/taks', (req, res, next) => {
  try {
    if (tasks.lenght < 1) {
      const err = new Error('No se han encontrado taresa');
      err.httpStatus = 404;
      throw err;
    }
    res.send({
      status: 'ok',
      data: { tasks },
    });
  } catch (err) {
    next(err);
  }
});

////////////SIEMPRE EN EL FINAL DEL TODO///////////////////

//Midelware de ruta no encontrada
app.use((req, res) => {
  res.status(404).send({
    status: 'error',
    mesage: 'Ruta no encontrda',
  });
});
//midelware error
app.use((err, req, res, next) => {
  console.error(err);

  res.status(err.httpStatus).send({
    status: 'error',
    message: err.message,
  });
});

app.listen(process.env.PORT, () => {
  console.log(`Server running at http://localhost:${process.env.PORT}`);
});
