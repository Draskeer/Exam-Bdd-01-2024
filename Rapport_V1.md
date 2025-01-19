# Livrable V1:


## Base de données:

<img width="717" alt="SQL MLD" src="https://github.com/user-attachments/assets/45704530-3ef2-4bd2-aa3e-f45c96e17760" />

### Tables :

1. Product:
   
   Id: Int, Clé primaire
   name: Varchar(255)
   price: Int
   quantity: Int
   category_id: Int, Clé étrangère

   Permet le stockage des données liées au différents produits. PAr la suite un champ description pourrait etre ajouter afin de     donner plus d'informations concernant celui ci.

2. Category:
 
   Id: Int, Clé primaire
   name: Varchar(255)

   Permet de stocker les différentes catégories de produits.
   
3. Supplier_product:
   
   Id: Int, Clé primaire
   supplier_id: Int, Clé étrangère
   product_id: Int, Clé étrangère

   Table de jointure permettant de mettre en relation un produit et un revendeur.
   
4. Supplier
   
   Id: Int, Clé primaire
   name: Varchar(255)
   address: Varchar(255)
   email: Varchar(255)
   phone_nb:

   Permet de stocker les informaations concernant les différents revendeurs.
   
5. Product_cmd
   Id: Int, Clé primaire
   product_id: Int, Clé étrangère
   command_id: Int, Clé étrangère
   quantity: Int

   Permet de mettre en relation un élément acheter et la quantitée avec une commande.
   
6. Commande:
   
    Id: Int, Clé primaire
    client_id: Int
    total_price: Int
    command_date: DateTime
    expedition_date: DateTime
    delivery_date: DateTime

    Permet de stocker un historique et le status d'une commande.
    
7. Client:
   
   Id: Int, Clé primaire
   name: Varchar(255)
   age: Int
   email: Varchar(255)
   phone_nb: Int
   address: Varchar(255)

Permet de stocker les informations relative aux clients.



## Scripts SQL:


Vous trouverez les informations liées aux scripts SQL directement dans les fichiers .sql du répertoire.



## API


# API Endpoint for version 1.0.0

## Client

### GET /api/client

Get all clients with all of ther informations.  
**Example Response**:

```json
[
  {
    "id": 1,
    "name": "John Doe",
    "age": 35,
    "email": "john.doe@example.com",
    "phone_nb": 123456789,
    "address": "123 Main Street"
  },
  {
    "id": 2,
    "name": "Jane Smith",
    "age": 29,
    "email": "jane.smith@example.com",
    "phone_nb": 987654321,
    "address": "456 Elm Street"
  }
]
```

---

### GET /api/client/id?id={id}

Get a client by its id with all of ther informations.  
**Example Request**:  
`GET /api/client/id?id=1`

**Example Response**:

```json
{
  "id": 1,
  "name": "John Doe",
  "age": 35,
  "email": "john.doe@example.com",
  "phone_nb": 123456789,
  "address": "123 Main Street"
}
```

---

### POST /api/client

Create a new client.  
**Required Fields**:

- `name` (string)
- `age` (integer)
- `email` (string)
- `phone_nb` (integer)
- `address` (string)

**Example Request**:

```json
{
  "name": "Alice Brown",
  "age": 42,
  "email": "alice.brown@example.com",
  "phone_nb": 654321987,
  "address": "789 Pine Street"
}
```

**Example Response**:

```json
{
  "message": "Client created successfully",
  "client_id": 3
}
```

---

## Category

### GET /api/category

Get all categories with all ther informations.  
**Example Response**:

```json
[
  {
    "id": 1,
    "name": "Electronics"
  },
  {
    "id": 2,
    "name": "Books"
  }
]
```

---

### POST /api/category

Create a new category.  
**Required Fields**:

- `name` (string)

**Example Request**:

```json
{
  "name": "Toys"
}
```

**Example Response**:

```json
{
  "message": "Category created successfully",
  "category_id": 3
}
```

---

## Supplier

### GET /api/supplier/:id

Get a supplier by its id with all ther informations.  
**Example Request**:  
`GET /api/supplier/1`

**Example Response**:

```json
{
  "id": 1,
  "name": "Tech Corp",
  "email": "support@techcorp.com",
  "phone_nb": 123456789,
  "address": "101 Tech Street"
}
```

---

## Product

### POST /api/product

Create a new product.  
**Required Fields**:

- `name` (string)
- `price` (float)
- `category_id` (integer)
- `supplier_id` (integer)

**Example Request**:

```json
{
  "name": "Smartphone",
  "price": 699.99,
  "category_id": 1,
  "supplier_id": 1
}
```

**Example Response**:

```json
{
  "message": "Product created successfully",
  "product_id": 1
}
```

---

## Command

### GET /api/command/id?id={id}

Get a command by its id with all ther informations.  
**Example Request**:  
`GET /api/command/id?id=1`

**Example Response**:

```json
{
  "id": 1,
  "client_id": 1,
  "total_price": 199.99,
  "product_nb": 3,
  "expedition_date": "2025-01-10",
  "delivery_date": "2025-01-15",
  "products": [
    {
      "product_id": 1,
      "name": "Smartphone",
      "price": 699.99,
      "quantity": 1
    },
    {
      "product_id": 2,
      "name": "Laptop",
      "price": 1299.99,
      "quantity": 1
    }
  ]
}

And for all of the endpoint, there is PUT and DELETE methods to update and delete the data.

For the PUT method, the request body is the same as the POST method.

For the DELETE method, the request params is the same as the GET method.
```





Ce document est un audit de la V1 de l'application de gestion de stock. Il a pour but de vérifier la conformité de l'application par rapport aux besoins du client et de proposer des améliorations.

1. Les failles de sécurité

1.1 Injection SQL

Ci-dessous, vous trouverez un exemple d'injection SQL

<img width="603" alt="injection" src="https://github.com/user-attachments/assets/40651568-672d-4dc9-b033-5c76b7101143" />

Pour remedier à cela, il serait judicieux de creer des procedures stocker dans la base de données.


1.2 Manque de validation des champs

L'application ne vérifie pas les données entrées par l'utilisateur. Cela peut entraîner des erreurs ou des comportements inattendus. Par exemple, l'utilisateur peut entrer des quantités négatives ou des champs vides.
Il est important de valider les données entrées par l'utilisateur pour garantir la cohérence des données et éviter les erreurs.

Nous pouvons pour éviter cela mettre en place des vérifications métier pour garantir la cohérence des données.
