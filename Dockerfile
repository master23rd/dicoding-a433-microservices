# Gunakan Node.js
FROM node:20-alpine

# Folder kerja container
WORKDIR /app

# Salin file dependency
COPY package*.json ./

# Install dependency production
RUN npm install --omit=dev

# Salin source code
COPY . .

# Jalankan dalam mode production
ENV NODE_ENV=production

# Port shipping service
EXPOSE 3001

# Jalankan aplikasi
CMD ["npm", "start"]
