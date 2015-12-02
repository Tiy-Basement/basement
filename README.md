# Basement API

[![Build Status](URL)](URL Travis CI)

[![Code Climate](URL)](URL CodeClimate)

[![Test Coverage](URL)](URL CodeClimate)

Welcome to the Basement API docs!

Special thanks to Terri Chu for the doc template.

Welcome to Basement, where you can keep your group organized!  Basement is a small-group event management system designed with bands in mind.  Using Basement, you can keep track of your groupmate's schedules as well as your own.  Compare calendars to get optimal availability without having to get everyone in the same room!  Get text alerts for important events like practice and gigs, raids, etc.

Future releases will include searchable group databases for finding like-minded groups to party with, one-stop booking and scheduling, and social media connectivity!

These docs are intended to assist front-end developers interested in integrating with the Basement database.  They are organized according to table methods.  Any questions or bug-fixes may be emailed to *insert somebody's email here*.

**Methods**

*Items marked with (a) are admin commands*

* [Registrations and Users](#reg-methods)
    * [Register New User](#reg-registration)
    * [Login User](#reg-login)
    * [Logout User](#reg-logout)
    * [Editing User Info](#reg-edit)
    * [Deleting a User](#reg-delete)
    * [(a)Listing Registered Users](#reg-index)

* [Group Methods](#grp-methods)
    * [Create New Group](#grp-new)
    * [Editing Group Info](#grp-edit)
    * [Delete Group](#grp-delete)



##<a name="reg-methods"></a>Registrations and User Methods

###<a name="reg-registration"></a>Register New User

This allows the creation of a new user with default permissions.

**URL** /signup

**Method** POST

**Request**
    

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| email  | String | ​*(Required)*​  Unique email that actually works |
| password    | String      |  ​*(Required)*​  Password for the user |
| username | String | ​*(Required)*​ A username that you can remember and will identify you throughout the site |
| phone | String | A contact phone number with text capabilities.  THIS MUST BE SENT TO THE SERVER AS A STRING IN THE FOLLOWING FORMAT: "+14045551234" |


**Response**

If successful, you will receive:

    Status Code: 201 - Created
    
```json
    { "user": 
            { "user_id": 1,
              "username": "username appears here"
              "email": "email appears here"
              "phone": "+14045551234"
            }
       "access_token": "The Access-Token for the Owner"
    }
            
```
​*As long as you get the above, the  user is succeesfully created and stored.*​

If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
    {"errors":[
                "Username/Email has already been taken",
                ]
    }
```

###<a name="reg-login"></a>Login User

This allows an already registered user to login to the system.

**URL** /login

**Method** POST

**Request**
    

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username | String | ​*(Required)*​ The username you registered with|
| password    | String      |  ​*(Required)*​  Password for the user |


**Response**

If successful, you will receive:
```A redirect to your profile page```

If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
    {"errors":[
                "Incorrect username/password",
                ]
    }
    
    Or something like that.
```

###<a name="reg-logout"></a>Logout User

This allows an logged-in user to logout, ending their session and making the server pixies very sad :(

**URL** /logout

**Method** GET

**Request**
    
`Just click the button.`


**Response**

If successful, you will receive:

```A redirect to the Welcome page.```

###<a name="reg-edit"></a>Editing User Info

This allows you to update critical user info such as username, email, phone and password.  Eventually, this will also be the route 

**URL** /signup

**Method** PUT

**Request**
    
HEADERS: `Access-Token`

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| email  | String | ​*(Required)*​  Unique email that actually works |
| password    | String      |  ​*(Required)*​  Password for the user |
| username | String | ​*(Required)*​ A username that you can remember and will identify you throughout the site |
| phone | String | A contact phone number with text capabilities.  THIS MUST BE SENT TO THE SERVER AS A STRING IN THE FOLLOWING FORMAT: "+14045551234" |


**Response**

If successful, you will receive:

    Status Code: 200 - OK
    
```json
    { "user": 
            { "user_id": 1,
              "username": "username appears here"
              "email": "email appears here"
              "phone": "+14045551234"
            }
          }
            
```

If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
    {"errors":[
                "<Param> not valid.  Please stop breaking the server.",
                ]
    }
```

###<a name="reg-delete"></a>Deleting A User

This allows the currently logged in user OR a site admin to delete a user from the database entirely.

**URL** /users/:id

**Method** DELETE

**Request**

HEADERS: `Access-Token`

**Response**

If successful, you will receive:

    Status Code: 200 - OK      

If unsuccessful, you will receive:

    Status Code: 400 - NOT OK
    
```json
    {"errors":[
                "You ain't even authorized to do that, shawty.",
                ]
    }
```

###<a name="reg-index"></a>(a)List all Registered Users

This allows the site admin to request a list of ALL registered users to the site.

**URL** /users

**Method** GET

**Request**
    
HEADERS: `Access-Token`


**Response**

If successful, you will receive:

    Status Code: 200 - OK
    
```json
    { "user": 
            { "user_id": 1,
              "username": "username appears here"
              "email": "email appears here"
              "phone": "+14045551234"
            }
       "access_token": "The Access-Token for the Owner"
    }
            
```


If unsuccessful, you will receive:

    Status Code: 400 - NOT OK
    
```json
    {"errors":[
                "You must be a site admin to do this!",
                ]
    }
```

##<a name="grp-methods"></a>Group Methods

###<a name="grp-new"></a>Create a New Group

This allows a registered user to create a new group calendar with themself as the group owner.

**URL** /group

**Method** POST

**Request**
    
HEADERS: `Access-Token`

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| name | String | ​*(Required)*​  Name for group.  This does not need to be unique. |
| category | String | A category type.  Not yet implemented |
| join_password | String | An optional password for allowing users to join the group |
| public | Boolean | Defaults to true.  Turns to false if join_password is given |


**Response**

If successful, you will receive:

    Status Code: 201 - Created
    
```json
    { "group": 
            { "group_id": 1,
              "name": "group name appears here"
              "owner": "owner's username"
              "owner_id": "owner's username"
            }
    }
            
```

If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
    {"errors":[
                "Username/Email has already been taken",
                ]
    }
```

###<a name="grp-edit"></a>Edit Group Info
This allows the owner or admin to edit the basic information of a group, including changing the join password.

**URL** /group/:id

**Method** PUT

**Request**

HEADERS: `Access-Token`
    

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| name | String | ​*(Required)*​  Name for group.  This does not need to be unique. |
| category | String | A category type.  Not yet implemented |
| join_password | String | An optional password for allowing users to join the group |
| public | Boolean | Defaults to true.  Turns to false if join_password is given |


**Response**

If successful, you will receive:

    Status Code: 200 - OK
    
```json
    { "group": 
            { "group_id": 1,
              "name": "username appears here"
              "owner": "owner's username"
              "owner_id": "owner's username"
            }
       "access_token": "The Access-Token for the Owner"
    }
            
```

If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
    {"errors":[
                "Username/Email has already been taken",
                ]
    }
```

###<a name="grp-delete"></a>Delete a Group

This allows the group owner to delete a group from existence, which will also delete the group calendar and all events for group members.

**URL** /group/:id

**Method** DELETE

**Request**
    
HEADERS: `Access-Token`

**Response**

If successful, you will receive:

    Status Code: 200 - OK
    
```json
    The group was deleted. 
    Redirect-to User Profile  
```

If unsuccessful, you will receive:

    Nothing because how can you screw this up?
