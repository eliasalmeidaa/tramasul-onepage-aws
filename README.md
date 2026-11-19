# TramaSul Têxtil — One-Page na AWS (LAB11 Projeto Cloud · Case 1)

One-page da TramaSul Têxtil (Têxtil/Vestuário) publicada em Amazon EC2 com pipeline CI/CD no GitHub Actions e container Docker.

## Arquitetura
GitHub (código) → GitHub Actions (CI: build + teste do container → CD: push no Docker Hub + deploy via SSH) → EC2 (Docker + Nginx, porta 80)

## Arquivos
- `index.html` — one-page (rótulo da instância no rodapé: `INSTANCE_LABEL`)
- `Dockerfile` — imagem nginx:alpine com a página
- `.github/workflows/ci-cd.yml` — pipeline CI/CD
- `ec2-user-data.sh` — script de inicialização da EC2 (instala Docker)

## Secrets do repositório
`DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`, `EC2_HOST`, `EC2_USER` (ec2-user), `EC2_SSH_KEY` (conteúdo do .pem)
