FROM ghcr.io/gitroomhq/postiz-app:latest

# Railway injects PORT env var into every container for routing.
# Postiz nginx is hardcoded to port 5000; backend reads process.env.PORT || 3000.
# Without this override, Railway's PORT causes the backend to conflict with nginx.
# This CMD starts nginx, then overrides PORT=3000 for the backend via exec.
CMD ["sh", "-c", "nginx && PORT=3000 exec pnpm run pm2"]
