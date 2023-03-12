prepare: docker rmi -f $(docker images -q) && docker system prune -f
RUN rm -rf /var/lib/apt/lists/*
-layers
-cache
-dockerignore