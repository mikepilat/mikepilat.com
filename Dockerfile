# syntax=docker/dockerfile:1

# Static output is architecture-independent; build it on the runner's platform.
FROM --platform=$BUILDPLATFORM oven/bun:1.4.2-alpine@sha256:d888c0ae6c86d7866ff10c5aafdd9077b36aee6455b33dd270fb93c0dd5cef6f AS build
WORKDIR /app
ENV ASTRO_TELEMETRY_DISABLED=1
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile
COPY astro.config.mjs tsconfig.json ./
COPY src/ ./src/
COPY public/ ./public/
RUN bun run build

FROM nginxinc/nginx-unprivileged:stable-alpine@sha256:442753882674b49ae2c1de83ed67896131c0777f56df5005e356e62bc3f7e7ce
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/ /site/
USER 101:101
EXPOSE 8080
# No entrypoint scripts or runtime configuration writes are needed.
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
