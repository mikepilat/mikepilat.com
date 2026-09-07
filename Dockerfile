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

FROM nginxinc/nginx-unprivileged:stable-alpine@sha256:9b87ad3dd9f431c733f19dfb278c7eb3dba9dca381942c79818bb42f1a566a83
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/ /site/
USER 101:101
EXPOSE 8080
# No entrypoint scripts or runtime configuration writes are needed.
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
