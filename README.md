
## Cấu trúc thư mục

```
open_project/
├── flake.nix / flake.lock       # dev shell: tailscale, whois, dig (qua direnv)
├── .envrc                        # TF_VAR_do_token — GITIGNORED, không commit
├── terraform/                    # hạ tầng DigitalOcean (droplet, DB, firewall)
├── ansible/                      # playbook deploy lên droplet
├── scripts/
│   ├── RUNBOOK.md                # lịch sử đầy đủ mọi lệnh CLI đã chạy + lỗi/fix
│   └── team-tailscale/           # docker-compose mẫu để team join tailnet không cần cài app native
└── deploy/
    ├── headscale/                # Headscale + Caddy (docker-compose)
    ├── openproject/               # OpenProject + .env (GITIGNORED, chứa password DB thật) — ĐANG DÙNG
    └── jira/                     # giữ lại, không dùng (xem mục 6)
```


## Cho team truy cập

Xem `scripts/team-tailscale/README.md` — hướng dẫn 3 bước để team join tailnet qua Docker (không cần cài app native), cộng thêm bước admin tạo tài khoản OpenProject riêng cho từng người.

