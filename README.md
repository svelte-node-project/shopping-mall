# Aurora Shopping Mall Web Application

The Aurora Shopping Mall Web App offers a diverse range of features to enhance the shopping experience. Users can explore the latest offers, upcoming events, stores, and dining options, and search for their desired stores. With its user-friendly interface and intuitive navigation, the app aims to cater to the diverse needs of shoppers, ensuring convenience and satisfaction.

## Tech Stack

The technology stack for this project includes:

- **Backend**:
  - Node.js for building the backend server.
  - PostgreSQL as the database for storing data.
  - Flyway for versioning and managing database migrations.
  - Docker Compose for containerization and orchestration.

- **Frontend**:
  - Svelte Kit for building the user interface.
  - Tailwind CSS for styling the components.


## Project structure

The project is organized into the following main directories:

```
.
├── app                 # Backend application
│   ├── controllers     # Controllers for handling API requests
│   ├── database        # Database connection pool and configuration
│   ├── requests        # Testing REST APIs using VS Code extension
│   └── routes          # Routes for building API endpoints
├── flyway              # Flyway for versioning and managing database migrations
└── svelte-ui           # Frontend application
    ├── src             # Source files
    │   ├── components  # Svelte components for building the UI
    │   ├── helpers     # Helper functions used across the UI components
    │   ├── http-actions# HTTP actions for making API requests from the frontend
    │   └── routes      # Svelte routes for defining the application routes
    └── static          # Static assets
        └── images      # Static images used in the UI
```

## Running the Application

1. Clone the repository:

   ```bash
   git clone git@github.com:svelte-node-project/shopping-mall.git
   ```

2. Navigate to the project directory:

   ```bash
   cd shopping-mall
   ```

3. Run the Docker-compose

   ```bash
   docker-compose up -d
   ```

4. Access the web application in your browser at http://localhost:5173
