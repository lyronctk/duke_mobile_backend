# Duke Mobile Backend

## First Task

rails g model Record user:references schema:string use_case:string data:json

    Read: GET /api/v1/users/:user_id/records/:record_id
    Read All: GET /api/v1/users/:user_id/records?query_params
    Delete: DELETE /api/v1/users/:user_id/records/:record_id
    Create: POST /api/v1/users/:user_id/records
    Update: PATCH /api/v1/users/:user_id/records/:record_id

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
