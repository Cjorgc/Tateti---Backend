# Endpoints

## Users

- Registrar Usuario

<p>Registra un usuario, especificando, username, name y password
      
      POST /users/register
 
### Examples
```   
{
  "username":"jorgc987",
  "name": "jorgc",
  "password":"123456789"
}
```      
### Succes Response
Response
 ```  
{
"token": "9CJv28tbI-Q-ikD02JEWUQ"
}     
  ```      
- Login
<p>Logea un usuario y le devuelve el token generado <p/>

### Examples
```   
{
    "username" : "touma7897819",
    "password" : "123456789"
}
```      
-   Mostrar usuario

<p> Muestra un usuario con sus atributos y boards correspondientes</p>
      
      GET /users/current_id
### Examples

url

``` 
/users/1

``` 

### Response
``` 
{
      "id": 1,
      "username": "touma987",
      "name": "jorgc",
      "password": "123456789",
      "token": "8fsdKgPRFtg_oOnvlSfKmA",
      "created_at": "2021-05-31T17:52:03.680Z",
      "updated_at": "2021-05-31T17:52:03.680Z",
      "boards":[
            {"id": 1, "square00": "X", "square01": null, "square02": null, "square10": null,…}
            ]
      }
``` 
      
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
### Success Response

Response
```
{
      "id": 1,
      "square00": null,
      "square01": null,
      "square02": null,
      "square10": null,
      "square11": null,
      "square12": null,
      "square20": null,
      "square21": null,
      "square22": null,
      "next_player_expected": "X",
      "finished": false,
      "winner": null,
      "player_x_id": 1,
      "player_o_id": 2
}
```
<p> Tambien se puede crear un tablero sin jugadores asociados (cuando no están logeados), en éste caso el body irá vacio </p>

- Realizar movimiento

<p> Realiza un movimiento en el casillero indicado, por el jugador indicado. Tambien se le debe pasar el id del board</p>

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

### Success Response

Response

```
{
      square00": "X",
      "winner": null,
      "finished": false,
      "next_player_expected": "O",
      "id": 1,
      "square01": null,
      "square02": null,
      "square10": null,
      "square11": null,
      "square12": null,
      "square20": null,
      "square21": null,
      "square22": null,
      "player_x_id": 1,
      "player_o_id": 2
}
```
