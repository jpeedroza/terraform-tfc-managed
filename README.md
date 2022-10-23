# Terraform Cloud Plataform Managed

Módulo de Terraform para gerenciamento e gestão do meu [Terraform Cloud](https://app.terraform.io/). Todo o funcionamento desse repositório se da por um [values.yaml](config/values.yaml) específicando todos os resources que deverão ser criados.

## Providers
 
| Nome | Versão |
|------|--------|
| [tfe](https://registry.terraform.io/providers/hashicorp/tfe/0.37.0) | ~> 0.37.0 |
| [local](https://registry.terraform.io/providers/hashicorp/local/2.2.3) | ~> 2.2.0 |

### Objects

| Nome | Tipo |
|------|------|
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/local_file) | data |

### Inputs

| Nome | Descrição | Tipo | Valor padrão | Obrigatório |
|------|-----------|------|--------------|-------------|
| tfc_token | Token do usuário no Terraform Cloud. | `string` | n/a | **Sim** |

## Modules

Utilizado dois módulos internos sendo eles:
- [Workspaces](module/workspace/) para gerenciamento dos workspaces.
- [Organization](module/organization/) para gerenciamento das organizations.

### Organization

#### Objects

| Nome | Tipo |
|------|------|
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_organization) | resource |
| [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_variable_set) | resource |
| [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_variable_set) | resource |

#### Inputs

| Nome | Descrição | Tipo | Valor padrão | Obrigatório |
|------|-----------|------|--------------|-------------|
| name | Nome da Org para ser criada no Terraform Cloud. | `string` | n/a | **Sim** |
| email | Email para associar a Org criada. | `string` | n/a | **Sim** |
| variable_list | Lista de objeto contendo configurações a respeito das variáveis globais da Org. | `list(object(...))` | n/a | **Sim** |

#### Outputs

| Nome | Descrição |
|------|-----------|
| organization_name | Nome da Org criada. |
| organization_id | ID da Org criada. |
| variable_set_name | Lista de nome do grupo de variáveis globais da Org. |
| variable_set_id | Lista de ID do grupo de  variáveis globais da Org. |
| variable_set_list | Lista de objetos contendo o ID e nome do grupo de variáveis globais da Org. |
| variable_id | Lista de ID das variáveis globais da Org. |


### Workspaces

#### Objects

| Nome | Tipo |
|------|------|
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_workspace) | resource |
| [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_variable) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/tfe_workspace_variable_set) | resource |

#### Inputs

| Nome | Descrição | Tipo | Valor padrão | Obrigatório |
|------|-----------|------|--------------|-------------|
| organization_name | Nome da Org para associar as workspaces criadas. | `string` | n/a | **Sim** |
| terraform_version | Versão do terraform que o workspace utilizará. | `string` | n/a | **Sim** |
| workspace_content | Lista de objeto contendo configurações a respeito dos workspaces. | `list(object(...))` | n/a | **Sim** |
| organization_variable_set_id | Lista de objeto contendo configurações a respeito das variáveis globais do workspace. | `list(object(...))` | n/a | **Sim** |

#### Outputs

Sem nenhum no momento

## :memo: Licença

[Apache](LICENSE)
