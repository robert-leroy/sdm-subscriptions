# Multi-stage build for Vue.js + Vite application
# Stage 1: Build the application
FROM node:24-alpine AS build-stage

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production=false

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production server with Nginx
FROM nginx:alpine AS production-stage

COPY sshd_config /etc/ssh/
COPY entrypoint.sh /app/entrypoint.sh

# Start and enable SSH
RUN apk add openssh 
RUN echo "root:Docker!" | chpasswd 
RUN chmod +x /app/entrypoint.sh 
RUN cd /etc/ssh/ 
RUN ssh-keygen -A

# Copy built application from build stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80 2222

# Start Nginx
ENTRYPOINT ["/app/entrypoint.sh"]