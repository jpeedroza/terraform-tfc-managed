# Terraform Cloud Plataform Managed

Módulo de Terraform para gerenciamento e gestão do meu [Terraform Cloud](https://app.terraform.io/).

## Providers
 
| Nome | Versão |
|------|--------|
| [tfe](https://registry.terraform.io/providers/hashicorp/tfe/0.37.0) | ~> 0.37.0 |

## Resources

| Nome | Tipo |
|------|------|
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_organization) | resource |

## Inputs

| Nome | Descrição | Tipo | Valor padrão | Obrigatório |
|------|-----------|------|--------------|-------------|
| tfc_token | Token do usuário no Terraform Cloud. | `string` | n/a | **Sim** |
| tfc_root_org | Organização do Terraform Cloud que armazenará o `tfstate`. | `string` | n/a | **Sim** |
| tfc_root_workspace | Workspace pertencente a organização que executará o script. | `string` | n/a | **Sim** |

## Modules

Utilizado [módulo interno](module/workspace) para gerenciamento dos workspaces.

### Resources

| Nome | Tipo |
|------|------|
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_organization) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_workspace) | resource |
| [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_variable) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_workspace_variable_set) | resource |

### Inputs

Nenhuma até o momento

### Outputs

Nenhum até o momento

## :memo: Licença

[Apache](LICENSE)
