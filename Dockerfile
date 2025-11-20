# Nginx asosida yengil va tez ishlaydigan image
FROM nginx:alpine

# Metadata
LABEL maintainer="shukhrat@clinic-simulator.uz"
LABEL description="Clinic Simulator - What-If Analysis Tool"

# HTML faylni nginx papkasiga ko'chirish
COPY clinic-simulator.html /usr/share/nginx/html/index.html

# Custom nginx config (ixtiyoriy)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Port ochish
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Nginx avtomatik ishga tushadi (default CMD)