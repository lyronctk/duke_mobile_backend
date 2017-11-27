# Duke Mobile Backend

### *Helped in the development of a back end for Duke University (Sophomore year - High school). Utilizes JSON format, http requests, CRUD operations, etc.

### Reponse Formats

#### Success

```json
{
  "success": true,
  "data": {}
}
```

#### Failure

```json
{
  "success": false,
  "errors": [
    {
      "pointer": "path/to/error/in/request",
      "message": "This is the message to the user",
      "reason": "This is the message to the developer"
    }
  ]
}
```

    POST /api/v1/registrations # => RegistrationsService
    POST /api/v1/emails_confirmations # => ConfirmationService
    POST /api/v1/password_resets # => CreatePasswordService
    PUT /api/v1/password_resets # => UpdatePasswordService

    Read: GET /api/v1/users/:user_id/files/:file_id
    Read All: GET /api/v1/users/:user_id/files?query_params
    Create: POST /api/v1/users/:user_id/files
    Update: PATCH /api/v1/users/:user_id/files/:file_id
    Delete: DELETE /api/v1/users/:user_id/files/:file_id

### General Reference

Create: POST /resources
Read: GET /resources/:id
Read All: GET /resources
Update: PUT /resources/:id
Delete: DELETE /resources/:id
