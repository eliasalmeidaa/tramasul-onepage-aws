# TramaSul Têxtil — One-Page na AWS (LAB11 Projeto Cloud · Case 1)

One-page da TramaSul Têxtil (Têxtil/Vestuário) publicada em Amazon EC2 com pipeline CI/CD no GitHub Actions e container Docker.

## Arquitetura
```
git push (main)
   │
   ▼
GitHub Actions
   ├─ CI: valida arquivos → docker build → smoke test do container
   └─ CD: push da imagem no GHCR (ghcr.io) → aguarda a EC2 servir a nova versão
                                   │
                                   ▼
             EC2 (Amazon Linux + Docker)
             ├─ container tramasul (nginx, porta 80)
             └─ Watchtower: detecta a nova imagem e reimplanta
```

## Arquivos
- `index.html` — one-page (rótulo da instância no rodapé: `INSTANCE_LABEL`)
- `Dockerfile` — imagem nginx:alpine com a página e `version.txt` (SHA do commit)
- `.github/workflows/ci-cd.yml` — pipeline CI/CD
- `ec2-user-data.sh` — user data da EC2 (instala Docker, sobe a página e o Watchtower)

## Configuração
- Variável do repositório `EC2_HOST` = IP público da EC2
- Nenhum secret manual: o push no GHCR usa o `GITHUB_TOKEN` do Actions
