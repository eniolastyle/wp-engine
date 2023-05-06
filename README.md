

# WP Engine Terraform Module

This Terraform module deploys a WordPress site on WP Engine.

## Outputs
![Screenshot from 2023-05-06 14-23-46](https://user-images.githubusercontent.com/58726365/236627683-4d97aa62-ff31-4df0-b0b8-5b2aeb37f418.png)
![Screenshot from 2023-05-06 14-24-00](https://user-images.githubusercontent.com/58726365/236627688-5bb65992-d717-47f7-83c5-520bbc1f1060.png)

## Usage

```hcl
module "wp_engine" {
  source        = github.com/eniolastyle/wp-engine"
  ami           = data.aws_ami.ubuntu.id
  db            = var.db
  user          = var.user
  pass          = var.pass
  region        = var.region
  key_name      = var.key_name
  instance_type = var.instance_type
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `db` | The Database nam | `string` | n/a | Yes |
| `user` | The user profile | `string` | n/a | Yes |
| `pass` | The password for the db | `string` | n/a | Yes |


## Outputs

| Name | Description |
|------|-------------|
| `wp_url` | The URL of the WordPress site |


## License

This code is licensed under the MIT License. See `LICENSE` for more information.
```

