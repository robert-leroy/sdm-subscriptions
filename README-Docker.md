# SDM Subscriptions - Docker Setup

This document explains how to run the SDM Subscriptions Vue.js application using Docker.

## 🐳 Docker Files Overview

- `Dockerfile` - Production-ready multi-stage build with Nginx
- `Dockerfile.dev` - Development container with hot reload
- `docker-compose.yml` - Orchestrates services for easy deployment
- `.dockerignore` - Optimizes Docker build context

## 🚀 Quick Start

### Production Build

```bash
# Build and run the production container
docker-compose up --build

# Or build and run manually
docker build -t sdm-subscriptions .
docker run -p 8080:80 sdm-subscriptions
```

Access the application at: **http://localhost:8080**

### Development with Hot Reload

```bash
# Run development container with hot reload
docker-compose --profile dev up sdm-subscriptions-dev

# Or run manually
docker build -f Dockerfile.dev -t sdm-subscriptions-dev .
docker run -p 3000:8080 -v $(pwd):/app -v /app/node_modules sdm-subscriptions-dev
```

Access the development server at: **http://localhost:3000**

## 📦 Container Details

### Production Container
- **Base Image**: nginx:alpine
- **Size**: ~50MB (optimized multi-stage build)
- **Port**: 80 (mapped to 8080 on host)
- **Features**:
  - Gzip compression
  - Security headers
  - Vue Router support (SPA routing)
  - Static asset caching
  - Health checks

### Development Container
- **Base Image**: node:20-alpine
- **Port**: 8080 (mapped to 3000 on host)
- **Features**:
  - Hot module replacement (HMR)
  - Volume mounting for real-time code changes
  - All development dependencies

## 🔧 Environment Variables

The application supports environment variables through `.env` files:

```env
VITE_APP_TITLE="SDM Subscriptions"
VITE_APP_TITLE_SHORT="SDM Subs"
VITE_APP_BASE_URL="./"
```

## 🛠 Build Commands

```bash
# Build production image
docker build -t sdm-subscriptions .

# Build development image
docker build -f Dockerfile.dev -t sdm-subscriptions-dev .

# Run with docker-compose
docker-compose up --build

# Run development mode
docker-compose --profile dev up --build

# Stop all containers
docker-compose down
```

## 📋 Health Check

The production container includes a health check that verifies the Nginx server is responding:

```bash
# Check container health
docker ps

# View health check logs
docker inspect sdm-subscriptions-app | grep Health -A 10
```

## 🔒 Security Features

- Non-root user execution
- Security headers (X-Frame-Options, X-Content-Type-Options, X-XSS-Protection)
- Hidden files protection
- Gzip compression for performance
- Static asset caching with immutable headers

## 📁 File Structure

```
.
├── Dockerfile              # Production multi-stage build
├── Dockerfile.dev          # Development container
├── docker-compose.yml      # Service orchestration
├── .dockerignore           # Build optimization
└── README-Docker.md        # This file
```

## 🚨 Troubleshooting

### Common Issues

1. **Port already in use**:
   ```bash
   # Change port in docker-compose.yml or use different port
   docker run -p 8081:80 sdm-subscriptions
   ```

2. **Hot reload not working**:
   - Ensure volume mounting is correct
   - Check that ports are properly exposed
   - Verify Vite server is binding to 0.0.0.0

3. **Build fails**:
   ```bash
   # Clear Docker cache and rebuild
   docker system prune
   docker-compose up --build --force-recreate
   ```

### Performance Tips

- Use `.dockerignore` to exclude unnecessary files
- Multi-stage builds keep production images small
- Enable gzip compression in Nginx
- Use proper caching headers for static assets

## 🎯 Next Steps

- Set up CI/CD pipeline with Docker
- Configure reverse proxy for multiple environments
- Add SSL/TLS termination
- Implement logging and monitoring