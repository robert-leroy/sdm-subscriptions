# Multi-stage build for Vue.js + Vite application
# Stage 1: Build the application
FROM node:24-alpine AS build-stage

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Start and enable SSH
RUN apk add openssh 
RUN echo "root:Docker!" | chpasswd 
RUN chmod +x /api/entrypoint.sh 
RUN cd /etc/ssh/ 
RUN ssh-keygen -A

COPY sshd_config /etc/ssh/
COPY entrypoint.sh /api/entrypoint.sh

# Install dependencies
RUN npm ci --only=production=false

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production server with Nginx
FROM nginx:alpine AS production-stage

# Copy custom nginx configuration
COPY <<EOF /etc/nginx/conf.d/default.conf
server {
    listen 80;
    listen [::]:80;
    server_name localhost;

    root /usr/share/nginx/html;
    index index.html;

    # Gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_proxied expired no-cache no-store private must-revalidate auth;
    gzip_types text/plain text/css text/xml text/javascript application/javascript application/xml+rss application/json;

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;

    # Handle client-side routing (Vue Router)
    location / {
        try_files \$uri \$uri/ /index.html;
    }

    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # Security: Don't serve hidden files
    location ~ /\. {
        deny all;
    }
}
EOF

# Copy built application from build stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80 2222

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]