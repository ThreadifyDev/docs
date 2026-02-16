FROM node:20-alpine

# Create non-root user
RUN addgroup -g 1001 -S mintlify && \
    adduser -u 1001 -S mintlify -G mintlify

WORKDIR /app

# Install Mintlify CLI globally
RUN npm install -g mintlify@latest

# Copy documentation files
COPY --chown=mintlify:mintlify . .

# Switch to non-root user
USER mintlify

EXPOSE 3000

# Run mintlify dev server
CMD ["mintlify", "dev", "--host", "0.0.0.0", "--port", "3000"]
