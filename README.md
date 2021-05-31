# Endpoints

## Board

- Crear Board

<p> Crea un tablero, puede contener el id de los jugadores </p>

      POST /boards
      
### Examples

Body
```
{
    "player_x" : "1",
    "player_o" : "2"
}
```

<p> Tambien se puede crear un tablero sin jugadores asociados (cuando no están logeados), en éste caso el body irá vacio </p>

- Realizar movimiento

<p> Realiza un movimiento en el casillero indicado, por el jugador indicado </p>

    POST /boards/move

### Examples
Body
```
{
    "id" : "1",
    "square" : "square00",
    "player" : "X"
}
```
