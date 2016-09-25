# Duke Mobile Backend

## Endpoints


### Reponse Formats

#### Success


```json
{
  success: true,
  status: 200,
  data: {},
}
```

#### Failure

```json
{
  success: false,
  status: 422, // Or appropriate HTTP Status Code
  errors: [
    {
      pointer: 'path/to/error/in/request',
      message: 'This is the message to the user',
      reason: 'This is the message to the developer'
    }
  ]
}
```



{}

=> /api/v1/



DELETE
  Session
    id:

POST /api/v1/password_resets
PUT /api/v1/password_resets


Create: POST /resources
Read: GET /resources/:id
Read All: GET /resources
Update: PUT /resources/:id
Delete: DELETE /resources/:id
