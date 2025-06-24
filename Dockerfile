# Dockerfile for CoupleScript Programming Language
# Creates a complete environment to build and run CoupleScript on any platform

FROM ubuntu:22.04

# Set non-interactive frontend to avoid timezone prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    nasm \
    make \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /couplescript

# Copy source code
COPY . .

# Build CoupleScript
RUN make clean && make all

# Create a non-root user for security
RUN useradd -m -s /bin/bash couplescript
RUN chown -R couplescript:couplescript /couplescript
USER couplescript

# Set environment variables
ENV PATH="/couplescript:${PATH}"

# Default command - start interactive mode
CMD ["./couplescript"]

# Expose no ports by default (language doesn't need network)
# EXPOSE 8080

# Labels for metadata
LABEL maintainer="CoupleScript Team"
LABEL description="The romantic programming language that makes coding fun!"
LABEL version="1.0"
LABEL org.opencontainers.image.title="CoupleScript"
LABEL org.opencontainers.image.description="A relationship-themed programming language"
LABEL org.opencontainers.image.version="1.0"
LABEL org.opencontainers.image.vendor="CoupleScript"
LABEL org.opencontainers.image.licenses="MIT"
