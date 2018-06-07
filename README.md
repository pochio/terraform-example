
# Terraform = GCP example

- [packer + ansible](https://github.com/pochio/packer-example) でイメージを作成
- main.tf のプロジェクト・バックエンドを修正
- variable.tf を適用に編集
- SSL証明書が必要なら置く
- デプロイ

```bash
$ export GOOGLE_APPLICATION_CREDENTIALS='account.json
$ terraform init
$ terraform paln
$ terraform apply
```

