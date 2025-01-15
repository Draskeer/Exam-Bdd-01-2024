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

L'application utilise des requêtes SQL construites à partir de chaînes de caractères. Cela rend l'application vulnérable aux attaques par injection SQL. Un attaquant pourrait modifier les requêtes SQL pour accéder à des données sensibles ou les supprimer.

Nous allons tenté d'injecter du code SQL pour récupérer des données que l'endpoint ne devrait pas nous donner de cette façon.

[VOIR PHOTO JOITNE DANS LE REPO] - injection.png

Dans cette requête, nous allons essayer de récupérer les données du premier produit de la table products aulieu de récupérer les données du produit avec l'id 3.
Cela montre qu'il est possible de récupérer des données sensibles de la base de données. Cette attaque précise est une attaque de type "SQL Injection".
Cette vultnérabilité est très dangereuse car elle permet à un attaquant de récupérer des données sensibles de la base de données.
Si nous avion ajouté une option de connexion à l'application, l'attaquant aurait pu utilis cette faille se connecter en tant qu'admin.

1.2 Manque de validation des champs

L'application ne vérifie pas les données entrées par l'utilisateur. Cela peut entraîner des erreurs ou des comportements inattendus. Par exemple, l'utilisateur peut entrer des quantités négatives ou des champs vides.
Il est important de valider les données entrées par l'utilisateur pour garantir la cohérence des données et éviter les erreurs.

Dans la v2 de l'application, nous devons mettre en place une validation des données entrées par l'utilisateur. Nous devons vérifier que les données sont conformes aux attentes et qu'elles respectent les contraintes métier.

2. Les améliorations possibles

2.1 Requêtes paramétrées ou procédures stockées

Pour éviter les attaques par injection SQL, nous devons utiliser des requêtes paramétrées ou des procédures stockées. Cela permet de séparer les données des requêtes SQL et d'éviter les attaques par injection SQL.
Nous allons normalement utiliser des procédures stockées pour les requêtes.
Les procédures stockées sont des blocs de code SQL qui sont stockés dans la base de données et peuvent être appelés par l'application. Cela permet de centraliser la logique métier et de garantir la sécurité des données.

2.2 Vérifications métier

Il est important de mettre en place des vérifications métier pour garantir la cohérence des données. Par exemple, nous devons vérifier que la quantité commandée est inférieure ou égale au stock disponible.
Cela sera fais directement dans les procédures stockées et dans des fonctions de l'application.

En conclusion, l'audit de la V1 de l'application de gestion de stock a révélé des failles de sécurité et des améliorations possibles. Il est important de mettre en place des mesures de sécurité pour protéger les données et des vérifications métier pour garantir la cohérence des données. Ces améliorations permettront d'améliorer la qualité de l'application et de garantir la satisfaction de nos employé.
